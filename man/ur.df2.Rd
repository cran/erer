\name{ur.df2}
\alias{ur.df2}
\alias{print.urdf2}
\title{Augmented-Dickey-Fuller Unit Root Test revised}
\description{Augmented-Dickey-Fuller Unit Root Test revised}
\usage{ur.df2(y, type = c("none", "drift", "trend"), lags = 1, 
  selectlags = c("Fixed", "AIC", "BIC"))}
\arguments{
  \item{y }{ Vector to be tested for a unit root.}
  \item{type }{ Test type, either "none", "drift" or "trend"..}
  \item{lags }{ Number of lags for endogenous variable to be included.}
  \item{selectlags }{ Lag selection can be achieved according to the Akaike "AIC" or the Bayes "BIC" information criteria. The maximum number of lags considered is set by lags. The default is to use a "fixed" lag length set by lags.}
}
\details{This is a modification of \code{ur.df} in the library of \code{urca}. The function was written in S4, and it is changed into S3. The lag selected by AIC or BIC is reported explicitly through \code{lag.used} in the output list. In addition, the values of AIC and BIC statistics are reported}

\value{
Return an object of class \code{ur.df2}: the new outputs are \code{lag.used}, \code{aic}, and \code{bic}.
  \item{y }{ input of y}
  \item{model }{ input of model}
  \item{cval }{ critical values}
  \item{lags }{ input of lags}
  \item{lag.used }{ acutal lags used}
  \item{teststat }{ test statistics}
  \item{res }{ resiuals of the test regression}
  \item{aic }{ aic values}
  \item{bic }{ bic values}
  \item{test.name }{ test name}
}

\section{Methods}{
  One method is defined as follows:
  \describe{
    \item{\code{print}:}{print test statistics and critical values.}
  }
}

\author{Changyou Sun (\email{cs258@.msstate.edu})}

\seealso{\code{\link{ur.df}} in \code{urca} library.}

\examples{
# see the code for TD.Link: Japan and China wood product imports
}

\keyword{manip}