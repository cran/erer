# Three components in the base R graphics system
# A. Plotting data
Year <- 2001:2005
Return <- c(0.10, 0.12, -0.05, 0.18, 0.13) * 100

# B. Graphics device
windows(width = 5, height = 3, pointsize = 11) 
par(mai = c(0.8, 0.8, 0.1, 0.1))

# C. High-level plotting function
plot(x = Year, y = Return, type = 'l', ylab = 'Return (%)')

# change the range of the y axis
# plot(x = Year, y = Return, type = 'l', ylab = 'Return (%)', 
#   ylim = c(-50, 50))

# D. Low-level plotting function
points(x = Year, y = Return, pch = 1:5)