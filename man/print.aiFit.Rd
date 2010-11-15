\name{print.aiFit}
\alias{print.aiFit}
\title{Printing results from AIDS models}
\description{Show estimation resutls from static or dynamic AIDS models estimated from \code{aiStaFit},  \code{aiStaHau}, and \code{aiDynFit}.}
\usage{\method{print}{aiFit}(x, \dots)}
\arguments{
  \item{x}{an object of class \code{aiFit} from the function of \code{aiStaFit}, \code{aiStaHau}, or \code{aiDynFit}.}
  \item{\dots}{additional arguments to be passed.}
}
\details{This print method for object of class \code{aiFit}.}
\value{Summary results of the coefficents or outputs.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{aiStaFit}}; \code{aiStaHau}; \code{\link{aiDynFit}}.}

\examples{
# see the examples for 'aiDynFit'.
}
\keyword{methods}