print.maTrend <- function(x, ...)
{
  cat("\n===========================================")
  cat("\nCalculated Probability Matrix\n")
  cat("===========================================\n")
  print(dim(x$trend))
  print(tail(x$trend))
}