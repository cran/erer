print.evReturn <- function(x, ...){
    if (class(x) != "evReturn") {
        stop("Please provide an object from 'evReturn'.\n")
    }    
    cat("\n==================================================================\n")
    cat("    Regression coefficients by firm\n")
    cat("==================================================================\n")
    print(x$reg)

    cat("\n==================================================================\n")
    cat("    Abnormal returns by date\n")
    cat("==================================================================\n")
    print(x$abr)
    
    cat("\n==================================================================\n")
    cat("    Average abnormal returns across firms\n")
    cat("==================================================================\n")
    print(x$abc)       
}