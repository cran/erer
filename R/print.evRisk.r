print.evRisk <- function(x, ...){
    if (class(x) != "evRisk") {
        stop("Please provide an object from 'evRisk'.\n")
    }    
    print(x$reg)
}