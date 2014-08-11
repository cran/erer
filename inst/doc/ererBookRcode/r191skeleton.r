# A. Download packages at R console: zip, tar.gz, pdf
#    Then copy the skeleton format of an existing package.
library(erer)
download.lib(pkgs = c("apt", "erer"), destdir = "c:/aErer/aBookRcode", 
  f.zip = FALSE, f.pdf = TRUE)
  
# B. Create a package skeleton within R console
testFun <- function(y) {
  w <- y + 10
  result <- list(y = y, w = w)
  class(result) <- "testfun"
  return(result)
}
print.testfun <- function(x, ...) {print(x$w)}
testDa <- data.frame(name = letters[1:3], grade = c(90, 85, 97))
package.skeleton(name = "testMypk", path = "C:/aErer/aBookRcode",
  list = c("testFun", "print.testfun", "testDa")) 

prompt(object = testFun)
promptData(object = testDa)

# C. Create a package skeleton on a local drive manually 
#    Just can be done with normal operations on foldres