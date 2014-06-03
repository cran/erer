# Title: R program for Sun et al. (2007 SJAF)
# Date: January - May 2006

# --- Brief contents --------------------------------------------------
# Step 0: Libraries needed
# Step 1: Import data
# Step 2: Descriptive statistics
# Step 3: Logit regression and figures
# Step 4: Export results

# --- Step 0: Libraries needed ----------------------------------------
library(erer) # functions of bsTab(), maBina(), and maTrend()

# --- Step 1: Import data ---------------------------------------------
# 1.1 Set up working directory
(wdOld <- getwd())
wdNew <- "C:/aErer/Rcode"
setwd(wdNew); getwd()

# 1.2 Import data in csv format
vaNam <- read.table("insData1.csv", header = TRUE, sep = ",")
daIns <- read.table("insData2.csv", header = TRUE, sep = ",")
class(vaNam); dim(vaNam); print(vaNam)
class(daIns); dim(daIns); 
head(daIns); tail(daIns); daIns[1:3, 1:5]

# --- Step 2: Descriptive statistics ----------------------------------
(insMean <- round(x = apply(daIns, MARGIN = 2, FUN = mean), digits=2))
(insCorr <- round(x = cor(daIns),  digits = 3))
table.3 <- data.frame(vaNam, Mean = insMean)[-14,]
rownames(table.3) <- 1:nrow(table.3)
table.3

# --- Step 3: Logit regression and figures ----------------------------
# 3.1 Logit regression
ra <- glm(formula = Y ~ Injury + HuntYrs + Nonres + 
                    Lspman + Lnong + Gender + Age + 
                    Race + Marital + Edu + Inc + TownPop, 
          family = binomial(link = "logit"),
          data = daIns, x = TRUE)
rb <- update(object = ra, 
          formula = Y ~ Injury + FishYrs + Nonres + 
                    Lspman + Lnong + Gender + Age + 
                    Race + Marital + Edu + Inc + TownPop)

names(ra); summary(ra)
(ca <- data.frame(summary(ra)$coefficients))
(cb <- data.frame(summary(rb)$coefficients))

# 3.2 Marginal effect
(me <- maBina(w = ra))
(u1 <- bsTab(w = ra, need = "2T"))
(u2 <- bsTab(w = me$out, need = "2T"))
table.4 <- cbind(u1, u2)[, -4]
colnames(table.4) <- c("Variable", "Coefficient", 
  "t-ratio", "Marginal effect", "t-ratio")
print(table.4, right = FALSE)

# 3.3 Figures: probability response curve
(p1 <- maTrend(q = me, nam.c = "HuntYrs", nam.d = "Nonres"))
(p2 <- maTrend(q = me, nam.c = "Age",     nam.d = "Nonres"))
(p3 <- maTrend(q = me, nam.c = "Inc",     nam.d = "Nonres"))

windows(width = 4, height = 3, pointsize = 9)
bringToTop(stay = TRUE)
par(mai = c(0.7, 0.7, 0.1, 0.1), family = "serif")
plot(p1)

png(file = "fig1a.png", width = 4, height = 3, 
  units = "in", pointsize = 9, res = 300)
par(mai = c(0.7, 0.7, 0.1, 0.1), family = "serif")
plot(p1)
dev.off()

# --- Step 4: Export results ------------------------------------------
write.table(x = table.3, file = "insTab3.csv", sep = ",")
write.table(x = table.4, file = "insTab4.csv", sep = ",")