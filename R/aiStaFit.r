aiStaFit <- function(y, share, price, expen, shift = NULL, omit = NULL,
    hom = TRUE, sym = TRUE, ...)
{
    if (!identical(class(y), c("mts", "ts"))) {
        stop("class(y) should be c('mts', 'ts').\n")}   
    nShare <- length(share)
    nExoge <- 1 + length(expen) + length(shift)
    nParam <- nExoge + nShare
    nTotal <- (nShare - 1) * nParam
  
    m.h <- matrix(0, (nShare-1), nTotal)
    for (i in 1:(nShare - 1)) {
        for (j in 1:nShare) { m.h[i, (i-1)*nParam + nExoge + j] <- 1 }
    }       
    ns  <- (nShare - 1) * (nShare - 2)/2 
    k   <- 0
    m.s <- matrix(0, ns, nTotal)
    for ( i in 1:(nShare - 2) ) {
        for ( j in (i+1):(nShare-1) ) {
            k <- k + 1
            m.s[k, (i-1)*nParam + nExoge + j] <- 1
            m.s[k, (j-1)*nParam + nExoge + i] <- -1
        }
    }    
    m.hs <- rbind(m.h,m.s)
    r.s  <- rep(0, nrow(m.s))    
    r.h  <- rep(0, nrow(m.h))
    r.hs <- rep(0,nrow(m.hs))
    if (!hom & !sym) {aa <- NULL; bb <- NULL}
    if ( hom & !sym) {aa <- m.h ; bb <- r.h }
    if (!hom &  sym) {aa <- m.s ; bb <- r.s }
    if ( hom &  sym) {aa <- m.hs; bb <- r.hs}

    fa <- bsFormu(name.y = share, name.x = c(shift, expen, price), 
        intercept = TRUE)
    if(is.null(omit)) {
        nOmit <- length(share); omit <- share[nOmit]
    } else { nOmit <- which(share == omit) }
    sa <- fa[-nOmit]        
    est <- systemfit(sa, method = "SUR", data = y, 
        restrict.matrix = aa, restrict.rhs = bb)
    result <- list(y=y, share=share, price=price, expen=expen, 
        shift=shift, omit=omit, nOmit=nOmit, hom=hom, sym=sym,
        nShare=nShare, nExoge=nExoge, nParam=nParam, nTotal=nTotal,
        formula=sa, res.matrix=aa, res.rhs=bb, est=est, call=sys.call())
    class(result) <- c("aiStaFit", "aiFit")
    return(result)
}