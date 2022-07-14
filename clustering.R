avg_sil <- function(k) {
  km.res <- kmeans(data_ohneaffx, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(data_ohneaffx))
  mean(ss[, 3])
}
k.values <- 2
avg_sil_values <- map_dbl(k.values, avg_sil)
plot(k.values, avg_sil_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Average Silhouettes")

distance_matrix= dist(t(data_ohneaffx), method = "euclidean")
cluster= hclust(distance_matrix, method="average")
plot(cluster)
