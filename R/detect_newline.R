#' detect_newline
#'
#' `detect_newline` can be used to detect the point of a saccade to a new line. Peaks are detected with pracma package
#'
#' @param x vector of velocities along x coordinate from eye-tracking data of sequential reading
#' @param n_lines the number of lines read by the participant
#' @param invert if true multiplies velocities by -1. If velocity of saccades to new lines is negative (i.e. right to left) this should be used
#' @param samp_rate the sample rate of the eye-tracker used
#' @param window the minimum interval new lines should be detected at. 2 would mean new lines must be at least half of the expected interval.
#' @param trial_dur the duration of the trial in seconds
#' @param peakheight the proportion of the maximum velocity to use as a threshold for peak detection
#' @param quiet if true messages and plots will not be generated
#'
#' @return Returns a vector of velocities
#' @examples
#'
#'
#' x <- c(replicate(10, sort(runif(100, 0, 500))))
#' vx <- get_velocity(x)
#' detect_newline(vx, n_lines = 10, samp_rate = 10, trial_dur = 100)
#'
#' @export

# detect a new line: Uses x-velocity plot to estimate when reader moves to a new line
detect_newline <- function(x, n_lines, invert = TRUE, samp_rate = 250, window = 2, trial_dur = 71, peakheight = 0.5, quiet = F){

  if(invert){x <- x * -1}

  # highest peaks likely to be new lines
  mean_saccade_int <- trial_dur/(n_lines - 1)

  # set to fraction of the expected interval: 1000ms; 250Hz;
  min_peak_dist <- mean_saccade_int * samp_rate / window
  if(!quiet) cat(sprintf("Minimum time between new line saccades is %0.2f seconds\n", min_peak_dist / samp_rate))

  # threshold
  min_peak_height <- peakheight * max(x, na.rm = T)
  if(!quiet) cat(sprintf("Minimum peak height is %0.2f pixels/4ms\n", min_peak_height))

  # Plot
  if(!quiet) graphics::plot(x, type = 'l')
  peaks <- pracma::findpeaks(x, minpeakheight = min_peak_height, minpeakdistance = min_peak_dist)
  if(!quiet) graphics::points(x = peaks[,2], y = peaks[,1], col = "red")

  # Print number of points
  if(!quiet) cat(paste0("Expected: ", n_lines - 1, "\nObserved: ", length(peaks[,1]), "\n"))

  return(peaks[,2])
}
