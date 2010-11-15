aiStaHau <- function(x, instr, choice = FALSE, ...)
{
    if (class(x)[1] != "aiStaFit") {
      stop("Please provide an object from 'aiStaFit'.\n")}
    if (class(instr) !="ts") {
        stop("instr should be a single time series.\n")}
    if (!identical(tsp(x$y), tsp(instr))) {
        stop("x and instr should have the same imension.\n")}
    frq <- tsp(x$y)[3]
           
    d <- ifelse(choice, 1, 0)
    m.ins <- deparse(substitute(instr))
    exp.fit <- paste(x$expen, ".fit", sep="")
    nam <- c(paste(x$expen, ".t_", 0, sep = ""),
             paste(x$expen, ".t_", 1, sep = ""),
             paste(x$price, ".t_", d, sep = ""),
             paste(m.ins,   ".t_", d, sep = ""))
    daIns <- ts.union(x$y, log(instr))
    colnames(daIns) <- c(colnames(x$y), m.ins)
    daHau <- bsLag(daIns, lag = 1)[, nam]   
    formuHau <- as.formula(paste(nam[1], "~."))       
    aux <- lm(formula = formuHau, data = daHau)   

    res <- ts(residuals(aux), start=start(daHau), freq=frq) 
    fit <- ts(fitted(aux),    start=start(daHau), freq=frq)   
    daFit <- window(ts.union(x$y, res, fit), start=start(x$y) + c(0,1), freq=frq) 
    colnames(daFit) <- c(colnames(x$y), "resid", exp.fit)

    aiBase <- aiStaFit(y=daFit, share=x$share, price=x$price, expen=x$expen, 
        shift=x$shift, omit=x$omit, hom=FALSE, sym=FALSE)
    aiHaus <- update(aiBase, shift=c(x$shift, "resid"))
    ratio <- lrtest(aiBase$est, aiHaus$est)
    result <- list(daHau = daHau, formuHau = formuHau, regHau = aux,
       daFit = daFit, aiBase = aiBase, aiHaus = aiHaus, ratio = ratio)
    class(result) <- c("aiStaHau", "aiFit")
    return(result)
} 