\name{maTrend}
\alias{maTrend}
\title{Trend of Marginal Effects}
\description{This function computes the change of probability for a continuous variable, and furthermore, stratifies the probability through a binary independant variable.}

\usage{maTrend(q, n = 300, nam.c, nam.d, \dots)}

\arguments{
  \item{q }{ a object of class of "maBina" estimated from \code{maBina()}.}
  \item{n }{ number of points for calculating probability; the large the number, the smoother the curve.}
  \item{nam.c }{ a name of a continuous indepedent variable; this must be given for the function to work.}
  \item{nam.d }{ an optional name of a binary independent variable; this is used to stratify the probability.}
  \item{\dots }{ additional arguments to be passed.}
}
\details{Marginal effects are calcuated at each value of a continous variable. If specficied, the trend can be stratified by a binary independent variable. }

\value{Return a list object of class "maTrend" with the following components:

  \item{q }{ a list object of class "maBina";}
  \item{nam.c }{ the name of a continous variable;}
  \item{mm }{ matrix of independant variables for all}
  \item{trend }{ a data frame of the continous variable and probability values; if \code{nam.d} is specificied, the data frame also contains the probability values stratified by the dummy variable;}
  \item{nam.d }{ if \code{nam.d} is specified, the name of a binary variable .}
  \item{m1 }{ if \code{nam.d} is specified, the matrix of \code{mm} with the column value for \code{nam.d} replaced by 1}
  \item{m0 }{ if \code{nam.d} is specified, the matrix of \code{mm} with the column value for \code{nam.d} replaced by 0}
}

\references{Greene, W.H. 2003. Econometric Analysis (5th ed.). Prentice Hall, New York. 1026 P.}

\author{Changyou Sun (\email{csun@cfr.msstate.edu})}

\seealso{\code{\link{maBina}}; \code{\link{print.maTrend}}; \code{\link{plot.maTrend}}.}

\examples{
data(daPe)
ma <- glm(grade ~ gpa + tuce + psi, x = TRUE, 
    data = daPe, family = binomial(link = "probit"))
summary(ma)

(ea <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE))
(ta <- maTrend(q = ea, nam.c = "gpa", nam.d= "psi"))
plot(ta)
}

\keyword{regression}