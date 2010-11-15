print.aiFit <- function(x, ...)
{
  if (class(x)[2] != "aiFit") {
    stop("Please provide an object from 'aiStaFit' or 'aiDymFit'.\n")
  }
  if (class(x)[1] == "aiStaHau") {
    print(x$ratio)
  } else {
    print(x$est)
  }
}