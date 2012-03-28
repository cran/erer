\name{bsStat}
\alias{bsStat}
\title{Summary of Basic Statistics}
\description{Calcluate basic statistics of data.}
\usage{bsStat(y, two = NULL, digits = c(2, 1), ...)}
\arguments{
  \item{y }{ input data for summary statistics.}
  \item{two }{ a logical value of whether to report the correlation and summary statistics separately; if \code{NULL } and the number of variables is less than 11, its value will be set to \code{TRUE}.}
  \item{digits }{ digits for the output data, one for correlation coefficients and the other for mean and others; if a single scalar is supplied, it will be used for both.}
  \item{\dots }{ additional arguments to be passed.}
}
\details{
Two set of summary statistics are generated. One is correlation coefficients and the other is mean, minimum, maximum, standard error, and number of observations. When \code{two} is unspecified and the number of variables is bigger than ten, the two sets are reported separately; otherwise, it is reported as a single data frame object.
}
\value{
A dataframe or list of the summary statistics.
}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\examples{
data(daIns)
(sum.daIns <- bsStat(y=daIns, digits=c(3,2)))
}
\keyword{manip}