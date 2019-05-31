#' phase_diff_mean_c
#'
#' `phase_diff_mean_c` calcultes the phase difference between two x coordinates with a mean centred threshold.
#' Values more than 180 degrees ahead of the mean will be treated as lags, values less than 180 degrees behind mean
#' will be treated as leading
#'
#' @param x1,x2 x coordinates to calculate phase difference between
#' @param lowlim,highlim maximum and minimum expected x values. Defaults apply to degrees in a circle
#' @return Returns a vector of values (between -1 and 1) indicating the phase difference between two x coordinates
#' @examples
#'
#'
#' x1 <- seq(0, 360, 360/4)
#' x2 <- 180
#'
#' phase_diff(x1, x2)
#'
#' @export

phase_diff_mean_c <- Vectorize(function(x1, x2, lowlim = 0, highlim = 360){
  
  angle <- (x2 - x1)/(highlim - lowlim)
  
  # fix values > 1 line
  angle <- sign(angle) * (abs(angle) - floor(abs(angle)))
  
  #get the mean phase difference
  mean_angle <- (mean(x2) - mean(x1))/(highlim - lowlim)
  
  angle_adj <- angle - mean_angle
  
  if(abs(angle_adj) > 0.5){
    angle_adj <- sign(angle_adj) * (1 - abs(angle_adj)) * -1
  }
  
  result <- angle_adj + mean_angle
})
