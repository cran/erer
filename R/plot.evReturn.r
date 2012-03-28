plot.evReturn <- function(x, ...) {
  if (class(x) != "evReturn") {
    stop("Please provide an object from 'evReturn'.\n")
  } 
  qplot(x = x$abr$day, y = x$abr$HNt, geom = "path",
    xlab = "Event Day",
    ylab = "Average Cumulative Abnormal Returns (%)")
}