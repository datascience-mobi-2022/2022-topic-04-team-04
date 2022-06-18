#PCA
pca = prcomp(t(data_ohneaffx), scale = TRUE) #pca,took the transposed dataset to get how the samples relate to each other not how the genes relate to each other
plot(pca$x[,1],pca$x[,2])   # x contains PC to draw in graph, here we used first two col of x to draw 2D graph
# cannot see clusters
pca_var = pca$sdev^2    #calculating variation
pca_var_per = round(pca_var/sum(pca_var)*100,1)   # variation into percentage
barplot(pca_var_per, main = "Scree plot", xlab ="Principal Component", ylab ="Percent Variation")


#using ggplot2
library(ggplot2)
pca_data = data.frame(Sample = rownames(pca$x), X= pca$x[,1], Y = pca$x[,2])
ggplot(data=pca_data, aes(x=X, y=Y, label=Sample)) +
  geom_text() +
  xlab(paste("PC1 - ", pca_var_per[1], "%", sep="")) +
  ylab(paste("PC2 - ", pca_var_per[2], "%", sep="")) +
  theme_bw() +
  ggtitle("My PCA Graph")

## get the name of the top 10 measurements (genes) that contribute
##pc1
loading_scores <- pca$rotation[,1]
gene_scores <- abs(loading_scores) ## get the magnitudes
gene_score_ranked <- sort(gene_scores, decreasing=TRUE)
top_10_genes <- names(gene_score_ranked[1:10])

top_10_genes ## show the names of the top 10 genes

pca$rotation[top_10_genes,1] ## show the scores (and +/- sign)
