
n <- as.integer(readline("Enter the number of points: "))
x <- numeric(n)
y <- numeric(n)

for (i in 1:n) {
  x[i] <- as.integer(readline(sprintf("Enter the X of point %d: ", i)))
  y[i] <- as.integer(readline(sprintf("Enter the Y of point %d: ", i)))
}

df <- data.frame(Point = LETTERS[1:n], X = x, Y = y)
cat("Data\n")
print(df)
cat("\n")

set.seed(42)
initial_ci <- c(2, 3) 
initial_c <- df[initial_ci, c("X", "Y")]
first_c <- initial_c

cat(sprintf("Centroid 1: Point %s (%.2f, %.2f)\n", df$Point[initial_ci[1]], initial_c[1, "X"], initial_c[1, "Y"]))
cat(sprintf("Centroid 2: Point %s (%.2f, %.2f)\n", df$Point[initial_ci[2]], initial_c[2, "X"], initial_c[2, "Y"]))

dist <- function(x1, y1, x2, y2) {
  sqrt((x2 - x1)^2 + (y2 - y1)^2)
}

assign_to_cluster <- function(points, centroids) {
  clusters <- list(cluster1 = character(0), cluster2 = character(0))
  for (i in 1:nrow(points)) {
    distances <- sapply(1:nrow(centroids), function(j) {
      dist(points$X[i], points$Y[i], centroids$X[j], centroids$Y[j])
    })
    assigned_centroid <- which.min(distances)  
    if (assigned_centroid == 1) {
      clusters$cluster1 <- c(clusters$cluster1, points$Point[i])
    } else {
      clusters$cluster2 <- c(clusters$cluster2, points$Point[i])
    }
  }
  return(clusters)
}

update_centroids <- function(points, clusters) {
  new_centroids <- data.frame(X = numeric(2), Y = numeric(2))
  for (i in 1:2) {
    cluster_points <- points[points$Point %in% clusters[[paste0("cluster", i)]], ]
    new_centroids[i, ] <- colMeans(cluster_points[, c("X", "Y")], na.rm = TRUE)
  }
  return(new_centroids)
}

num_iterations <- 5
for (i in 1:num_iterations) {
  clusters <- assign_to_cluster(df, first_c)
  cat(sprintf("\nIteration %d\n", i))
  cat("Cluster 1: ", paste(clusters$cluster1, collapse = ", "), "\n")
  cat("Cluster 2: ", paste(clusters$cluster2, collapse = ", "), "\n")
  
  new_centroids <- update_centroids(df, clusters)
  cat(sprintf("Updated Centroids: (%.2f, %.2f) and (%.2f, %.2f)\n", new_centroids[1, "X"], new_centroids[1, "Y"], new_centroids[2, "X"], new_centroids[2, "Y"]))
  
  if (all(abs(new_centroids$X - first_c$X) < 1e-4) && all(abs(new_centroids$Y - first_c$Y) < 1e-4)) {
    cat("Centroids have converged.\n")
    break
  }
  first_c <- new_centroids
}
final_clusters <- assign_to_cluster(df, first_c)
plot(df$X, df$Y, col = ifelse(df$Point %in% final_clusters$cluster1, "red", "blue"),
     pch = 16, xlab = "X", ylab = "Y", main = "K-means Clustering")
points(first_c$X, first_c$Y, col = "black", pch = 8, cex = 2)
text(df$X, df$Y, labels = df$Point, pos = 4, cex = 0.8, col = "black")
text(first_c$X, first_c$Y, labels = paste("Centroid", 1:2), pos = 4, col = "black")