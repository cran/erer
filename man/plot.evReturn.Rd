\name{plot.evReturn}
\alias{plot.evReturn}
\title{Plot for Average Cumulative Abnormal Returns from Event Analysis}
\description{Plot average cumulative abnormal returns from event analysis versus days in event window.}
\usage{\method{plot}{evReturn}(x, \dots)}
\arguments{
  \item{x}{an object of class "evReturn".}
  \item{\dots}{additional arguments to be passed.}
}

\details{Plot average cumulative abnormal returns from event analysis versus days in event window. This is for all firms as a group and is called HNt in Mei and Sun (2008).}

\references{Mei, B., and C. Sun. 2008. Event analysis of the impact of mergers and acquisitions on the financial performance of the U.S. forest products industry. Forest Policy and Economics 10(5):286-294.}

\author{Changyou Sun (\email{csun@cfr.msstate.edu})}

\seealso{\code{\link{evReturn}}; \code{\link{print.evReturn}}.}

\examples{
# see Mei and Sun (2008).
}
\keyword{methods}