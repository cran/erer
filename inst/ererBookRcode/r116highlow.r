# Help page, example, demo
?plot # initiate the help page
example(plot)  # run examples at the example section
demo() # list all demos availabe by package
demo(persp) # demo for one function

# Math typing
windows(); aa <- 10
plot(1:10)
text(x = 2, y = 4, labels = expression(paste(
  "This is ", alpha %*% beta, ".", sep = "")))
text(x = 2, y = 5, labels = expression(delta == aa))
text(x = 2, y = 6, labels = bquote(expr = delta == .(aa)))

# Interactive functions
windows(); plot(1:10); locator(n = 3)
identify(x = 3, y = 3)

# Build a graph with low-level functions
windows(); set.seed(12); dat <- rnorm(30) 
plot(dat, type = 'n', axes = FALSE, ann = FALSE)
box()
axis(1); axis(2)
points(dat)
title(main = "Random numbers from the normal distribution")
title(xlab = "x", ylab = "y")
legend(x = 5, y = 2, legend = "random numbers", pch = 1)