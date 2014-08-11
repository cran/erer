# Load library and data
library(aplpack); data(longley); str(longley); longley

# Some practices
windows(); bringToTop(stay = TRUE)
faces()
faces(face.type = 0)
faces(rbind(1:4, 5:3, 3:5, 5:7), face.type = 2)
faces(longley[c(1, 6, 11, 16), ], face.type = 1)
faces(longley[c(1, 6, 11, 16), ], face.type = 0)

# Display on the screen device
windows(width = 5.3, height = 2.5, pointsize = 9); bringToTop(stay = TRUE)
par(mar = c(0, 0, 0, 0))
aa <- faces(xy = longley[c(1, 6, 11, 16), ], plot = FALSE)
plot(x = aa, face.type = 2, width = 1.1, height = 0.9)
showFace <- recordPlot()

# Save the graph on a file device
pdf(file = 'fig_showFace.pdf', width = 5.3, height = 2.5, pointsize = 9)
replayPlot(showFace); dev.off()