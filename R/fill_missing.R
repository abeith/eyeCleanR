#' fill_missing
#'
#' `fill_missing` interpolates missing values for the x and y coordinates in a data frame.
#'
#' @param data A data frame containing x and y coordinates with missing values
#' @param ... One or more unquoted variables with missing values
#' @param add_labels add new columns to identify where missing values were
#' @return Returns a data frame with interpolated values replacing missing values
#' @examples
#'
#'
#' x <- c(1:5, NaN, 7:10)
#' y <- c(1:6, NaN, 8:10)
#' df <- data.frame(x = x, y = y)
#' fill_missing(df, x, y)
#'
#' @export

# imputate missing values
fill_missing <- function(data, ..., add_labels = F){
  data <- data %>%
    dplyr::mutate_at(dplyr::vars(...), .funs = list(missing = ~is.na(.))) %>%
    dplyr::mutate_at(dplyr::vars(...), imputeTS::na.interpolation)

  if(add_labels){
    return(data)
  }else{
    return(dplyr::select(data, -dplyr::starts_with("missing")))
  }
}
