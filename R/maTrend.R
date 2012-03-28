maTrend <- function(q, n = 300, nam.c, nam.d, ...)
{
  if (class(q) != "maBina") {
    stop("Need an object from 'maBina()'.\n") }
  if (missing(nam.c)) {
    stop("Need a continous variable name'.\n") }
  if (identical(sort(unique(q$w$x[, nam.c])), c(0, 1))) {
    stop("nam.c must be a continuous variable.") }
  if (!missing(nam.d)) {
    if (!identical(sort(unique(q$w$x[, nam.d])), c(0, 1))) {
      stop("nam.d must be a binary variable.") } }
    
  xx <- q$w$x
  link <- q$w$family$link
  b.est <- as.matrix(coef(q$w))
  result <- list(q=q, nam.c=nam.c)
 
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