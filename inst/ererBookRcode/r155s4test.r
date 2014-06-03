# A. Test the new function for linear model: lm2
library(erer); data(daIns)
ny <- lm2(data = daIns, name.y = "Y", 
  name.x = colnames(daIns)[-c(1, 14)])
slotNames(ny); ny@sigma2
slot(object = ny, name = "sigma2"); getSlots("lm2")
show(ny); ny; plot(ny); class(ny); 
showMethods(classes = "lm2") 
getMethod("show", "lm2"); getMethod("plot", "lm2")

# Two error trials
lm2(data = daIns, name.y = "Y", name.x =c("Injury", "gender")) # Gender
lm2(data = daIns, name.y = 45,  name.x =c("Injury", "Gender")) # 45

# B. Comparison with 'lm' as implemented the base R by S3
gg <- lm(formula = Y ~ 1 + Injury + HuntYrs + Nonres + Lspman + Lnong +
  Gender + Age + Race + Marital + Edu + Inc + TownPop, data = daIns)
names(gg); summary(gg); plot(residuals(gg))