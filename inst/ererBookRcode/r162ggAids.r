# A. Data preparation: ggplot need a data frame 
library(erer); data(daBed); data(daBedRaw)
tot <- window(daBedRaw[, "vWD"], start=c(2001,1), end=c(2008,12))/ 10^6
sha <- daBed[, c('sCN','sVN','sID','sMY','sCA','sBR','sIT')] * 100
y <- ts.union(tot, sha); colnames(y) <- c('TotExp', colnames(sha))
windows(width = 5.5, height = 5) # Traditional graph
plot(x = y, xlab = "", main = "", oma.multi = c(2.5, 0, 0.2, 0))

# Data for ggplot
var.x <- as.Date(time(y), format="%Y-%m-%d") 
wrap.n <- c('Total Expenditure ($ mil)', '1. China (%)', 
  '2. Vietnam (%)', '3. Indonesia (%)', '4. Malaysia (%)', 
  '5. Canada (%)', '6. Brazil(%)', '7. Italy (%)')
daFig <- NULL
for (i in 1:8) {
  hh <- data.frame(VAR.x = var.x, VAR.y = c(y[, i]), wrap = wrap.n[i])
  daFig <- rbind(daFig, hh)
}  
daFig$wrap <- factor(x = daFig$wrap, levels = 
  wrap.n[c(1,5,2,6,3,7,4,8)], ordered = TRUE)
levels(daFig$wrap)
daFig1 <- daFig[daFig$wrap %in% wrap.n[1:4], ]
daFig2 <- daFig[daFig$wrap %in% wrap.n[5:8], ]
break.x <- c(2002, 2004, 2006, 2008)

# B. Create a graph in ggplot
library(ggplot2)
fa <- ggplot(data = daFig) +
  geom_line(aes(x = VAR.x, y = VAR.y)) + 
  facet_wrap( ~ wrap, nrow = 4, scales = 'free_y') +
  scale_x_date(name = '', labels = as.character(break.x),
    breaks=as.Date(paste(break.x, "-1-1", sep=""), format="%Y-%m-%d"))+
  scale_y_continuous(name='') + 
  theme(axis.text.x  =element_text(size=8, family='serif')) +
  theme(axis.text.y  =element_text(size=8, family='serif')) + 
  theme(axis.title.x =element_text(size=8, family='serif')) +
  theme(axis.title.y =element_text(size=8, family='serif')) +
  theme(strip.text.x =element_text(size=8, family='serif')) +
  theme(strip.text.y =element_text(size=8, family='serif'))

fb <- fa +                                    # no gray background
  theme(panel.grid.minor = element_blank() ) +    
  theme(panel.grid.major = element_blank() ) +
  theme(panel.background = element_rect(fill="white", color="black"))+
  theme(strip.background = element_rect(fill="grey85",colour="grey70"))+ 
  theme(strip.text.x     = element_text(size=8, colour="black"))

# C. Show the graph on a screen device
windows(width = 5.5, height = 5); fa

# D. Save the graph on a file device
ggsave(filename="C:/aErer/fig_ggAids.pdf", plot=fa, width=5.5, height=5)