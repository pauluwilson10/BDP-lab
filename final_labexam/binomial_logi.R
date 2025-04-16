# Read data from CSV file
data1 <- read.csv("binomial_logi.csv")

# Split the data: 70% training and 30% testing
set.seed(123)  # for reproducibility
total_rows <- nrow(data1)
train_size <- floor(0.7 * total_rows)
train_indices <- sample(1:total_rows, train_size)
train_data <- data1[train_indices, ]
test_data <- data1[-train_indices, ]

# Build a binary logistic regression model using training data
model <- glm(Obese ~ Height + Age, data = train_data, family = binomial)

# Show model summary
cat("Model Summary:\n")
print(summary(model))

# Predict probabilities on test data
test_prob <- predict(model, newdata = test_data, type = "response")

# Convert probabilities to 0 or 1 using threshold 0.5
test_pred <- ifelse(test_prob > 0.5, 1, 0)

# Actual values from test data
test_actual <- test_data$Obese

# Create confusion matrix
confusion_matrix <- table(Predicted = test_pred, Actual = test_actual)

# Print confusion matrix
cat("\nConfusion Matrix:\n")
print(confusion_matrix)

accuracy <- sum(test_pred == test_actual) /length(test_actual)

# Calculate precision
true_positive <- confusion_matrix["1", "1"]
false_positive <- confusion_matrix["1", "0"]
precision <- true_positive / (true_positive + false_positive)

# Print probability of correct prediction, accuracy, and precision
cat("\nProbability of predicting the correct class (Accuracy):", round(accuracy, 4), "\n")
cat("Precision:", round(precision, 4), "\n")

# Take user input for prediction
a_height <- as.integer(readline("\nEnter the height of the individual: "))
a_age <- as.integer(readline("Enter the age of the individual: "))
a <- data.frame(Height = a_height, Age = a_age)

# Make prediction using the model
prob <- predict(model, a, type = "response")
prediction <- ifelse(prob > 0.5, 1, 0)
cat("The predicted obesity status is", prediction, "(1 = Obese, 0 = Not Obese)\n")

# Plot the data (Height vs Obese)
plot(data1$Height, data1$Obese, col = "red", main = "Binary Logistic Regression", 
     cex = 1.3, pch = 16, xlab = "Height in cm", ylab = "Obese (1 = Yes, 0 = No)")
