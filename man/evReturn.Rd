\name{evReturn}
\alias{evReturn}
\title{Estimating Abnormal Return from Event Analysis}
\description{Conduct an event analysis and estimate abnormal returns over time and across firms.}
\usage{evReturn(y, firm, event.date, y.date = "date",
  index = "sp500", event.win = 3, est.win = 250, digits = 4, \dots)}
\arguments{
  \item{y }{ a data frame object with one column for date, return series by firms, a return series for a stock market index, and a return series for a risk free asset.}
  \item{firm }{ a character vector of firm names; this is the name of the return series in \code{y}.}
  \item{event.date }{ event dates for each firm as specified in \code{firm}; this should be a numerical vector and can match the values in \code{y$y.date}; if event dates are the same for all the firms, this can be specificed as a single number.}
  \item{y.date }{ a character value for the column name of date in \code{y}.}
  \item{index }{ a character value for the column name of index in \code{y}.}
  \item{event.win }{ the one-side width of event window in days; the default value of 3 corresponds to a 7-day window (i.e., 3 + 1 + 3).}
  \item{est.win }{ the width of estimation window in days.}
  \item{digits }{ number of digits used to format outputs.}
  \item{\dots }{ additional arguments to be passed.}
}
\details{This is the core function for event analysis. It estimates a market model by firm and then calculate abnormal returns by firm and over time. The time series of stock returns have irregular time frequency because of varying trading days. Thus, the time dimension is explicitly specified as a \code{y.date} column in the data of \code{y}.}

\value{
Return a list object of class "evReturn" with the following components:
  \item{y }{ a data frame of raw return data. }
  \item{y.date }{ a character value for the column name of date in \code{y}..}
  \item{firm }{  a character vector of firm names.}
  \item{N}{  the number of firms.}
  \item{index }{ a character value for the column name of index in \code{y}.}
  \item{event.date }{ event dates for each firm as specified in \code{firm}.}
  \item{event.win }{ the one-side width of event window in days.}
  \item{event.width }{  total number of days in an event window.}
  \item{est.win }{ the width of estimation window in days..}
  \item{daEst }{  data used to estimate the market model for the last firm as specified in code{firm}.}
  \item{daEve }{  data over the event window for the last firm.}
  \item{ra }{ fitted market model for the last firm.}
  \item{digits }{ number of digits used to format outputs.}
  \item{reg }{ regression coefficients by firm.}
  \item{abr }{ abnormal returns by day over the event window and by firm.}
  \item{abc }{ average abnormal returns across firms.}
  \item{call }{ a record of the system call; this allows \code{update.default} to be used. }
}

\references{Mei, B., and C. Sun. 2008. Event analysis of the impact of mergers and acquisitions on the financial performance of the U.S. forest products industry. Forest Policy and Economics 10(5):286-294.}
\author{Changyou Sun (\email{csun@cfr.msstate.edu})}
\seealso{\code{\link{print.evReturn}}; \code{\link{plot.evReturn}}; \code{\link{evRisk}}.}

\examples{
# see Mei and Sun (2008).
}
\keyword{regression}