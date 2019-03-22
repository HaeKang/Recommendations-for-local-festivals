library(wordcloud)
library(RColorBrewer)
library(wordcloud2)
library(KoNLP)
library(stringr)
library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
library(base64enc)
library(webshot)
useSejongDic()

cnt = 51

for(i in 45:cnt){
  i <- 46
  # 파일 불러오기 & wordcount 만들기 
  Filename <- paste0(i,'_SecondFreq.csv')
  data <- read.csv(Filename, stringsAsFactors = F, header = T)
  
  data <- as.data.frame(data)
  
  wordcount <- table(data)
  wordcount <- sort(wordcount, decreasing = T)
  
  wordcount
  
  # 워드클라우드 
  img <- wordcloud2(wordcount,  size=0.5, color='random-light') 
  
  img
  
  # 저장과정 
  html_Name <- paste0(i,'_html.html')
  saveWidget(img, html_Name, selfcontained = F)
  
  wordcloud_Filename <- paste0(i,'_wordcloud.png')
  webshot(html_Name, wordcloud_Filename,
          delay=1)  
}  
