#' filter_points
#'
#' `filter_points` filters points outside the target area.
#'
#' @param df A data frame containing x and y coordinates
#' @param xmin,xmax,ymin,ymax Minimum and maximum coordinates of target area
#' @param limits a named list of limits including xmin, xmax, ymin, ymax
#' @param x,y x and y variables to use
#' @param margin The margin (in pixels) around the target area you want to include
#' @return Returns a data frame with coordinates outside the target area replaced by NaN values
#' @examples
#'
#'
#' df <- data.frame(x = runif(10, 0, 10), y = runif(10, 0, 10))
#' filter_points(df, 4, 6, 5, 7, margin = 1)
#'
#' @export

# Filter points outside of specified margin
filter_points <- function(df, xmin, xmax, ymin, ymax, limits = NULL, x = x, y = y, margin = 25){
  if(is.list(limits)){
    lim_names <- sort(names(limits))
    lim_names_check <- c("xmax", "xmin", "ymax", "ymin")
    if(identical(lim_names, lim_names_check)){
      x_min <- limits$xmin
      x_max <- limits$xmax
      y_min <- limits$ymin
      y_max <- limits$ymax
    }else{
      stop("limits should be named xmin, xmax, ymin, ymax")
    }
  }else{
    x_min <- xmin
    x_max <- xmax
    y_min <- ymin
    y_max <- ymax
  }

  df %>%
    dplyr::mutate(x = dplyr::if_else(dplyr::between(x, x_min - margin, x_max + margin), x, NaN),
                  y = dplyr::if_else(dplyr::between(y, y_min - margin, y_max + margin), y, NaN))
}
