### Demonstration for random sampling

# Random sampling of a vector
set.seed(40); ma <- sample(x = 11:15, size = 3)
set.seed(40); mb <- sample(x = 11:15, size = 8, replace = TRUE)
ma; mb

# Random sampling of a data frame
bob <- data.frame(inc = 1:5, year = 2001:2005)
set.seed(40); sam <- sample(x = 1:nrow(bob), size = nrow(bob) - 2)
bob2 <- bob[sam, ]
sam; bob; bob2