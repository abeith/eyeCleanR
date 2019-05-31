#' Raw eye-tracking data.
#'
#' A dataset containing raw eye-tracking data from a sequential reading task.
#'
#' @format A data frame with 17750 rows and 4 variables:
#' \describe{
#'   \item{RespID}{identifier for trial}
#'   \item{ms}{time in ms}
#'   \item{x}{x coordinate}
#'   \item{y}{y coordinate}
#' }
"eye_data_noisy"

#' Raw eye-tracking data.
#'
#' A dataset containing raw eye-tracking data from a sequential reading task.
#'
#' @format A data frame with 17750 rows and 4 variables:
#' \describe{
#'   \item{RespID}{identifier for trial}
#'   \item{ms}{time in ms}
#'   \item{x}{x coordinate}
#'   \item{y}{y coordinate}
#' }
"eye_data_clean"

#' Words AOIs for eye_data_noisy and eye_data_clean.
#'
#' A dataset containing AOIs.
#'
#' @format A data frame with 17750 rows and 4 variables:
#' \describe{
#'   \item{row}{line number}
#'   \item{x1,x2,y1,y2}{word position}
#' }
"word_aois"

#' Raw eye-tracking data with x velocity column.
#'
#' A dataset containing raw eye-tracking data from a sequential reading task (`eye_data_clean`)
#' prepared with a line number estimate.
#'
#' @format A data frame with 17750 rows and 4 variables:
#' \describe{
#'   \item{RespID}{identifier for trial}
#'   \item{ms}{time in ms}
#'   \item{x,y}{coordinates in pixels}
#'   \item{vx}{velocity from x position to next x position}
#'   \item{new_line}{new line identifier}
#'   \item{line_num}{line number identifier}
#' }
"eye_dat_vx"
