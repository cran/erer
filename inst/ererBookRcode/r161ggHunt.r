# A. Run the program and generate the default graph
setwd("C:/aErer/aBookRcode")
source("r072sunSJAF.r", echo = FALSE)
names(p1); class(p1); plot.maTrend
windows(width = 4, height = 3, pointsize = 9); bringToTop(stay = TRUE)
par(mai = c(0.7, 0.7, 0.1, 0.1), family = "serif")
plot(p1)

# B1. Data preparation: ggplot need a data frame 
pr <- p1$trend; class(pr); head(pr)

# B2. Create a graph in ggplot
library(ggplot2)
fig1 <- ggplot(data = pr, mapping = aes(x = HuntYrs)) +
  geom_line(aes(y = all.pr)) +
  geom_line(aes(y = Nonres_d1.pr), linetype = 2) + 
  geom_line(aes(y = Nonres_d0.pr), linetype = 3)
fig2 <- fig1 + 
  scale_x_continuous(name = "Hunting experience (Year)") +
  scale_y_continuous(name = "Prob(Insurance purchase = yes)") +
  theme(axis.text.x  = element_text(size = 9, family = "serif")) +  
  theme(axis.text.y  = element_text(size = 9, family = "serif")) +
  theme(axis.title.x = element_text(size = 9, family = "serif")) +
  theme(axis.title.y = element_text(size = 9, family = "serif"))  
fig3a <- fig2 + theme_bw()
fig3b <- fig2 + 
    theme(panel.grid.minor =element_blank() ) +    
    theme(panel.grid.major =element_blank() ) +
    theme(panel.background =element_rect(fill="white", color="black"))
fig4 <- fig3b + 
  annotate(geom = "text", label = c("Nonresident", "All", "Resident"), 
    x = c(39,50,60), y = c(0.35,0.22,0.18), family = 'serif', size= 3)
str(fig4)
  
# B3. Show the graph on a screen device
windows(width = 4, height = 3); fig4

# B4. Save the graph on a file device
pdf(file="C:/aErer/fig_ggHunt.pdf", width=4, height=3); fig4; dev.off()
ggsave(filename="C:/aErer/fig_ggHunt.pdf", plot=fig4, width=4, height=3)