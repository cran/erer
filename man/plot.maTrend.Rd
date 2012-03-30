\name{plot.maTrend}
\alias{plot.maTrend}
\title{Plot for Marginal Effect Trends}
\description{Plot the probability values versus a continous variable with a stratification by a dummy variable.}
\usage{\method{plot}{maTrend}(x, \dots)}
\arguments{
  \item{x}{an object of class "maTrend".}
  \item{\dots}{additional arguments to be passed.}
}

\details{Plot the probability values for a continuous variable. If a strata is specified through \code{nam.d} in \code{maTrend()}, then the stratified values also are shown.}
\value{A plot of probability values}

\references{Greene, W.H. 2003. Econometric Analysis (5th ed.). Prentice Hall, New York. 1026 P.}

\author{Changyou Sun (\email{csun@cfr.msstate.edu})}

\seealso{\code{\link{maTrend}}; \code{\link{print.maTrend}}.}

\examples{
data(daPe)
ma <- glm(grade ~ gpa + tuce + psi, x = TRUE, 
    data = daPe, family = binomial(link = "probit"))
ea <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE)
ta <- maTrend(q = ea, nam.c = "gpa", nam.d= "psi")
plot(ta)
}
\keyword{methods}
