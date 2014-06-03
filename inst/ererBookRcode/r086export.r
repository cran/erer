### Demonstration for exporting tables and graphs from R

# Exporting two data frames to two seperate files
write.table(x = table.3, file = "insTab3.csv", sep = ",")
write.table(x = table.4, file = "insTab4.csv", sep = ",")

# Exporting two data frames to one file
# Warning messages will be generated with "append = TRUE"
write.table(x = table.3, file = "insTabALL.csv", sep = ",", append = F)
write.table(x = table.4, file = "insTabAll.csv", sep = ",", append = T)
           
# 'listn' assigns list names automatically
out.a <- list(table.3 = table.3, table.4 = table.4)
out.b <- listn(table.3, table.4)
identical(out.a, out.b) # This is TRUE

# Using listn and write.list to export multiple tables
# insTabAll2 is similar to insTabAll (small format differences)
out <- listn(table.3, table.4)
write.list(z = out, file = "insTabAll2.csv")

# Export graphs
png(file = "figure2.png")
  plot(1:10)
dev.off()