\name{aiData}
\alias{aiData}
\docType{data}
\title{Transforming Raw Data for Static AIDS Model}
\description{This function transforms import values and quantities into a data format that are needed for a static AIDS model. }

\usage{aiData(x, label, label.tot = "WD", prefix.value = "v",
  prefix.quant = "q", start = NULL, end = NULL, ...)}
\arguments{
  \item{x }{ raw time series data such as \code{daBedRaw}.}
  \item{label }{ names of supplying countries; this can be as long as needed.}
  \item{label.tot }{ names of the world total (default label is "WD").}
  \item{prefix.value }{ prefix for value variables.}
  \item{prefix.quant }{ prefix for quantity varibles.}
  \item{start }{ start date for the transformed time series; this can be used to select a smaller window; the default is the start date of the raw data \code{x}.}
  \item{end }{ end date for the transformed time series.}
  \item{\dots }{ additional arguments to be passed.}
}
\details{This transforms raw import data into a format needed for a static AIDS model. This separation of data prepraration from model fitting allows greater flexibility in using \code{aiStaFit} in estimating a static AIDS model.}

\value{
Return a list object with two components:
  \item{out }{ a time series object ready for static AIDS models. }
  \item{share }{ a data frame object of the share data.}
  \item{price }{ a data frame object of the price data.}
  \item{m }{ a vector of the total expenditure.}
  \item{call }{ a record of the system call; this allows \code{update.default} to be used. }
}

\references{Wan, Y., C. Sun, and D.L. Grebner. 2010. Analysis of import demand for wooden beds in the United States. Journal of Agricultural and Applied Economics 42(4):643-658.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{aiStaFit}}; \code{\link{daBedRaw}}; \code{\link{daBed}}.}

\examples{

data(daBedRaw)
imp8 <- aiData(x = daBedRaw,
  label = c("CN", "VN", "ID", "MY", "CA", "BR", "IT"),
  label.tot = "WD", prefix.value = "v", prefix.quant = "q",
  start = c(2001, 1), end = c(2008, 12), frequency = 12)
imp4 <- update(imp8, label = c("CN", "VN", "ID"))
imp5 <- update(imp4, label = c("CN", "VN", "ID", "MY"))
imp8; imp4; imp5
dat8 <- imp8$out

dum  <- ts(0, start = start(dat8), end = end(dat8), frequency = 12)
dum1 <- replace(dum, time(dum) == 2003+(10-1)/12, 1)
dum2 <- replace(dum, time(dum) == 2004+(7 -1)/12, 1)
dum3 <- replace(dum, time(dum) == 2005+(1 -1)/12, 1)
daTest <- ts.union(dat8, dum1, dum2, dum3)
colnames(daTest) <- c(colnames(dat8), "dum1", "dum2", "dum3")

data(daBed)
identical(daBed, daTest)
}
\keyword{manip}