# Parameters in par()
?par; example(par)
p71 <- par(no.readonly = FALSE) # 71 total parameters
p66 <- par(no.readonly = TRUE ) # 66 settable parameters
p05 <- p71[!(names(p71) %in% names(p66))]   # 5 for queries only
sort(noquote(names(p71)))
sort(noquote(names(p05)))

# Three uses of par()
par(c("pch", "col")) # a. querying graphics state
par(col = "red") # b. setting parameters

oldPar <- par(mfrow = c(3, 2), col = "green") # c. setting; retoring
oldPar
par(c("mfrow", "col"))
for (i in 1:6) {plot(rnorm(100), pch = i)}
par(oldPar)