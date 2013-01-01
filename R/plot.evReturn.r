plot.evReturn <- function(x, ...) {
  qplot(x = x$abr$day, y = x$abr$HNt, geom = "path",
    xlab = "Event Day",
    ylab = "Average Cumulative Abnormal Returns (%)")
}