#' get_velocity
#'
#' `get_velocity` calculate the velocity of a vector using either the velocity from one point to the next or the method used in the
#' saccades package which calculates velocity based on surrounding points.
#'
#' @param x vector of coordinates to calculate velocity between
#' @param smooth number of leading points to smooth velocity by. If smooth = 1 the output will not be smoothed
#' @param method the method to use. 1 is the velocity to the next point, 2 is based on both previous and next point but ignoring current point.
#'
#' @return Returns a vector of velocities
#' @examples
#'
#'
#' x <- sort(runif(5, 0, 10))
#' x <- c(x, rev(x))
#' get_velocity(x)
#'
#' @export

# Filter points outside of specified margin
get_velocity <- function(x, smooth = 1, method = 1){
  # x velocity
  if(method == 1){
    # velocity of x(i) -> x(i+1)
    vx <- as.numeric(stats::filter(x, c(1, -1)))
    vx <- zoo::na.fill(vx, "extend")
  }else if(method == 2){
    # method used in saccades package: (x(i-1) -> x(i+1))/2 ... but backwards
    vx <- as.numeric(stats::filter(x, 1:-1/2))
    vx <- zoo::na.fill(vx, "extend")
  }else{
    stop(sprintf("No method '%s'", method))
  }

  if(smooth == 1){
    return(vx)
  } else if(smooth > 1){
    # smooth
    vx_smooth <- zoo::rollmean(vx, smooth, na.pad = T, align = "center", na.rm = T)
    vx_smooth[is.na(vx_smooth)] <- vx[is.na(vx_smooth)]

    return(vx_smooth)
  }else{
    stop(sprintf("smooth = %s is not an acceptable value", smooth))
  }
}
