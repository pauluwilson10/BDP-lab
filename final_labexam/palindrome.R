text <- readLines("C:/Users/Paulu wilson/Desktop/R-lab/l.txt")
splitted <- strsplit(text, " ")[[1]]
print(splitted)
palindromes <- c()

for (ch in splitted) {
  reversed <- paste(rev(strsplit(ch, NULL)[[1]]), collapse = "")
  if (tolower(ch) == tolower(reversed)) {
    palindromes <- c(palindromes, ch)
  }
}

# Print the palindromes
cat("Palindromes found:",palindromes)
