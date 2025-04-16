# Load required library
library(ggplot2)

# Load Data
data <- iris[, 1:4]  # Use only the numeric features
labels <- iris$Species  # Actual species labels

# Ask user for number of clusters
cat("Enter the number of clusters (k): ")
k <- as.integer(readline())

# Apply K-Means using built-in function
set.seed(123)  # For reproducibility
result <- kmeans(data, centers = k)

# Print cluster centers
cat("\nCluster Centroids:\n")
print(result$centers)

# Print cluster assignments
cat("\nCluster Assignments:\n")
print(result$cluster)

# Print actual labels for comparison
cat("\nActual Species Labels:\n")
print(labels)

# Plot the results using Sepal.Length and Sepal.Width
plot(data$Sepal.Length, data$Sepal.Width, col = result$cluster, pch = 16,
   main = "K-Means Clustering (Iris Dataset)", 
   xlab = "Sepal Length", ylab = "Sepal Width")
points(result$centers[, c("Sepal.Length", "Sepal.Width")], col = 1:k, pch = 8, cex = 2)
legend("topright", legend = levels(labels), col = 1:3, pch = 8)


# Load required library
library(ggplot2)

# Load Data
data <- data.frame(
  X = c(1.0, 1.5, 3.0, 5.0, 3.5, 4.5, 3.5),
  Y = c(1.0, 2.0, 4.0, 7.0, 5.0, 5.0, 4.5)
)

# Ask user for number of clusters
cat("Enter the number of clusters (k): ")
k <- as.integer(readline())

# Apply K-Means using built-in function
set.seed(123)  # For reproducibility
result <- kmeans(data, centers = k)

# Print cluster centers
cat("\nCluster Centroids:\n")
print(result$centers)

# Print cluster assignments
cat("\nCluster Assignments:\n")
print(result$cluster)

# Plot the results
plot(data$X, data$Y, col = result$cluster, pch = 16, 
     main = "K-Means Clustering (Built-in)", 
     xlab = "X", ylab = "Y")
points(result$centers[, 1], result$centers[, 2], col = 1:k, pch = 8, cex = 2)