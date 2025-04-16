# Load the dataset
data1 <- read.csv("multiple_reg.csv")

# Split the dataset into training (70%) and testing (30%)
set.seed(123)  # for reproducibility
total_rows <- nrow(data1)
train_size <- floor(0.7 * total_rows)
train_indices <- sample(1:total_rows, train_size)
train_data <- data1[train_indices, ]
test_data <- data1[-train_indices, ]

# Build a multiple linear regression model using training data
model <- lm(Weight ~ Height + Age, data = train_data)

# Show model summary (parameters)
cat("Model Summary:\n")
print(summary(model))

# Predict on test data
predicted_values <- predict(model, newdata = test_data)

# Actual weight values from test data
actual_values <- test_data$Weight

# Calculate Mean Squared Error (MSE)
squared_errors <- (predicted_values - actual_values)^2
mse <- mean(squared_errors)

# Calculate Root Mean Squared Error (RMSE)
rmse <- sqrt(mse)

# Print MSE and RMSE
cat("\nModel Evaluation:\n")
cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

# Take user input for prediction
a_height <- as.integer(readline("\nEnter the height of the individual: "))
a_age <- as.integer(readline("Enter the age of the individual: "))
a <- data.frame(Height = a_height, Age = a_age)
print(a)

# Make prediction using the trained model
result <- predict(model, newdata = a)
cat("The predicted weight is", result, "kg\n")

# Plot the training data (Height vs Weight)
plot(train_data$Height, train_data$Weight, col = "red", main = "Multiple Linear Regression",
     cex = 1.3, pch = 16, xlab = "Height in cm", ylab = "Weight in Kg")

# Add regression line (based on Height only for 2D plot visualization)

abline(model, col = "blue")
