# A. New function for adjusting and calculating exam scores
score <- function (y, 
  sort.by = c("Letter", "Exam.A", "Exam.B", "Total"), ...)
{
  # A1. Input
  if (class(y) != "data.frame" || ncol(y) != 3) {
    stop("y should be a data fram with three columns.\n")
  }
  sort.by <- match.arg(sort.by)
     
  # A2. Transformation
  y2 <- y
  y2$Total <- y2[, 2] * 0.4 + y2[, 3] * 0.6
  y2$Letter <- ifelse(y2$Total >= 90, "A", ifelse(y2$Total >= 80, "B", 
    ifelse(y2$Total >= 70, "C", ifelse(y2$Total >= 60, "D", "F"))))  
  y.new <- y2[order(y2[, sort.by], ...), ]
  rownames(y.new) <- 1:nrow(y.new)  
      
  # A3. Output
  result <- list(y = y, y.new = y.new)
  class(result) <- c("score", "scoreNum")
  return(result)
}

# B. Define print method
print.score <- function (x, ...) {
  cat("\n========================================\n")
  cat("    Adjusted Exam Scores\n")
  cat(  "========================================\n")
  print(x$y.new)
  invisible(x)
}

mean.scoreNum <- function (x, ...) {
  table(x$y.new$Total, x$y.new$Letter)
}

# C. Test
raw <- data.frame(Student = c("Smith, Bob", "Green, Joe", "Hue, Lisa"),
  Exam.A = c(85, 55, 90), Exam.B = c(82, 49, 97), stringsAsFactors = F)
agg <- score(y = raw, sort.by = "Letter", decreasing = F)
args(score); formals(score); body(score)
agg[] # print out all the contents 
raw; names(agg); agg; mean(agg)
methods(class = "score"); methods(generic.function = print)
print.default; getAnywhere(print.acf); stats:::print.acf

# D. S3 is convenient but not rigorous / not safe
aa <- 10; aa # print.default works.
class(aa) <- c("score", "scoreNum"); aa # print.score doest not work.
aa$test <- "test"; class(aa); aa # print.default works again!