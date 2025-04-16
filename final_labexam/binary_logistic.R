
# Read data from CSV file
data1 <- read.csv("binomial_logi.csv")

# Split the data: 70% training and 30% testing
set.seed(123)  # for reproducibility
total_rows <- nrow(data1)
train_size <- floor(0.7 * total_rows)
train_indices <- sample(1:total_rows, train_size)
train_data <- data1[train_indices, ]
test_data <- data1[-train_indices, ]

# Build logistic regression model
model <- glm(Obese ~ Height + Age, data = train_data, family = binomial)

# Show model summary
cat("Model Summary:\n")
print(summary(model))

# Predict probabilities on test data
test_prob <- predict(model, newdata = test_data, type = "response")
test_pred <- ifelse(test_prob > 0.5, 1, 0)
test_actual <- test_data$Obese

# Confusion matrix
confusion_matrix <- table(Predicted = test_pred, Actual = test_actual)
cat("\nConfusion Matrix:\n")
print(confusion_matrix)

# Accuracy
    accuracy <- sum(test_pred == test_actual) / length(test_actual)
    
    # Precision
    true_positive <- confusion_matrix["1", "1"]
    false_positive <- confusion_matrix["1", "0"]
    precision <- true_positive / (true_positive + false_positive)
    
    # Recall
    false_negative <- confusion_matrix["0", "1"]
    recall <- true_positive / (true_positive + false_negative)
    
    # F1 Score
    f1_score <- 2 * ((precision * recall) / (precision + recall))

# Print metrics
cat("\nAccuracy:", round(accuracy, 4), "\n")
cat("Precision:", round(precision, 4), "\n")
cat("Recall:", round(recall, 4), "\n")
cat("F1 Score:", round(f1_score, 4), "\n")



a_height <- as.integer(readline("\nEnter the height of the individual: "))
a_age <- as.integer(readline("Enter the age of the individual: "))
a <- data.frame(Height = a_height, Age = a_age)

# Make prediction
prob <- predict(model, a, type = "response")
prediction <- ifelse(prob > 0.5, 1, 0)
cat("The predicted obesity status is", prediction, "(1 = Obese, 0 = Not Obese)\n")

# Plot Height vs Obese
plot(data1$Height, data1$Obese, col = "red", main = "Binary Logistic Regression", 
     cex = 1.3, pch = 16, xlab = "Height in cm", ylab = "Obese (1 = Yes, 0 = No)")
