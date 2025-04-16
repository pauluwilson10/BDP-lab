library(e1071)
library(ggplot2)

# Load dataset
data1 <- read.csv('svm.csv')

# Convert categorical variables to factors
data1$JobSatisfaction <- factor(data1$JobSatisfaction, levels = c('High', 'Medium', 'Low'))
data1$WorkLifeBalance <- factor(data1$WorkLifeBalance, levels = c('Good', 'Average', 'Poor', 'Excellent'))

# Convert 'Attrition' to binary
data1$Attrition <- ifelse(data1$Attrition == 'Yes', 1, 0)
print(data1)

# Split into training and testing sets (custom method)
set.seed(123)
total_rows <- nrow(data1)
train_size <- floor(0.7 * total_rows)
train_indices <- sample(1:total_rows, train_size)
train_data <- data1[train_indices, ]
test_data <- data1[-train_indices, ]

# Train SVM model
model <- svm(Attrition ~ Age + Salary, data = train_data, kernel = 'linear', type = 'C-classification')

# Predict on test data
predictions <- predict(model, newdata = test_data)

# Confusion matrix and accuracy
conf_mat <- table(Predicted = predictions, Actual = test_data$Attrition)
accuracy <- sum(test_pred == test_actual) / length(test_actual)
cat("Accuracy on test set:", round(accuracy * 100, 2), "%\n")

# Take user input for new prediction
age_input <- as.numeric(readline(prompt = 'Enter the age: '))
salary_input <- as.numeric(readline(prompt = 'Enter the salary: '))
test_point <- data.frame(Age = age_input, Salary = salary_input)
pred <- predict(model, newdata = test_point)
print(pred)
# Print prediction
if (pred == 1) {
  cat("Predicted Attrition: YES (Employee is likely to leave)\n")
} else {
  cat("Predicted Attrition: NO (Employee is likely to stay)\n")
}


# Visualize decision boundary
plot(data1$Age, data1$Salary, col = ifelse(data1$Attrition == 1, "red", "blue"),
     main = "SVM Decision Boundary", xlab = "Age", ylab = "Salary", pch = 16, cex = 1.3)

