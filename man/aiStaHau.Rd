\name{aiStaHau}
\alias{aiStaHau}
\title{Conducting a Hausman Test on a Static AIDS Model}
\description{Conduct a Hausman test on a static AIDS model and report the result of likelihood ratio test.}
\usage{aiStaHau(x, instr, choice = FALSE, ...)}
\arguments{
  \item{x }{ an object of class \code{aiStaFit} from a static AIDS model.}
  \item{instr }{ a single time series data as instrument for the expenditure variable in AIDS model.}
  \item{choice }{ a logical value of whether to take a difference on the right-hand \code{price} and \code{instr} variables.}
  \item{\dots }{ additional arguments to be passed.}
}

\details{Conduct a Hausman test on a static AIDS model and report the result of likelihood ratio test. Note that logarithm is taken on every variable in the auxiliary regression. These variables are the real total expenditure and its lagged value, instrumental variable, and the price variables. }
\value{Return a data frame object with the statistics and p values for the four tests by equation.
  \item{daHau }{ data used in estimating the Hausman test.}
  \item{formuHau }{ formula for estimating the Hausman test.}
  \item{regHau }{  regression for the Hausman test.}
  \item{daFit }{  revised data with the fitted value of expenditure included.}
  \item{aiBase }{  the base static AIDs model estimated.}
  \item{aiHaus }{  the reestimated static AIDS model using the fitted value of expenditure.}
  \item{ratio }{  result of the likelihood ration test for the Hausman test.}
}

\references{Wan, Y., C. Sun, and D.L. Grebner. 2010. Analysis of import demand for wooden beds in the United States. Journal of Agricultural and Applied Economics 42(4):643-658.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{aiStaFit}}; \code{\link{print.aiFit}}.}

\examples{
# see the examples for 'aiDynFit'.
}
\keyword{regression}