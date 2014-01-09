maTrend <- function(q, n = 300, nam.c, nam.d, ...)
{
  if (!inherits(q, "maBina")) {stop("Need an object from 'maBina()'.\n")}
  if (missing(nam.c)) {stop("Need a continous variable name'.\n")}
  if (identical(sort(unique(q$w$x[, nam.c])), c(0, 1))) {
    stop("nam.c must be a continuous variable.") }
  if (!missing(nam.d)) {
    if (!identical(sort(unique(q$w$x[, nam.d])), c(0, 1))) {
      stop("nam.d must be a binary variable.") } }
    
  xx <- q$w$x
  link <- q$w$family$link
  b.est <- as.matrix(coef(q$w))
  result <- listn(q, nam.c)
 
  mm <- matrix(colMeans(xx), ncol=ncol(xx), 
    nrow=n, byrow=TRUE)
  colnames(mm) <- colnames(xx)
  ran <- range(xx[, nam.c])
  tre <- seq(from=ran[1], to=ran[2], length.out=n)
  mm[, nam.c] <- tre 
  if (link =="probit") { pp <- pnorm( mm %*% b.est)}      
  if (link =="logit") { pp <- plogis(mm %*% b.est)}
  trend <- data.frame(mm[, nam.c], pp)    
  colnames(trend) <- c(nam.c, "pr.all")
  result$mm <- mm
  
  if (!missing(nam.d)) {
    m1 <- mm; m1[, nam.d] <- 1
    m0 <- mm; m0[, nam.d] <- 0
    if (link =="probit") {
      p1 <- pnorm(m1 %*% b.est)
      p0 <- pnorm(m0 %*% b.est)          
    } else {
      p1 <- plogis(m1 %*% b.est)
      p0 <- plogis(m0 %*% b.est)   
    }
    trend <- data.frame(mm[, nam.c], pp, p1, p0)    
    colnames(trend) <- c(nam.c, "pr.all", 
      paste("pr", nam.d, "d1", sep="."), 
      paste("pr", nam.d, "d0", sep="."))
    result$nam.d <- nam.d 
    result$m1 <- m1 
    result$m0 <- m0 
  }
 
  result$trend <- trend
  class(result) <- "maTrend"
  return(result)
}

# print and plot method for 'maTrend'
print.maTrend <- function(x, ...) {
  cat("\n===========================================")
  cat("\nCalculated Probability Matrix\n")
  cat("===========================================\n")
  print(dim(x$trend)); print(tail(x$trend))
}

plot.maTrend <- function(x, ...) { 
  pr <- x$trend; yvar <- toupper(as.character(x$q$w$formula)[2])   
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