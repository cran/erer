\name{aiDynFit}
\alias{aiDynFit}
\title{Fitting a Dynamic AIDS Model}
\description{Estimate a dynamic AIDS model for a system.}
\usage{aiDynFit(w, dum.dif = FALSE, ...)}
\arguments{
  \item{w }{ a object of class \code{aiStaFit}.}
  \item{dum.dif }{ a logical value (default of FALSE) of whether to take a difference on the dummy variables passed from \code{w}.}
  \item{\dots }{ additional arguments to be passed.}
}
\details{This estimates a dynamic AIDS model. The residuals from the statis AIDS model are included. As it is programmed now, only one lag is allowed for the share variables on the right-hand side.}
\value{
Return a list object of class "aiFit" and "aiDynFit" with the following components:
  \item{w }{ a object of class \code{aiStaFit}. }
  \item{y }{ data for fitting the static AIDS model, passed down by \code{w}. }
  \item{dum.dif }{ a logical value (default of FALSE) of whether to take a difference on the dummy variables passed from \code{w}. }
  \item{daDyn }{ data for fitting the dynamic AIDS model. }
  \item{share }{ names of shares by commodity, used as depedent variables.  }
  \item{price }{ names of prices by commodity, used as independent variables. }
  \item{expen }{ names of expenditure variable. }
  \item{shift }{ names of the shifters. }
  \item{omit }{ names of the omitted share variable. }
  \item{nOmit }{ position of the omitted share variable in the name of share variable. }
  \item{hom }{ a logical value of homogeneity test. }
  \item{sym  }{ a logical value of symmetry test. }
  \item{nShare }{ number of share variables. }
  \item{nExoge }{ number of exogenous variables (lagged share, residual, expenditure, and shifters). }
  \item{nParam }{ number of parameters in one equation. }
  \item{nTotal }{ number of parameters in the whole system estimated. }
  \item{formula }{ formula for estimating the system. }
  \item{res.matrix }{ restriction matrix for \code{hom} or \code{sym}, or both. }
  \item{res.rhs }{ right-hand values for tests of \code{hom} or \code{sym}, or both. }
  \item{est }{ the dynamic AIDS model estimated. }
}

\references{Wan, Y., C. Sun, and D.L. Grebner. 2010. Analysis of import demand for wooden beds in the United States. Journal of Agricultural and Applied Economics 42(4):643-658.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{aiStaFit}}; \code{\link{aiDiag}}; \code{\link{aiElas}}; \code{summary.aiFit}.}

\examples{

# --- Step 1: Read data 
data(daExp, daBedRaw, daBed)

# --- Step 2: Hausman Test 
# 2.1 Getting started with a static AIDS model 
sh  <- c("sCN", "sVN", "sID", "sMY", "sCA", "sBR", "sIT", "sRW")
pr  <- c("lnpCN", "lnpVN", "lnpID", "lnpMY",  
         "lnpCA", "lnpBR", "lnpIT", "lnpRW")
du3 <- c("dum1","dum2","dum3")
rSta <- aiStaFit(y = daBed, share = sh, price = pr, shift = du3, 
  expen = "rte", omit = "sRW", hom = TRUE, sym = TRUE)
summary(rSta)

# 2.2 The final Hausman test and new data
(dg <- daExp[, "dg"])
rHau <- aiStaHau(x = rSta, instr = dg, choice = FALSE)
names(rHau); colnames(rHau$daHau); colnames(rHau$daFit); rHau
two.exp <- rHau$daFit[, c("rte", "rte.fit")] 
bsStat(two.exp, digits = 4)
plot(data.frame(two.exp)); abline(a = 0, b = 1)
daBedFit <- rHau$daFit

# --- Step 3: Static and dynamic AIDS models 
# 3.1 Diagnostics and coefficients
hSta  <- update(rSta, y = daBedFit, expen = "rte.fit")
hSta2 <- update(hSta, hom = FALSE, sym = FALSE) 
hSta3 <- update(hSta, hom = FALSE, sym = TRUE)
hSta4 <- update(hSta, hom = TRUE,  sym = FALSE)
lrtest(hSta2$est, hSta$est) 
lrtest(hSta2$est, hSta3$est)
lrtest(hSta2$est, hSta4$est)

hDyn  <- aiDynFit(hSta)
hDyn2 <- aiDynFit(hSta2); lrtest(hDyn2$est, hDyn$est)
hDyn3 <- aiDynFit(hSta3); lrtest(hDyn2$est, hDyn3$est)
hDyn4 <- aiDynFit(hSta4); lrtest(hDyn2$est, hDyn4$est)

(table.2 <- rbind(aiDiag(hSta), aiDiag(hDyn)))
(table.3 <- summary(hSta))
(table.4 <- summary(hDyn))
                          
# 3.2 Elasticity calculation
es <- aiElas(hSta); esm <- es$marsh
ed <- aiElas(hDyn); edm <- ed$marsh
esm2 <- data.frame(c(esm[1:2, 2], esm[3:4, 3], 
  esm[5:6, 4], esm[7:8, 5], esm[9:10, 6], esm[11:12, 7], 
  esm[13:14, 8], esm[15:16, 9]))
edm2 <- data.frame(c(edm[1:2, 2], edm[3:4, 3], 
  edm[5:6, 4], edm[7:8, 5], edm[9:10, 6], edm[11:12, 7], 
  edm[13:14, 8], edm[15:16, 9]))
eEM <- cbind(es$expen, esm2, ed$expen[2], edm2) 
colnames(eEM) <- c("Country", "LR.expen", "LR.Marsh", 
  "SR.expen", "SR.Marsh")
(table.5 <- eEM[-c(15:16),])
(table.6a <- es$hicks[-c(15:16), -9])
(table.6b <- ed$hicks[-c(15:16), -9])
}
\keyword{regression}