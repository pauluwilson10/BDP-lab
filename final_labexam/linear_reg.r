data1 <- read.csv("linear_reg.csv")

# Build a linear regression model
model <- lm(Weight ~ Height, data = data1)
summary(model)  # Show model summary

# Predictions on training data
predictions <- predict(model, data1)

# Calculate Mean Absolute Error (MAE)
mae <- mean(abs(data1$Weight - predictions))
cat("Mean Absolute Error (MAE):", mae, "\n")

# Calculate Root Mean Squared Error (RMSE)
rmse <- sqrt(mean((data1$Weight - predictions)^2))
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

# Take user input for prediction
a <- as.integer(readline("Enter the height of the individual: "))
a <- data.frame(Height = a)
print(a)

# Make prediction using the model
result <- predict(model, a)
cat("The predicted weight is", result, "kg\n")

# Plot the data and regression line
plot(data1$Height, data1$Weight, col = "red", main = "Linear Regression", 
     cex = 1.3, pch = 2, xlab = "Height in cm", ylab = "Weight in Kg")
abline(model, col = "blue")
