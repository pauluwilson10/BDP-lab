
library(nnet)
# Read data
data1 <- read.csv("multinomial_logi.csv")

# Set seed and split data (70% train, 30% test)
set.seed(123)
total_rows <- nrow(data1)
train_size <- floor(0.7 * total_rows)
train_indices <- sample(1:total_rows, train_size)
train_data <- data1[train_indices, ]
test_data <- data1[-train_indices, ]

# Build multinomial logistic regression model using training data
model <- multinom(Purchase_Category ~ Age + Income, data = train_data)

# Show model summary
cat("Model Summary:\n")
print(summary(model))

# Predict on test data
test_pred <- predict(model, newdata = test_data)
test_actual <- test_data$Purchase_Category

# Confusion matrix
conf_matrix <- table(Predicted = test_pred, Actual = test_actual)
cat("\nConfusion Matrix:\n")
print(conf_matrix)

# Accuracy
accuracy <- sum(test_pred == test_actual) / length(test_actual)

cat("\nAccuracy:", round(accuracy, 4), "\n")

# Precision and Recall per class
classes <- levels(as.factor(test_actual))
cat("\nPrecision and Recall per class:\n")
for (class in classes) {
  TP <- conf_matrix[class, class]
  FP <- sum(conf_matrix[class, ]) - TP
  FN <- sum(conf_matrix[, class]) - TP
  precision <- TP / (TP + FP)
  recall <- TP / (TP + FN)
  cat("\nClass:", class, "\n")
  cat("  Precision:", round(precision, 4), "\n")
  cat("  Recall:", round(recall, 4), "\n")
}

# Take user input for prediction
a_age <- as.integer(readline("Enter the age of the individual: "))
a_income <- as.integer(readline("Enter the income of the individual: "))
a <- data.frame(Age = a_age, Income = a_income)

# Predict for user input
prediction <- predict(model, a)
cat("The predicted purchase category is", prediction, "\n")
