\name{headts}
\alias{headts}
\alias{tailts}
\title{Return the first or last part of time series data}
\description{Return the first of last parts of an object of time series data.}

\usage{
  headts(x, n = 5, \dots)
  tailts(x, n = 5, \dots)
}
\arguments{
  \item{x }{ input time seires data.}
  \item{n }{ a single integer for the length or row of returned data}
  \item{\dots }{ additional arguments to be passed.}
}
\details{ The data can be an univariate or multivariate time series data.}
\value{ An object like x but generally smaller.}

\author{Changyou Sun (\email{edwinsun258@gmail.com})}

\examples{
h1 <- ts(data=cbind(1:24), start=c(2001, 1), frequency=12)
h2 <- ts(data=cbind(1:24, 25:48), start=c(2001, 1), frequency=12)
h3 <- ts(data=cbind(1:4, 5:8, 9:12), start=c(2001, 1), frequency=4)
colnames(h2) <- c("aa", "bb")
colnames(h3) <- c("cc", "dd", "ee")
h1; h2; h3

h1; headts(h1); tailts(h1, 28)
h2; headts(h2); tailts(h2, 50)
h3; headts(h3, 2); tailts(h3); tailts(h3, 8)

data(daBed); headts(daBed); tailts(daBed)
}
\keyword{methods}