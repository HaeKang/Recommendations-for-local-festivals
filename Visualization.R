# 사용자에게 단어 입력 받으면 연관 단어 보여줌

user_word <- readline("insert word :")

# Apriori algorithm
data_user  <- apriori(dataSet1, parameter = list(support=0.1,
                                                 confidence = 0.01,
                                                 minlen=2,
                                                 maxlen=50),
                      appearance = list(lhs=user_word, default='rhs'))

# 시각화 
plot(data_user, method = 'graph')

# support에 대해 상위 5개 추출  
most_word <- head(inspect(sort(data_user, decreasing = T)), 5) 
most_word <- most_word$rhs
most_word


# 축제명
num <- array(dim=c(1,247))
num[1,1] <- c(0)
str(num[1,1])

title_name <- array(dim=c(1,6))

for(x in 1:5){
  word <- most_word[x]
  word <- gsub("\\{","",word)  # {,} 를 삭제한다
  word <- gsub("\\}","",word)
  
  for(y in 1:246){
    data_name <- paste0(y,'_Extracted.txt')
    txt <- readLines(data_name)
    test <- grep(word,txt)  # 몇번째 몇번째 인덱스에서 word가 나오는지 알려준다 
    test <- length(test)
    num[1,y+1] <- test
    
    if(num[1,y] < num[1,y+1]){  # y번째 파일에서 word가 많이 나온다.
      final_num <- y+1
    }
  }
  
  final_num # final_num-1 번째 축제가 가장 많이 나왔다.
  title_file <- read.csv('MERGE_TITLE.csv', header=F)
  test <- title_file[final_num,]
  title<- test$V2
  title <- as.character(title)
  title_name[1,x+1] <- title 
}


for(x in 1:5){
  cat(title_name[1,x+1])
  cat('\n')
}
