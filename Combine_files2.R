library(arules)
library(arulesViz)

a <- readLines('1_Extracted.txt')
b <- readLines('2_Extracted.txt')
dataSet <- list(a,b)  

i <- 246

for(x in 3:i){
  data_name <- paste0(x,'_Extracted.txt')
  data <- readLines(data_name)
  dataSet[x] <- list(data)
}


dataSet1 <- as(dataSet,"transactions")
inspect(dataSet1)