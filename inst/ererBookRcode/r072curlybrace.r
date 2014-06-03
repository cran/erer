# a. Correct use of if/else
x <- 10
if (x > 5) { 
    y <- x + 1
} else {
    y <- x + 2
}
x; y

# b. Correct use of if and operator + 
if (x > 5) { 
    m <- x + 
        200
}
x; m

# c. Incorrect use of if/else; a parenthesis mismatch
if (x > 5) {
    z <- x + 1 }
else {
    z <- x + 2 
} 
x; z 