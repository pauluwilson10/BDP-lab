df<-data.frame(names=c("messi","ney","rono"),marks=c(NA,34,56))
for(i in 1:nrow(df)){
  if(is.na(df$marks[i])){
    meaned<-mean(df$marks,na.rm=TRUE)
    df$marks[i]<-meaned
  }
}