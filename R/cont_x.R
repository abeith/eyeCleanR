#' cont_x
#'
#' `cont_x` create a continuous seq between the maximum and minimum values of a given vector. This is
#' useful for analysing how much an observed vector deviates from a continuous sequence.
#'
#' @param x vector of coordinates
#'
#' @return Returns a vector of velocities
#' @examples
#'
#'
#' x <- sort(runif(5, 0, 10))
#' cont_x(x)
#'
#' @export

# create continuous x sequence from min(x) to max(x)
cont_x <- function(x){
  xmin <- min(x, na.rm = T)
  xmax <- max(x, na.rm = T)
  by <- (xmax - xmin)/(length(x) - 1)
  seq(xmin, xmax, by)
}
