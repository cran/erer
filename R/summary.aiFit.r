summary.aiFit <- function(object, digits = 3, ...) {
    if (class(object)[2] != "aiFit") {
        stop("\nNeed an object from 'aiStaFit' or 'aiDynFit'.\n")
    }
    z <- object
    N <- z$nParam * 2
    out <- bsTab(w = z$est, need = "1T", digits = digits)
 
    final <- data.frame(matrix(NA, nrow = N + 1, ncol = z$nShare) )
    nam <- out[1:N, 1]  
    naq <- substr(nam, start = 5, stop = nchar(nam))
    final[, 1] <- c(naq, "R-squared")        
    for (i in 1:(z$nShare - 1)) {
       final[1:N, i+1] <- out[(1 + N * (i - 1)):(N * i), 2]
       r2 <- summary(z$est)["eq"]$eq[[i]][11]
       final[N + 1, i+1] <- round(as.numeric(r2), digits)
    }
    colnames(final) <- c("Parameter", z$share[-z$nOmit])
    return(final)
}