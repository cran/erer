# A. Download packages at R console: zip, tar.gz, pdf
#    Then copy the skeleton format of an existing package.
library(erer)
download.lib(pkgs = c('apt', 'erer'), destdir = 'c:/aErer/aBookRcode', 
  f.zip = FALSE, f.pdf = TRUE)
  
# B. Creating a draft of package skeleton directly
fnTest <- function(y) {
  w <- y + 10
  result <- list(y = y, w = w)
  class(result) <- "fntest"
  return(result)
}
print.fntest <- function(x, ...) {print(x$w)}
daTest <- data.frame(name = letters[1:3], grade = c(90, 85, 97))
package.skeleton(name = "mypkTest", path = "C:/aErer/aBookRcode",
  list = c("fnTest", "print.fntest", "daTest")) 

prompt(object = fnTest)
promptData(object = daTest)