bsStat <- function(y, two = NULL, digits = c(2, 1), ...){
    digits <- rep(digits, 2)[1:2]
    cor2 <- round(cor(y), digits = digits[1])
    corr <- data.frame(name = rownames(cor2), cor2)
    rownames(corr) <- 1:nrow(corr)

    for ( i in (1:(ncol(y)-1) + 2) ) {corr[1:(i-2), i] <- ""}
    fstat <- data.frame(matrix(data = 0, nrow = ncol(y), ncol = 6))
    colnames(fstat) <- c("name", "mean", "stde", "mini", "maxi", "obno")
    fstat$name <- colnames(y)
    for (i in 1:ncol(y)){
        fstat[i, "mean"] <- round(mean(y[, i]), digits=digits[2])
        fstat[i, "stde"] <- round(sd(y[,i])   , digits=digits[2])    
        fstat[i, "mini"] <- round(min(y[,i])  , digits=digits[2])    
        fstat[i, "maxi"] <- round(max(y[,i])  , digits=digits[2])    
        fstat[i, "obno"] <- length(y[,i])
    }

    if (is.null(two)) {
        if (ncol(y) < 11) { two <- FALSE
        } else { two <- TRUE }
    }
    if (two) {
        result <- list(corr=corr, fstat=fstat)
    } else {
        result <- merge(x=corr, y=fstat, by="name", sort = FALSE)
    }
    return(result)
}