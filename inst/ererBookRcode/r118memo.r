# Some constants for curves
a <- 10; b <- 5; k <- 0.1; h <- 0.01; ww <- 5.5; hh <- 5.5

# Graph version A          
win.graph(width = ww, height = hh, pointsize = 9)
bringToTop(stay = TRUE)
par(mai = c(0.4, 0.4, 0.1, 0.1), family = "serif")
curve(k + b * sqrt(1 - ((x - h) / a)^2), 
 from = 0, to = 10, n = 500, xlim = c(0, 10.5), ylim = c(-6.5, 6.5))

# Graph version B
win.graph(width = ww, height = hh, pointsize = 9)
par(mai = c(0.1, 0.1, 0.1, 0.1), family = "serif")
curve(k + b * sqrt(1 - ((x - h) / a)^2), axes = F, ann = F,
  from = 0, to = 10, n = 500, xlim = c(0, 10.5), ylim = c(-6.5, 6.5))

# Graph version C
pdf(file="c:/aErer/aBook/fig_memo.pdf",
  width = ww, height = hh, pointsize = 9)
par(mai = c(0.1, 0.1, 0.1, 0.1), family = "serif")
curve(k + b * sqrt(1 - ((x - h) / a)^2), axes = F, ann = F,
   from = 0, to = 10, n = 500, xlim = c(0, 10.5), ylim = c(-6.5, 6.5))

# Shared commands for all three versions
curve(-k - b * sqrt(1 - ((x - h) / a)^2), 
  from = 0, to = 10, n = 500, add = TRUE) 
box()

segments(0, 0, 10, 0, col = "gray80", lwd = 10, lend = 2)
arrows(1, c(-1.5, 1.5), 1, c(-3,3), col = "gray80", lwd = 10, 
   code = 2, length = 0.15, angle = 20, lend = 1, ljoin = 1) 
rect(0.2, c(-0.3, 0.3), 5,  c(-1.2, 1.2), col = "white")
text(1.1, 0.7, "An author's work", pos = 4, adj = c(1,1))
text(0.9, -0.8, "A reader's memory", pos = 4, adj = c(1,1))
rect(c(0, 3, 6, 0, 3, 6), c(5.2, 3.4, 1.6, -5.2, -3.4, -1.6),  
  c(3.5, 6.5, 9.5, 3.5, 6.5, 9.5), c(6.6, 4.8, 3.0, -6.6, -4.8, -3.0), 
  col = "white")
rect(8.6, -1.0, 10.7, 1.2, col = "gray90", border = NULL)
rect(8.5, -1.1, 10.5, 1.1, col = "white")

text(x = c(0.1, 3.1, 6.1), y = c(5.8, 3.95, 2.15, -6.1, -4.3, -2.5), 
  pos = 4, adj = c(1, 1), labels = c(  
  "1. Research Idea\n- One sentence\n- Many months", 
  "2. Outline\n- 2 pages\n- Several months",
  "3. Details\n- 30 pages\n- Several months",
  "3. Research Idea\n- Topic only\n- After several years",
  "2. Outline\n- Structure only\n- In a year",   
  "1. Details\n- Most facts\n- In several days"))
text(x = 8.8, y = 0.4, labels = "Paper", pos = 4, adj = c(1, 1))
dev.off() # for Graph version C only