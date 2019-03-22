library(qpcR)
# 행과 열의 수가 달라도 합칠 수 있게 하기 위해 qpcR 패키지를 사용한다.


a <- read.table('1_Extracted.txt', sep='\n')
a <- t(a) # 행과 열을 바꾼ㄷ
rownames(a) <- c('1')


i <- 246
# 총 246개의 파일을 합칠 것이다.

for(x in 2:i){
  data_name <- paste0(x,'_Extracted.txt')
  data <- read.table(data_name)
  data <- t(data)
  rownames(data) <- c(x) 
  
  a <- qpcR:::rbind.na(a,data) # 행을 결합한다
}


write.csv(a,'test.csv')