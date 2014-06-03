source("r072sunSJAF.r", echo = FALSE)

# A. Exporting two tables in data frame to two seperate files
write.table(x = table.3, file = "insTab3.csv", sep = ",")
write.table(x = table.4, file = "insTab4.csv", sep = ",")

# B. Exporting two tables to one file
# Warning messages will be generated with "append = TRUE"
write.table(x = table.3, file = "insTabALL.csv", sep = ",", append = FALSE)
write.table(x = table.4, file = "insTabAll.csv", sep = ",", append = TRUE)

# C. Using listn() and write.list() to export multiple tables to one file           
# listn() assigns list names automatically
out.a <- list(table.3 = table.3, table.4 = table.4)
out.b <- listn(table.3, table.4)
identical(out.a, out.b)  # This is TRUE

# insTabAll2 is similar to insTabAll (small format differences)
out <- listn(table.3, table.4)
write.list(z = out, file = "insTabAll2.csv")

# Export graphs
png(file = "figure2.png")
  plot(1:10)
dev.off()