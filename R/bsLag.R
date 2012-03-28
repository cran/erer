bsLag <- function(h, lag, prefix = "", var.name,
    suffix = ".t_", include.orig = TRUE,...)
{
    if(!is.ts(h) ) {stop("Please provide time series data.\n")}
    mh <- as.matrix(h); n1 <- dim(mh)[1]; n2 <- dim(mh)[2]      

    if (missing(var.name)) {
        if (n2==1) {var.name <- deparse(substitute(h))
        } else {var.name <- colnames(h)}
    } else {
        if(length(var.name)!=n2 ) {
        stop("The length of 'var.name' should equal to the number of variables")}    
    }

    all <- data.frame(matrix(nrow=n1-lag, ncol=n2*(lag+1)))  
    for (i in 1:n2) {       
      out <- data.frame(embed(mh[,i], dimension=lag+1) ) 
      ww <- paste(prefix, var.name[i], suffix, "0", sep="")
      if (lag>=1) {
          for(j in 1:lag) {
              ww2 <- paste(prefix, var.name[i], suffix, j, sep="")
              ww <- c(ww, ww2)
          }
      }        
      ia <- (lag+1)*(i-1)+1; ib <- (lag+1)*i  
      all[, ia:ib] <- out                   
      colnames(all)[ia:ib] <- ww
    }

    all <- ts(all, start=c(start(h)[1], start(h)[2]+lag), end=end(h), frequency=tsp(h)[3])       
    del <- -1 * seq(from=1, to=n2*(lag+1), by=1+lag)
    final <- if(include.orig) {all} else {all[, del ]} 
    return(final)
} 