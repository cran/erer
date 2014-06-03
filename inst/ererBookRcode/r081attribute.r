# Run the program version for Sun et al. (2007) by source().
# Create a new object for demonstration.
# Show 3 selected observations.
source("r072sunSJAF.r", echo = FALSE)
nam <- daInsNam; nam[c(3, 11, 14), ]

# Show all attributes or a specific one
attributes(nam)   
attr(nam, "class")

# Revise or create attributes
attr(nam, "names") <- c("vari", "defi")  # Revise an existing attribute
attr(nam, "years") <- 2005:2008          # A new numerical attribute
attr(nam, "color") <- "red"              # A new character attribute
attr(daIns, "description") <- daInsNam   # A new data.frame attribute
attributes(nam)                          # Show all attributes again
nam[c(3, 11, 14), ]                      # Show 3 selected obs again

# Reveal the attribute of an object from regressions
class(ra); mode(ra); typeof(ra); length(ra); tsp(ra); names(ra)[1:4]

# Change the class for an existing object
(class(ra) <- c("glm", "lm", "myClass"))

# Methods for generic function or class
methods(generic.function = mean); methods(class = "maTrend")