# Load necessary libraries
library(ggplot2)
library(lattice)

# Load data from CSV file
cat("Loading data from CSV file...\n")
data <- read.csv("data.csv")
cat("Data loaded successfully.\n")

# Ensure numerical columns are correctly formatted
cat("Checking data structure...\n")
str(data)

# Simple Linear Regression using R&D Spend as independent variable and Profit as dependent variable
cat("Fitting simple linear regression model...\n")
simple_model <- lm(Profit ~ R.D.Spend, data = data)
cat("Simple model summary:\n")
print(summary(simple_model))

# Multiple Linear Regression using all other columns as independent variables
cat("Fitting multiple linear regression model...\n")
multiple_model <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend, data = data)
cat("Multiple model summary:\n")
print(summary(multiple_model))

# Model Performance Evaluation
cat("Calculating RMSE for models...\n")
simple_rmse <- sqrt(mean(simple_model$residuals^2))
multiple_rmse <- sqrt(mean(multiple_model$residuals^2))

cat("Simple Regression RMSE:", simple_rmse, "\n")
cat("Multiple Regression RMSE:", multiple_rmse, "\n")

# Visualization using ggplot2
cat("Plotting simple linear regression results...\n")
p1 <- ggplot(data, aes(x = R.D.Spend, y = Profit)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', col = 'red') +
  ggtitle('Simple Linear Regression: Profit ~ R&D Spend')
print(p1)

# Visualization for multiple linear regression using ggplot2
cat("Plotting multiple linear regression results...\n")
p2 <- ggplot(data, aes(x = R.D.Spend, y = Profit)) +
  geom_point(aes(color = Administration, size = Marketing.Spend)) +
  geom_smooth(method = 'lm', col = 'red') +
  ggtitle('Multiple Linear Regression: Profit vs R&D Spend, Administration, and Marketing Spend')
print(p2)

cat("Script execution complete.\n")