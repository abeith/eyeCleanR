#' phase_diff
#'
#' `phase_diff` calcultes the phase difference between two x coordinates
#'
#' @param x1,x2 x coordinates to calculate phase difference between
#' @param lowlim,highlim maximum and minimum expected x values. Defaults apply to degrees in a circle
#' @return Returns a vector of values (between -0.5 and 0.5) indicating the phase difference between two x coordinates
#' @examples
#'
#'
#' x1 <- seq(0, 360, 360/4)
#' x2 <- 180
#'
#' phase_diff(x1, x2)
#'
#' @export

phase_diff <- Vectorize(function(x1, x2, lowlim = 0, highlim = 360){

  if(!is.na(x1) & !is.na(x2) & x1 >= lowlim & x1 <= highlim & x2 >= lowlim & x2 <= highlim){
    angle <- (x2 - x1)/(highlim - lowlim)
  }else{
    angle <- NaN
  }

  if(is.na(angle)){
    angle
  }else if(abs(angle) > 0.5){
    sign(angle) * (1 - abs(angle)) * -1
  }else{
    angle
  }
})
