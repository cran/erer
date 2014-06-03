aiStaFit <- function(y, share, price, expen, shift = NULL, omit = NULL,
    hom = TRUE, sym = TRUE, digits = 3, AR1 = FALSE, 
    rho.sel = c("all", "mean"),...)
{
    # input
    if (!inherits(y, "mts")) {stop("class(y) should be 'mts').\n")}   
    nShare <- length(share)
    nExoge <- 1 + length(expen) + length(shift)
    nParam <- nExoge + nShare
    nTotal <- (nShare - 1) * nParam
  
    # restrictions
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

    # estimation
    fa <- bsFormu(name.y = share, name.x = c(shift, expen, price), 
        intercept = TRUE)
    if(is.null(omit)) {
        nOmit <- length(share); omit <- share[nOmit]
    } else { nOmit <- which(share == omit) }
    sa <- fa[-nOmit]    
    est <- systemfitAR(formula = sa, data = data.frame(y), method="SUR",
        restrict.matrix = aa, restrict.rhs = bb, AR1 = AR1, 
        rho.sel = rho.sel)
    
    # output
    result <- list(y=y, share=share, price=price, expen=expen, 
        shift=shift, omit=omit, nOmit=nOmit, hom=hom, sym=sym,
        nShare=nShare, nExoge=nExoge, nParam=nParam, nTotal=nTotal,
        formula=sa, res.matrix=aa, res.rhs=bb, est=est, AR1=AR1,
        call=sys.call())
    class(result) <- c("aiStaFit", "aiFit")
    return(result)
}