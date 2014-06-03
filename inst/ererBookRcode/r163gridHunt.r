# A. Run the program and generate the data
setwd("C:/aErer/aBookRcode"); source("r072sunSJAF.r", echo = FALSE)
pr <- p1$trend; class(pr); head(pr)

library(grid)
windows(); bringToTop(stay = TRUE)
pushViewport(plotViewport(c(5,4,2,2))) 
pushViewport(dataViewport(pr$HuntYrs, pr$Nonres_d0.pr, name ="plotRegion"))
grid.points(pr$HuntYrs, pr$Nonres_d0.pr, name = "dataSymbols", pch ="." )
grid.points(pr$HuntYrs, pr$all.pr, name = "dataSymbols", pch ="." )
grid.points(pr$HuntYrs, pr$Nonres_d1.pr, name = "dataSymbols", pch ="." )

grid.rect()
grid.xaxis()
grid.yaxis()
grid.text("Hunting experience (Year)", y = unit(-3, "lines"))
grid.text("Prob(Insurance purchase = yes)", x = unit(-3, "lines"), rot=90)