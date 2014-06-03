# A. Screen devices
dev.new(); plot(1:3)
windows(width = 6, height = 6); plot(10:15)
windows(width = 5, height = 5, bg = 'pink'); plot(rnorm(10))
dev.cur(); dev.size()
dev.list() # three screen devices

# B. Four file devices; different file sizes
# test.pdf =12 kb, test.wmf =264 kb, test.png =144 kb, test.jpeg =797 kb
setwd("C:/aErer/aBookRcode")
pdf(file="test.pdf", width = 6, height = 4)
set.seed(5); plot(rnorm(1000))
dev.list() # three screen and one file devices
dev.off()

win.metafile("test.wmf", width= 6, height = 4)
set.seed(5); plot(rnorm(1000))
dev.off()

png("test.png", width = 6, height = 4, units="in", res = 600)
set.seed(5); plot(rnorm(1000))
dev.off()

jpeg(file = "test.jpeg", width = 6, height = 4, units = "in", res=600)
set.seed(5); plot(rnorm(1000))
dev.off()

# C. Switching between screen and file devices by commenting in/out
# win.graph(width = 6, height = 6); bringToTop(stay = T) # screen
png("test2.png", width = 6, height = 4, units="in", res = 600) # file 1
plot(rnorm(1000))
# ... more ...
# ... plotting ...
# ... statements ...
dev.off() # file 2 