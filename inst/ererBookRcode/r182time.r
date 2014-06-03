# A. Source the lm2 function for linear model
source('c:/aErer/aBookRcode/r155s4.r')

# B. Compare time used by lm2 and lm 
t0 <- proc.time()
  for (i in 1:100) {
    ny <- lm2(daIns, name.y = "Y", name.x = colnames(daIns)[-c(1, 14)])
  }
t1 <- proc.time(); ta <- t1 - t0

tb <- system.time(
  for (i in 1:100) {
    ny <- lm2(daIns, name.y = "Y", name.x = colnames(daIns)[-c(1, 14)])
  }
)

tc <- system.time(
  for (i in 1:100) {
    gg <- lm(formula = Y ~ 1 + Injury + HuntYrs + Nonres + Lspman + 
      Lnong + Gender + Age + Race + Marital + Edu + Inc + TownPop, 
      data = daIns)
  }
)
rbind(ta, tb, tc) 

# C. Recording time used by component in a function
Rprof("c:/aErer/aBookRcode/timefile.txt", memory.profiling = TRUE)
for (i in 1:100) {
  ny <- lm2(daIns, name.y = "Y", name.x = colnames(daIns)[-c(1, 14)])
}
Rprof()  # profiling off
res <- summaryRprof(filename = "c:/aErer/aBookRcode/timefile.txt")
names(res); res[["by.total"]][1:10, ]

# D. Memory
gc()
object.size(ny)
memory.profile()
memory.size()
memory.limit()