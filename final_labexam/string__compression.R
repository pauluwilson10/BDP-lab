string <- "hhbbbbcdd"
str <- ""
splitted <- tolower(strsplit(string, "")[[1]])
count <- 1

for(i in 2:length(splitted)){
  if(splitted[i-1]==splitted[i]){
    count<-count+1
  }
  else{
    str<-paste0(str,splitted[i-1],count)
    count<-1
  }
  
}


str<-paste0(str,splitted[length(splitted)],count)
cat(str)

