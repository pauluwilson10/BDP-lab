is_palindrome <- function(x) {
  char_list <- strsplit(x, NULL)[[1]]
  reversed_char_list <- rev(char_list)
  reversed_string <- paste(reversed_char_list, collapse = "")
  return(x == reversed_string)
}
fibonacci <- function(n) {
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  for(i in 3:n) {
    fib[i] <- fib[i-1] + fib[i-2]
  }
  return(fib)
}

factorial <- function(n) {
  if (n == 0 || n == 1) return(1)
  return(n * factorial(n - 1))
}

menu <- function() {
  repeat {
    cat("\nChoose an option from the menu:\n")
    cat("1. Merge Two Data Frames\n")
    cat("2. Find Palindromes in Data Frame\n")
    cat("3. Find Max/Min of Rows and Columns\n")
    cat("4. Factorial of Fibonacci Numbers\n")
    cat("5. Exit\n")
    
    choice <- as.integer(readline("Enter your choice: "))
    
    if (choice == 1) {
      # Create two data frames with a common column 'ID'
      df1 <- data.frame(ID = c(1, 2, 3, 4), Name = c("Alice", "Bob", "Charlie", "David"))
      df2 <- data.frame(ID = c(1, 2, 3, 4), Age = c(25, 30, 22, 45))
      
      merged_df <- merge(df1, df2, by = "ID")
      
      cat("Merged Data Frame:\n")
      print(merged_df)
      
    } else if (choice == 2) {
      df <- data.frame(
        col_1 = c("m", "h", "r", "h", "m"),
        col_2 = c("a", "h", "c", "w", "l"),
        col_3 = c("m", "h", "b", "w", "l"),
        stringsAsFactors = FALSE
      )
      
      df$Palindrome <- apply(df, 1, function(row) {
        row_str <- paste(row, collapse = "")
        return(is_palindrome(row_str))
      })
      write.csv(df, "palindrome_result.csv", row.names = FALSE)
      cat("Results have been written to 'palindrome_result.csv'.\n")
      
    } else if (choice == 3) {
      df <- data.frame(
        A = c(10, 20, 30, 40),
        B = c(5, 15, 25, 35),
        C = c(3, 13, 23, 33)
      )
      
      
      max_col <- apply(df, 2, max)
      min_col <- apply(df, 2, min)
      
      
      max_row <- apply(df, 1, max)
      min_row <- apply(df, 1, min)
      
      cat("Max of each column:\n")
      print(max_col)
      cat("Min of each column:\n")
      print(min_col)
      cat("Max of each row:\n")
      print(max_row)
      cat("Min of each row:\n")
      print(min_row)
      
    } else if (choice == 4) {
      # Factorial of Fibonacci numbers
      n <- as.integer(readline("Enter the number of Fibonacci terms: "))
      
      # Calculate Fibonacci numbers
      fib_nums <- fibonacci(n)
      
      # Calculate factorials of Fibonacci numbers
      factorials <- sapply(fib_nums, factorial)
      
      # Create a data frame to store Fibonacci numbers and their factorials
      fib_df <- data.frame(Fibonacci = fib_nums, Factorial = factorials)
      
      cat("Fibonacci numbers and their Factorials:\n")
      print(fib_df)
      
    } else if (choice == 5) {
      cat("Exiting program.\n")
      break
    } else {
      cat("Invalid choice. Please try again.\n")
    }
  }
}
menu()
