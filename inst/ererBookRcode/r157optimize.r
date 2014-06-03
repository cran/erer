# Define a new function
fun <- function (x, a = 3) {y <- (x + a)^2 + 20; return(y)}

# Plot the new function
win.graph(width = 5, height = 3, pointsize = 9)
par(mai = c(0.7, 0.7, 0.1, 0.1), family = "serif")
curve(expr = fun, from = -20, to = 20, n = 200, ylab = "y = f(x)")

# Supply the new function as an argument to "optimize"
# Find the minimum and maximum values within an interval
ra <- optimize(f = fun, interval = c(-20, 20), maximum = FALSE, a = 3)
rb <- optimize(f = fun, interval = c(-20, 20), maximum = TRUE, a = 3 )

# Anonymous new function on the fly
rc <- optimize(f = function(x, a = 3) {(x + a)^2 + 20},
  interval = c(-20, 20), maximum = FALSE, a = 3)
identical(ra, rc)