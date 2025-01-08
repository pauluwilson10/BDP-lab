# Load the data
data <- read.csv("/home/ds-da-15/exp2.csv")


data$Yes <- as.numeric(as.character(data$Yes))
data$No <- as.numeric(as.character(data$No))

# Print the data
print(data)

# Perform basic statistical calculations
cat("Variance for yes = ", var(data$Yes), "\n")
cat("Variance for no = ", var(data$No), "\n")
cat("Covariance between yes and no = ", cov(data$Yes, data$No), "\n")
cat("Correlation between yes and no = ", cor(data$Yes, data$No), "\n")

contingency_table <- table(data$Yes, data$No)


chi <- chisq.test(contingency_table)


print(chi)


boxplot(data$Yes, data$No, names = c("Yes", "No"), main = "Boxplot of Yes and No", na.rm = TRUE)