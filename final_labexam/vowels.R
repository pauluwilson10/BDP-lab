count_vowels<-function(string){
  vowels<-c('a','e','i','o','u')
  splitted<-strsplit(string,"")[[1]]
  count<-0
  for(char in tolower(splitted)){
    if(char %in% vowels){
      count<-count+1
    }   
  }
  return  (count)
}


num<-as.integer(readline("enter the num"))
for(i in 1:num){
  str<-readline("Enter teh string")
  df<-rbind(df,data.frame(text=str))
}

df$vowel_count<-sapply(df$text,count_vowels)
print(df)