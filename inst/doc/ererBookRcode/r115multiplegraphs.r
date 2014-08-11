# A. Multiple series or columns by plot()
library(erer); data(daBed, daBedRaw)
toto <- window(daBedRaw[, "vWD"], start = c(2001, 1), end = c(2008, 12))
tot <- toto / 10 ^ 6
sha <- daBed[, c('sCN', 'sVN', 'sID', 'sMY', 'sCA', 'sBR', 'sIT')] * 100
bed <- ts.union(tot, sha); colnames(bed) <- c('TotExp', colnames(sha))
head(bed)

windows(width = 5.5, height = 5, family = 'serif', pointsize = 11)
plot(x = bed, xlab = "", main = "", oma.multi = c(2.5, 0, 0.2, 0))

pdf(file = "fig_timeseries.pdf", width = 5.5, height = 5, 
  family = 'serif', pointsize = 11) 
plot(x = bed, xlab = "", main = "", oma.multi = c(2.5, 0, 0.2, 0))
dev.off()

# pair of data frame objects
dnor <- data.frame(aa = rnorm(30), bb = rnorm(30), cc = rnorm(30))
windows(); bringToTop(stay = TRUE); plot(dnor) 

# B. split.screen()
windows(); bringToTop(stay = TRUE)
split.screen(figs = c(3, 2)) # split display into 6 screens
for (i in 1:6) {
  screen(n = i)  # open screen
  plot(rnorm(10), pch = as.character(i))
}
close.screen(all.screens = TRUE)  # close the split status

# C. Parameter setting by par(): mfcol, mfrow
windows(); bringToTop(stay = TRUE); par(mfrow = c(3, 2)) 
for (i in 1:6) {
  plot(rnorm(10), pch = as.character(i))
}

# D. layout()
windows(); bringToTop(stay = TRUE)
layout(mat = matrix(1:6, byrow = FALSE, ncol = 2)) 
for (i in 1:6) {
  plot(rnorm(10), pch = as.character(i))
}