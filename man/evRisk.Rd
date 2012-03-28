\name{evRisk}
\alias{evRisk}
\title{Risk Evaluation for Event Analysis}
\description{Conduct a risk analysis by firm and evaluate the change of risk before and after an event. The model used is the Captial Asset Pricing Model.}
\usage{evRisk(x, m = 50, r.free = "tbill", \dots)}
\arguments{
  \item{x }{ a object from \code{evReturn}.}
  \item{m }{ the number of days before and after the event date for estimating CAPM.}
  \item{r.free }{ the column name of risk free asset in \code{y}.}
  \item{\dots }{ additional arguments to be passed.}
}
\details{This fits CAPM for each firm and reports the statistics for alpha, beta, and gamma. The statistics of gamma reveal the change of risk before and after the event.}

\value{
Return a list object of class "evReturn" with the following components:
  \item{x }{ a object from \code{evReturn}.}
  \item{daEst }{  data used to estimate CAPM for the last firm as specified in code{firm}.}
  \item{rb }{ fitted CAPM for the last firm.}
  \item{reg }{ regression coefficients by firm.}
}

\references{Mei, B., and C. Sun. 2008. Event analysis of the impact of mergers and acquisitions on the financial performance of the U.S. forest products industry. Forest Policy and Economics 10(5):286-294.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{evReturn}}; \code{\link{print.evRisk}}.}

\examples{
# see Mei and Sun (2008).
}
\keyword{regression}