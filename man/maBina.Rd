\name{maBina}
\alias{maBina}
\alias{print.maBina}
\title{Marginal Effect for Binary Probit and Logit Model}
\description{This function calculates marginal effects for a binary probit or logit model and their standard errors.}

\usage{maBina(w, x.mean = TRUE, rev.dum = TRUE, digits = 3, \dots)}

\arguments{
  \item{w}{a binary probit or logit model object estimated from \code{glm()}.}
  \item{x.mean}{a logical value (default of TRUE) of whether to calculate marginal effects at the means of independent variables. If FALSE, marginal effects are calculated for each observation and then averaged.}
  \item{rev.dum}{a logical value (default of TRUE) of whether to revise the estimates and standard erros for binary independant variables. If FALSE, derivatives are taken on binary independant variables as continuous variables.}
  \item{digits}{number of digits for output.}
  \item{\dots}{additional arguments to be passed.}
}
\details{Marginal effects from a binary probit or logit model is calculated. The two choices are the method of averaging effects and revising estimates for dummy variables. Marginal effects can be calculated at the mean of the independent variables (i.e., \code{x.mean = TRUE}), or as the average of individual marginal effects at each observation (i.e., \code{x.mean = FALSE}). \code{rev.dum = TRUE} allows marginal effects for dummy variables are calculated differently, instead of treating them as continuous variables.}

\value{Return a list object of class "maBina" with the following components:
  \item{link}{link function used in the binary model;}
  \item{f.xb}{scale factor of marginal effects, calculated as the density function evaluated at the means of the variables when \code{x.mean = TRUE} is specified or the average density value for all individual observations when \code{x.mean = FALSE} is specified;}
  \item{w}{a binary probit or logit model object estimated from \code{glm()};}
  \item{out}{a data frame object of marginal effects, t-value, and p-value.}
}

\section{Methods}{
  One method is defined as follows:
  \describe{
    \item{\code{print}:}{print the key output of marginal effects.}
  }
}

\references{Greene, W.H. 2003. Econometric Analysis (5th ed.). Prentice Hall, New York. 1026 P.}

\author{Changyou Sun (\email{csun@cfr.msstate.edu})}

\seealso{\code{\link{maTrend}}; \code{\link{plot.maTrend}}.}

\examples{
data(daPe)
ma <- glm(grade ~ gpa + tuce + psi, x = TRUE, 
    data = daPe, family = binomial(link = "probit"))
ea <- maBina(w = ma, x.mean = TRUE, rev.dum = TRUE)
ea
}

\keyword{regression}