# A. Data preparation: ggplot needs a data frame 
library(erer); data(daBed); data(daBedRaw)
toto <- window(daBedRaw[, "vWD"], start = c(2001, 1), end = c(2008, 12))
tot <- toto / 10 ^ 6
sha <- daBed[, c('sCN', 'sVN', 'sID', 'sMY', 'sCA', 'sBR', 'sIT')] * 100
bed <- ts.union(tot, sha); colnames(bed) <- c('TotExp', colnames(sha))
windows(width = 5.5, height = 5)  # Traditional graph
plot(x = bed, xlab = "", main = "", oma.multi = c(2.5, 0, 0.2, 0))

# Data for ggplot
var.x <- as.Date(x = time(bed), format = "%Y-%m-%d") 
wrap.n <- c('Total Expenditure ($ mil)', '1. China (%)', '2. Vietnam (%)',
  '3. Indonesia (%)', '4. Malaysia (%)', '5. Canada (%)', 
  '6. Brazil(%)', '7. Italy (%)')
daFig <- NULL
for (i in 1:8) {
  hh <- data.frame(VAR.x = var.x, VAR.y = c(bed[, i]), wrap = wrap.n[i])
  daFig <- rbind(daFig, hh)
}  
daFig$wrap <- factor(x = daFig$wrap, levels = 
  wrap.n[c(1, 5, 2, 6, 3, 7, 4, 8)], ordered = TRUE)
levels(daFig$wrap)
daFig1 <- daFig[daFig$wrap %in% wrap.n[1:4], ]  # data for column 1
daFig2 <- daFig[daFig$wrap %in% wrap.n[5:8], ]  # data for column 2
break.x <- c(2002, 2004, 2006, 2008)

# B1. Create ggplot 
library(ggplot2)
theme_set(theme_gray(base_size = 10, base_family = 'serif'))  # global
fa <- ggplot(data = daFig) +  # all
  geom_line(mapping = aes(x = VAR.x, y = VAR.y)) + 
  facet_wrap(facets = ~ wrap, nrow = 4, scales = 'free_y') +
  scale_x_date(name = '', labels = as.character(break.x), breaks = 
    as.Date(paste(break.x, "-1-1", sep = ""), format = "%Y-%m-%d"))+
  scale_y_continuous(name = '') +
  theme_gray(base_size = 10, base_family = 'serif')
   
fb <- fa +  # all + no gray background
  theme_bw(base_size = 10, base_family = 'serif') +
  theme(panel.grid.minor = element_blank()) +    
  theme(panel.grid.major = element_blank())
fc1 <- fa %+% daFig1  # 1st column
fc2 <- fa %+% daFig2  # 2nd column
  
# C1. Show graphs on a screen device 
windows(width = 5, height = 4); bringToTop(stay = TRUE); fa
windows(width = 5, height = 4); bringToTop(stay = TRUE); fb

# C2. Combine two graphs with viewport to reduce margins
library(grid); u <- "inches"
win.graph(width = 5, height = 4); bringToTop(stay = TRUE)
vp.right <- viewport(x = 0.45, y = -0.06, width = 0.575, height = 1.1,
  just = c('left', 'bottom'))
vp.left <- viewport(x = -0.054, y = -0.06, width = 0.575, height = 1.1,
  just = c('left', 'bottom'))  
print(fc2, vp = vp.right); print(fc1, vp = vp.left)
fc <- recordPlot()

# D. Save graphs on a file device
ggsave(filename = "fig_ggplotAids.pdf", plot = fa, width = 5, height = 4)
pdf(file = "fig_ggplotAidsGrid.pdf", width = 5, height = 4)
replayPlot(fc); dev.off()




