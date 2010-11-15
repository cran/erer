\name{print.maTrend}
\alias{print.maTrend}
\title{Printing Marginal Effect Trends}
\description{Show dimension and some values of probability values from \code{maTrend}.}
\usage{\method{print}{maTrend}(x, \dots)}
\arguments{
  \item{x}{an object of class \code{maTrend} from the function of \code{maTrend}.}
  \item{\dots}{additional arguments to be passed.}
}
\details{This print method for \code{maTrend} shows the probability values.}
\value{Summary results of the probability value estimates.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{maTrend}}; \code{\link{plot.maTrend}}.}

\examples{
data(daPe)
ma <- glm(grade ~ gpa + tuce + psi, x = TRUE, 
    data = daPe, family = binomial(link = "probit"))
ea <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE)
ta <- maTrend(q = ea, nam.c = "gpa", nam.d= "psi")
ta
}
\keyword{methods}