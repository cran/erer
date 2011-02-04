aiData <- function(x, label, label.tot = "WD", prefix.value = "v", 
  prefix.quant = "q", start = NULL, end = NULL, ...)
{
  if (!identical(class(x), c("mts", "ts"))) {
    stop("class(y) should be c('mts', 'ts').\n")}
  if (is.null(start)) start <- start(x)
  if (is.null(end)  ) end <- end(x)
  x2 <- window(x, start = start, end = end, freq = tsp(x)[3])
  
  lab.value <- paste(prefix.value, label, sep="")
  lab.quant <- paste(prefix.quant, label, sep="")
  lab.price <- paste("p",          label, sep="")
  lab.lnp   <- paste("lnp",        label, sep="")
  lab.share <- paste("s",          label, sep="")
  lab.valTo <- paste(prefix.value, label.tot, sep="") 
  lab.quaTo <- paste(prefix.quant, label.tot, sep="") 
  
  y <- x2[, c(lab.value, lab.valTo, lab.quant, lab.quaTo)]
  vRW <- y[, lab.valTo] - rowSums(y[, lab.value])
  qRW <- y[, lab.quaTo] - rowSums(y[, lab.quant])
  value <- ts.union(y[, lab.value], vRW)
  quant <- ts.union(y[, lab.quant], qRW)
  price <- value / quant
  lnp   <- log(price)
  m     <- rowSums(value)
  share <- value / m
  prInd <- rowSums(share * lnp)
  rte <- log(m) - prInd
  
  colnames(value) <- c(lab.value, "vRW")
  colnames(quant) <- c(lab.quant, "qRW")
  colnames(price) <- c(lab.price, "pRW")
  colnames(lnp)   <- c(lab.lnp,   "lnpRW")
  colnames(share) <- c(lab.share, "sRW") 
  out <- ts.union(share, rte, lnp)
  colnames(out) <- c(colnames(share), "rte", colnames(lnp))
  result <- list(out=out, share = share, price = price, m = m, call=sys.call())
  return(result)
}  