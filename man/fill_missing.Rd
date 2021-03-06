% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fill_missing.R
\name{fill_missing}
\alias{fill_missing}
\title{fill_missing}
\usage{
fill_missing(data, ..., add_labels = F)
}
\arguments{
\item{data}{A data frame containing x and y coordinates with missing values}

\item{...}{One or more unquoted variables with missing values}

\item{add_labels}{add new columns to identify where missing values were}
}
\value{
Returns a data frame with interpolated values replacing missing values
}
\description{
\code{fill_missing} interpolates missing values for the x and y coordinates in a data frame.
}
\examples{


x <- c(1:5, NaN, 7:10)
y <- c(1:6, NaN, 8:10)
df <- data.frame(x = x, y = y)
fill_missing(df, x, y)

}
