\name{ciTarFit}
\alias{ciTarFit}
\title{
Fitting Threshold Cointegration
}
\description{
Fit a threshold cointegration regression between two time series.
}
\usage{
ciTarFit(y, x, model = c("tar", "mtar"), lag, thresh, 
    small.win, ...)
}

\arguments{
  \item{y}{dependent or left-side variable for the long-run model.}
  \item{x}{independent or right-side variable for the long-run model.}
  \item{model}{a choice of two models: tar or mtar.}
  \item{lag}{number of lags for the threshold cointegration regression.}
  \item{thresh}{a threshold value.}
  \item{small.win}{value of a small window for fitting the threshold 
        cointegration regression.}
  \item{\dots}{additional arguments to be passed.}
}
\details{
This is the main function for threshold autoregression regression (TAR) 
in assessing the nonlinear threshold relation between two time series 
variables. It can be used to estimate four types of threshold 
cointegration regressions. These four types are TAR with a threshold 
value of zero; consistent TAR with a nonzero threshold; MTAR (momentum 
TAR) with a threshold value of zero; and consistent MTAR with a nonzero 
thresold. The option of small window is used in model selection because 
a comparison of AIC and BIC values should be based on the same number 
of regression observations.
}
\value{
Return a list object of class "ciTarFit" with the following components: 
  \item{y}{dependend variable} 
  \item{x}{independent variable} 
  \item{model}{model choice} 
  \item{lag}{number of lags} 
  \item{thresh}{threshold value} 
  \item{data.LR}{data used in the long-run regression} 
  \item{data.CI}{data used in the threshold cointegration regression} 
  \item{z}{residual from the long-run regression} 
  \item{lz}{lagged residual from the long-run regression} 
  \item{ldz}{lagged residual with 1st difference from long-run model} 
  \item{LR}{long-run regression} 
  \item{CI}{threshold cointegration regression} 
  \item{f.phi}{test with the null hypothesis of no threshold 
        cointegration} 
  \item{f.apt}{test with the null hypothesis of no asymmetric price 
        transmission in the long run}
  \item{sse}{value of sum of squared errors} 
  \item{aic}{value of Akaike Information Criterion} 
  \item{bic}{value of Bayesian Information Criterion.}
}

\references{
Balke, N.S., and T. Fomby. 1997. Threshold cointegration. International 
  Economic Review 38(3):627-645. 

Enders, W., and C.W.J. Granger. 1998. Unit-root tests and asymmetric 
  adjustment with an example using the term structure of interest rates.
  Journal of Business & Economic Statistics 16(3):304-311.

Enders, W., and P.L. Siklos. 2001. Cointegration and threshold 
  adjustment. Journal of Business and Economic Statistics 19(2):166-176.
}

\author{Changyou Sun (\email{csun@cfr.msstate.edu})}

\seealso{
\code{\link{print.ciTarFit}}; \code{\link{summary.ciTarFit}}; 
\code{\link{ciTarLag}} for lag selection; and \code{\link{ciTarThd}} 
for threshold selection. 
}

\examples{
# see example at daVich
}
\keyword{regression}