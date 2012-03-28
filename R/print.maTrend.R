print.maTrend <- function(x, ...)
{
  if (class(x) != "maTrend") {
    stop("Please provide an object from 'maTrend()'.\n")
  }  
  cat("\n===========================================")
  cat("\nCalculated Probability Matrix\n")
  cat("===========================================\n")
  print(dim(x$trend))
  print(tail(x$trend))
}