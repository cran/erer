maBina <- function(w, x.mean = TRUE, rev.dum = TRUE, 
  digits = 3, ...)
{
  if (!inherits(w, "glm")) {stop("Please provide an object from 'glm()'.\n")}
  link <- w$family$link
  if (link != "probit" & link != "logit") {
    stop("Need a binary probit or logit model'.")}
  if (is.null(dim(w$x))) {
      stop("Please specify 'x = TRUE' in glm().\n")}
        
  x <- as.matrix(w$x)
  x.bar <- as.matrix(colMeans(w$x))
  b.est <- as.matrix(coef(w))
  K <- nrow(b.est)
  xb <- t(x.bar) %*% b.est
  if (link == "probit") f.xb <- dnorm(xb)    
  if (link == "logit" ) f.xb <- dlogis(xb)
  if (!x.mean) {    
    xb2 <- x %*% b.est
    if (link == "probit") f.xb <- mean(dnorm(xb2))    
    if (link == "logit")  f.xb <- mean(dlogis(xb2))
  }
  me <- f.xb * coef(w)
  
  bx <- b.est %*% t(x.bar)
  if (link == "probit") {  
    dr <- diag(1, K, K) - as.numeric(xb) * bx
    va <- as.numeric(f.xb)^2 * dr %*% vcov(w) %*% t(dr)
  } else {
    pg <- as.numeric(plogis(xb))
    dr <- diag(1, K, K) + (1 - 2 * pg) * bx
    va <- (pg*(1-pg))^2 * dr %*% vcov(w) %*% t(dr)      
  }
  se <- sqrt(diag(va))
  
  if (rev.dum) {
    for (i in 1:ncol(w$x)) {
      if (identical(unique(w$x[,i]), c(0, 1))) {
        x.d1 <- x.bar; x.d1[i, 1] <- 1
        x.d0 <- x.bar; x.d0[i, 1] <- 0
        if (link == "probit") {
          me[i] <- pnorm(t(x.d1) %*% b.est) -  
                   pnorm(t(x.d0) %*% b.est)        
          dr2 <- dnorm(t(x.d1) %*% b.est) %*%  t(x.d1) -  
                 dnorm(t(x.d0) %*% b.est) %*%  t(x.d0) 
          va2 <- dr2 %*% vcov(w) %*% t(dr2)
          se[i] <- sqrt(as.numeric(va2))                   
        }
        if (link == "logit") {
          me[i] <- plogis(t(x.d1) %*% b.est) -  
                   plogis(t(x.d0) %*% b.est)
          dr2 <- dlogis(t(x.d1) %*% b.est) %*%  t(x.d1) -  
                 dlogis(t(x.d0) %*% b.est) %*%  t(x.d0) 
          va2 <- dr2 %*% vcov(w) %*% t(dr2)
          se[i] <- sqrt(as.numeric(va2))  
        }
      }
    }
  }
  out <- data.frame(effect=me, error=se)
  out$t.value <- out$effect / out$error
  out$p.value <- 2*(1- pt(abs(out[, 3]), w$df.residual))
  out <- round(out, digits=digits)  
  result <- list(link=link, f.xb=f.xb, w=w, out=out)
  class(result) <- "maBina"
  return(result)
}