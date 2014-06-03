# A. Get data
source("c:/aErer/aBookRcode/r162ggAids.r")

# B1. Commmon themes
pp <- 
  theme(axis.text.x  =element_text(size=8, family='serif')) +
  theme(axis.text.y  =element_text(size=8, family='serif')) + 
  theme(axis.title.x =element_text(size=8, family='serif')) +
  theme(axis.title.y =element_text(size=8, family='serif')) +
  theme(strip.text.x =element_text(size=8, family='serif')) +
  theme(strip.text.y =element_text(size=8, family='serif'))

# B2. Create ggplot for the first column
fa1 <- ggplot(data = daFig1) +
  geom_line(aes(x = VAR.x, y = VAR.y)) + 
  facet_wrap( ~ wrap, nrow = 4, scales = 'free_y') + 
  scale_x_date(name = '', labels = as.character(break.x),
    breaks=as.Date(paste(break.x, "-1-1", sep=""), format="%Y-%m-%d"))+
  scale_y_continuous(name='') + pp

# B3. Create ggplot for the second column    
fa2 <- ggplot(data = daFig2) +
  geom_line(aes(x = VAR.x, y = VAR.y)) + 
  facet_wrap( ~ wrap, nrow = 4, scales = 'free_y') +  
  scale_x_date(name = '', labels = as.character(break.x),
    breaks=as.Date(paste(break.x, "-1-1", sep=""), format="%Y-%m-%d"))+
  scale_y_continuous(name='') + pp

# C. Combine two graphs with viewport to reduce margins
library(grid); u <- "inches"
win.graph(width = 5.5, height = 5)
print(fa2, vp = viewport(
  width=unit(3.1,u), height=unit(5.3,u), x=unit(4.1,u), y=unit(2.45,u)))
print(fa1, vp = viewport(
  width=unit(3.1,u), height=unit(5.3,u), x=unit(1.29,u),y=unit(2.45,u)))

# D. Save the combined graph on a file device
pdf(file="c:/aErer/fig_grid.pdf", width=5.5, height=5)
print(fa2, vp = viewport(
  width=unit(3.1,u), height=unit(5.3,u), x=unit(4.1,u), y=unit(2.45,u)))
print(fa1, vp = viewport(
  width=unit(3.1,u), height=unit(5.3,u), x=unit(1.29,u),y=unit(2.45,u)))
dev.off() 

