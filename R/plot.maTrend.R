plot.maTrend <- function(x, ...)
{
  if (class(x) != "maTrend") {
    stop("Please provide an object from 'maTrend()'.\n")
  }
  
  pr <- x$trend
  yvar <- toupper(as.character(x$q$w$formula)[2])
  
  plot(pr[, 2] ~ pr[, 1], type="l", lty=1,
    ylim=c(min(pr[, -1]), max(pr[, -1])), 
    xlab=toupper(x$nam.c),
    ylab=paste("Probability (", yvar, " = 1)", sep=""), ... )
  abline(v=colMeans(x$q$w$x)[x$nam.c], lty=4)
  grid()
  
  if (!is.null(x$nam.d)) {  
    lines(pr[, 3] ~ pr[, 1], type="l", lty=2)
    lines(pr[, 4] ~ pr[, 1], type="l", lty=3)
  }
}