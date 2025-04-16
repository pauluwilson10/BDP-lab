  df <- data.frame(text = c("apple", "application", "pineapple"))
  
  replace_app <- function(x) {
    gsub("app", "ggh", x)
  }
  
  df$modified <- sapply(df$text, replace_app)
  
  print(df)
  