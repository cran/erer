# A. Create data
library(maps); library(ggplot2); library(plyr); 
states <- map_data("state"); str(states); tail(states)
mbr <- data.frame(region = c('florida', 'texas', 'alabama', 
    'north carolina', 'virginia', 'mississippi',  'georgia', 'louisiana', 
    'south carolina', 'arkansas', 'tennessee', 'oklahoma', 'kentucky'), 
  short = c("FL", "TX", "AL", "NC", "VA", "MS", "GA", "LA", "SC",  
    "AR", "TN", "OK", "KY"),
  type = c(1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3))
law <- merge(x = states, y = mbr, sort = FALSE, by = "region")
law2 <- law[order(law$order), ]; str(law2); tail(law2)

mid_range <- function(x) {mean(range(x, na.rm = TRUE))}
centres <- ddply(states, .(region), colwise(mid_range, .(lat, long)))
cent <- centres[centres$region %in% mbr$region, ]; cent
cent2 <- merge(x = cent, y = mbr[, 1:2], by = 'region')
cent2$short <- as.character(cent2$short) 
cent2[c(3, 6, 8:9, 12:15), "long"] <-  -1 * c(81.5, 92, 78.5, 97, 99, 
  78.5, 89, 78.5)
cent2[c(5, 6, 13:15), "lat"] <- c(37.3, 30.5, 37.2, 27.5, 31)
cent2[14:15, "short"] <- c('Gulf of Mexico', 'Atlantic Ocean'); cent2   

# B. Draw ggplot
fig2 <- ggplot(data = law2) +
  geom_polygon(mapping = aes(x = long, y = lat, fill=type, group=group)) +
  borders("state", mbr$region, colour="grey40") +
  geom_text(mapping = aes(x = long, y = lat, label = short), data = cent2, 
    size = 2.5, family = 'serif') +
  scale_x_continuous (name = "Longitude", breaks = seq(-110, -75, by=6)) +
  scale_y_continuous (name = "Latitude", expand = c(0, 0.5), 
    breaks = seq(24, 40, by = 3)) +
  scale_fill_gradient(name = "", low = "grey55", high = "grey97",
    breaks = c(1, 2, 3), labels = c(' I', ' II', ' III')) + 
  theme_bw(base_size = 9, base_family = 'serif') + 
  theme(panel.grid.minor  = element_blank()) +    
  theme(panel.grid.major  = element_blank()) +
  theme(legend.position   = c(0.07, 0.8)) +
  theme(legend.key.size   = unit(0.3, "cm")) 

# C. Show graph on screen and save as pdf 
win.graph(width = 5.5, height = 3.4); fig2  # ratio w/h = 1.6
pdf(file = "fig_map.pdf", width = 5.5, height = 3.4); fig2; dev.off()