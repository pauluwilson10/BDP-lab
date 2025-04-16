capitalise<-function(string){
  splitted<-strsplit(string,"")[[1]]
  splitted[1]<-toupper(splitted[1])
  fina<-paste(splitted,collapse = "")
  return(fina)
  
}

df<-data.frame(text=c("fox","jumped","over","a"))
df$capitalised<-sapply(df$text,capitalise)
print(df)
