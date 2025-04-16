# Function to check if a word is a palindrome
is_palindrome <- function(x) {
  char_list <- strsplit(x, NULL)[[1]]  # Split string into characters
  reversed_char_list <- rev(char_list) # Reverse the characters
  reversed_string <- paste(reversed_char_list, collapse = "") # Join back to string
  return(x == reversed_string) # Check if original and reversed are the same
}

# Function to check if a number is in the Fibonacci sequence
is_fibonacci <- function(n) {
  if (n == 0) return(TRUE)  # 0 is a Fibonacci number
  a <- 0
  b <- 1
  while (b < n) {  # Keep generating Fibonacci numbers
    temp <- b
    b <- a + b
    a <- temp
  }
  return(n == b)  # Return TRUE if found in sequence
}

# Function to calculate factorial
factorial_calc <- function(n) {
  if (n == 0) return(1)  # Factorial of 0 is 1
  fact <- 1
  for (i in 1:n) {  # Multiply numbers from 1 to n
    fact <- fact * i
  }
  return(fact)
}

# Function to display menu and handle user choices
menu <- function() {
  repeat {
    cat("\nChoose an option:\n")
    cat("1. Merge Two Data Frames\n")
    cat("2. Find Palindromes in Data Frame\n")
    cat("3. Find Max/Min of Rows and Columns\n")
    cat("4. Factorial of Fibonacci Numbers\n")
    cat("5. Exit\n")
    
    choice <- as.integer(readline("Enter your choice: "))  # Get user input
    
    if (choice == 1) {  # Merge Data Frames
      df1 <- data.frame(ID = c(1, 2, 3, 4), Name = c("Alice", "Bob", "Charlie", "David"))
      df2 <- data.frame(ID = c(1, 2, 3, 4), Age = c(25, 30, 22, 45))
      merged_df <- merge(df1, df2, by = "ID")
      
      cat("\nMerged Data Frame:\n")
      print(merged_df)
      
    } else if (choice == 2) {  # Find Palindromes
      df <- data.frame(
        col_1 = c("m", "h", "r", "h", "m"),
        col_2 = c("a", "h", "c", "w", "l"),
        col_3 = c("m", "h", "b", "w", "l"),
        stringsAsFactors = FALSE
      )
      
      df$Palindrome <- NA  # Create a new column for palindrome results
      for (i in 1:nrow(df)) {  # Loop through each row
        row_str <- paste(df[i, ], collapse = "")  # Convert row to string
        df$Palindrome[i] <- is_palindrome(row_str)  # Check palindrome
      }
      
      write.csv(df, "palindrome_result.csv", row.names = FALSE)
      cat("\nResults saved to 'palindrome_result.csv'.\n")
      
    } else if (choice == 3) {  # Find Min/Max of Rows and Columns
      df <- data.frame(
        A = c(10, 20, 30, 40),
        B = c(5, 15, 25, 35),
        C = c(3, 13, 23, 33)
      )
      
      max_col <- numeric(ncol(df))  # Store max values for columns
      min_col <- numeric(ncol(df))  # Store min values for columns
      max_row <- numeric(nrow(df))  # Store max values for rows
      min_row <- numeric(nrow(df))  # Store min values for rows
      
      for (j in 1:ncol(df)) {  # Loop through each column
        max_col[j] <- max(df[, j])
        min_col[j] <- min(df[, j])
      }
      
      for (i in 1:nrow(df)) {  # Loop through each row
        max_row[i] <- max(df[i, ])
        min_row[i] <- min(df[i, ])
      }
      
      cat("\nMax of each column:\n")
      print(max_col)
      cat("\nMin of each column:\n")
      print(min_col)
      cat("\nMax of each row:\n")
      print(max_row)
      cat("\nMin of each row:\n")
      print(min_row)
      
    } else if (choice == 4) {  # Factorial of Fibonacci Numbers
      df <- data.frame(Number = c(5, 8, 12, 21, 34, 40, 55, 60))
      
      df$Is_Fibonacci <- FALSE  # Initialize new column
      df$Factorial <- NA  # Initialize factorial column
      
      for (i in 1:nrow(df)) {  # Loop through each number
        if (is_fibonacci(df$Number[i])) {
          df$Is_Fibonacci[i] <- TRUE
          df$Factorial[i] <- factorial_calc(df$Number[i])
        } else {
          df$Is_Fibonacci[i] <- FALSE
        }
      }
      
      cat("\nFibonacci Numbers and their Factorials:\n")
      print(df)
      
    } else if (choice == 5) {  # Exit program
      cat("\nExiting program.\n")
      break
      
    } else {  # Invalid input
      cat("\nInvalid choice. Please try again.\n")
    }
  }
}

# Run the menu function
menu()
