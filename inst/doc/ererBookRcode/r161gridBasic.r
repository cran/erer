# A. Three scenarios for "vp" in the plotting function
vp1.des <- viewport(width = 0.9, height = 0.9, name = "vp1.pushed")
vp2.des <- viewport(width = 0.5, height = 0.5, name = "vp2.pushed")

# A1. vp = NULL (default)
windows(width = 5.4, height = 3); bringToTop(stay = TRUE)
current.viewport()    # ROOT
pushViewport(vp1.des)
grid.rect(vp = NULL)  # vp1.pushed

# A2. vp = viewport object
windows(width = 5.4, height = 3); bringToTop(stay = TRUE)
grid.text("Output B", gp = gpar(col= 'red'), vp = vp1.des)
current.viewport()  # ROOT

windows(width = 5.4, height = 3); bringToTop(stay = TRUE)
pushViewport(vp1.des)  # vp1.pushed
grid.text("Output B", gp = gpar(col= 'green'), vp = NULL)
popViewport()  # ROOT

# A3. vp = pushed viewport name
windows(width = 5.4, height = 3); bringToTop(stay = TRUE)
pushViewport(vp1.des, vp2.des); current.vpTree()        # vp2.pushed
upViewport(0)                                           # ROOT
grid.rect(gp = gpar(lty = 'solid'), vp = "vp1.pushed")
downViewport(name = "vp1.pushed")                       # vp1.pushed
grid.rect(gp = gpar(lty = 'dashed'), vp = "vp2.pushed")
upViewport(n = 1)                                       # Root

windows(width = 5.4, height = 3); bringToTop(stay = TRUE)
pushViewport(vp1.des, vp2.des)        # vp2.pushed
upViewport(0)                         # [ROOT]
downViewport(name = "vp1.pushed")     # vp1.pushed
grid.rect(gp = gpar(lty = 'solid'))
downViewport(name = "vp2.pushed")     # vp2.pushed
grid.rect(gp = gpar(col = 'purple'))
upViewport(n = 1)                     # vp1.pushed

# B. Plotting functions, parameters, and units
convertX(unit(2.54, "cm"), "inches")  # 1inches
unit.c(unit(1:3, "inches"), unit(2:4, "cm"))

windows(width = 5.4, height = 2.5, pointsize = 9, family = 'serif')
bringToTop(stay = TRUE)
vp3.des <- viewport(x = 0.25, y = 0.4, width = 0.4, height = 0.4, 
  angle = 10, name = "vp3.pushed")
vp4.des <- viewport(x = 0.75, y = 0.4, width = 0.4, height = 0.4, 
  angle = -10, name = "vp4.pushed")
pushViewport(vpList(vp3.des, vp4.des))
current.viewport(); current.vpTree()  # a viewport list

upViewport(0) 
grid.rect(width = unit(1, "npc") - unit(3, "mm"), 
  height = unit(1, "npc") - unit(3, "mm"))
grid.text(label = "Learning viewports and primitive functions in grid",
  y = unit(1, "npc") - unit(2, "lines"), gp = gpar(fontsize = 9))

seekViewport(name = "vp3.pushed")
grid.rect(gp = gpar(lty = 2))
grid.curve(x1 = 0.1, y1 = 0.1, x2 = 0.9, y2 = 0.9, curvature = 0.4,
  arrow = arrow(), gp = gpar(lwd = 3, col = 'gray'))

seekViewport(name = "vp4.pushed")
grid.roundrect(gp = gpar(lty = 3), r = unit(0.3, "snpc"))
grid.points(x = 0.5, y = 0.5, pch = 11, size = unit(0.8, 'inches'))
out <- recordPlot()

pdf(file = "fig_gridBasic.pdf", width = 5.4, height = 3)
replayPlot(out); dev.off() 