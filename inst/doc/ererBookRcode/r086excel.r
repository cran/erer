# One sheet can be imported as a data frame; 
# Many sheets can be imported as a list;
# The list name is the same as the Excel sheet name.
library(RODBC)
setwd("C:/aErer/aBookRcode"); getwd()
trade <- list()                                 
shname <- c("v1", "v2", "v3", "q1", "q2", "q3") 

da <- odbcConnectExcel2007("LogsData.xlsx")  # open a connection
  sheet <- sqlTables(da)
  pert <- sqlFetch(da, "FAO_data")  # save one sheet in a data frame
  for (m in 1:length(shname)) {     # save many sheets in a list
    trade[[m]] <- sqlFetch(da, shname[m])
  }
  names(trade) <- shname
odbcClose(da)  # close the connection