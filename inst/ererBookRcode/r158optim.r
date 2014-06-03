# New function: binary logit + maximum likelihood + optim
logit <- function(data, name.y, name.x, par0 = NULL, ...)
{
  # Input
  var.y <- data[, name.y, drop = FALSE]
  var.x <- cbind(Intercept = 1, data[, name.x])
  y <- as.matrix(var.y); x <- as.matrix(var.x)
  if (is.null(par0)) par0 <- rep(0, times = ncol(x))

  # Contruct loglikehood function and maximization by 'optim'
  loglike <- function(b, x, y) {
    p <- as.vector(1/(1 + exp(-x %*% b)))
    val <- sum(y * log(p) + (1 - y) * log(1 - p))
    return(val)
  }
  best <- optim(par = par0, fn = loglike, x = x, y = y, hessian = TRUE,
    control = list(fnscale = -1), ...)

  # Compute coeffient and p value
  coeff <- best$par
  covar <- solve(best$hessian)
  error <- matrix(data = diag(-1 * covar)^0.5, ncol = 1)
  zvalu <- coeff / error
  pvalu <- 2 * pt(abs(zvalu), df = nrow(x) - ncol(x), lower.tail = FALSE)
  out <- data.frame(round(cbind(coeff, error, zvalu, pvalu), 5))
  colnames(out) <- c("Estimate", "Std. Error", "z value", "Pr(>|z|)")
  rownames(out) <- colnames(x)
  out$sig <- ifelse(out[,4] >= 0.1, ' ', ifelse(out[,4] >= 0.05, '.',
    ifelse(out[,4] >= 0.01, '*', ifelse(out[,4] >= 0.001, '**', '***'))))

  # Output
  result <- list(data = data, name.y = name.y, name.x = name.x,
    best = best, out = out)
  class(result) <- "logit"
  return(result)
}
print.logit <- function(x, ...) {print(x$out)} # print method

# Test on real data with different initial value and methods
library(erer); data(daIns)
nx <- colnames(daIns)[-c(1, 14)]
ins.a <- logit(data = daIns, name.y = "Y", name.x = nx, method = "BFGS")
ins.b <- logit(data = daIns, name.y = "Y", name.x = nx, method = "BFGS",
  par0 = c(-4, 0.2, 0.01, 0.8, 0.1, -0.3, -0.3, 0.01,
    1.6, -0.2, -0.01, 0, 0))
ins.c <- logit(data = daIns, name.y = "Y", name.x = nx, method = "Nelder-Mead")
names(ins.a); names(ins.a$best)
rbind(ins.a$best$counts, ins.a$best$counts, ins.c$best$counts)
ins.a; ins.c

# Compare with results from base R
ins.r <- glm(formula = Y ~ Injury + HuntYrs + Nonres + Lspman + Lnong +
  Gender + Age + Race + Marital + Edu + Inc + TownPop,
  family = binomial(link = "logit"), data = daIns, x = TRUE)
summary(ins.r)