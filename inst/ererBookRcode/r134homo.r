# Determining dimensions
nShare <- length(share)
nExoge <- 1 + length(expen) + length(shift)
nParam <- nExoge + nShare
nTotal <- (nShare - 1) * nParam

# Restriction for homogeneity
m.h <- matrix(0, (nShare-1), nTotal)
for (i in 1:(nShare - 1)) {
    for (j in 1:nShare) { m.h[i, (i-1)*nParam + nExoge + j] <- 1 }
}

# Restriction for symmetry
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

# Restrictions combined
m.hs <- rbind(m.h,m.s)
r.s  <- rep(0, nrow(m.s))
r.h  <- rep(0, nrow(m.h))
r.hs <- rep(0,nrow(m.hs))

# Selection
if (!hom & !sym) {aa <- NULL; bb <- NULL}
if ( hom & !sym) {aa <- m.h ; bb <- r.h }
if (!hom &  sym) {aa <- m.s ; bb <- r.s }
if ( hom &  sym) {aa <- m.hs; bb <- r.hs}