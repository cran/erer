print.aiFit <- function(x, ...)
{
  if (inherits(x, "aiStaHau")) {
    print(x$ratio)
  } else {
    print(x$est)
  }
}