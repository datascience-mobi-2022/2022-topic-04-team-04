#PCA
pca = prcomp(t(data_ohneaffx), scale = TRUE) #pca,took the transposed dataset to get how the samples relate to each other not how the genes relate to each other
plot(pca$x[,1],pca$x[,2])   # x contains PC to draw in graph, here we used first two col of x to draw 2D graph

# cannot see clusters
pca_var = pca$sdev^2    #calculating variation
pca_var_per = round(pca_var/sum(pca_var)*100,1)   # variation into percentage
barplot(pca_var_per, main = "Scree plot", xlab ="Principal Component", ylab ="Percent Variation")


#using ggplot2
#pcastages = c("one-cell","one-cell","one-cell","two-cell","two-cell","four-cell","four-cell","four-cell","eight-cell","eight-cell","eight-cell","morula","blastocyst","blastocyst","blastocyst")
pcacolors = c("red","red","red","blue","blue","black","black","black","gray","gray","gray","green","purple","purple","purple")
library(ggplot2)
pca_data = data.frame(Sample = rownames(pca$x), X= pca$x[,1], Y = pca$x[,2])
ggplot(data=pca_data, aes(x=X, y=Y, label=Sample)) +
  xlab(paste("PC1 - ", pca_var_per[1], "%", sep="")) +
  ylab(paste("PC2 - ", pca_var_per[2], "%", sep="")) +
  theme_bw() +
  ggtitle("My PCA Graph") +
  geom_text(col=pcacolors)
  
## get the name of the top 10 measurements (genes) that contribute
##pc1
loading_scores <- pca$rotation[,1]
gene_scores <- abs(loading_scores) ## get the magnitudes
gene_score_ranked <- sort(gene_scores, decreasing=TRUE)
top_10_genes <- names(gene_score_ranked[1:10])

top_10_genes ## show the names of the top 10 genes
as.vector(top_10_genes)

pca$rotation[top_10_genes,1] ## show the scores (and +/- sign)

#matching top 10 genes with TRAs_mousedata
topten = oe_foureight_corr[which(rownames(oe_foureight_corr) %in% top_10_genes),]

#heartmatrix
#cheart = heart[,1]
heartoe = TRAs_mousedataset[which(rownames(TRAs_mousedataset) %in% heart[,1]),]
#heart
pcaheart = prcomp(t(heartoe), scale = TRUE)
pcaheart_var = pcaheart$sdev^2    #calculating variation
pcaheart_var_per = round(pcaheart_var/sum(pcaheart_var)*100,1)   # variation into percentage
barplot(pcaheart_var_per, main = "Scree plot", xlab ="Principal Component", ylab ="Percent Variation")
pcacolors = c("red","red","red","blue","blue","black","black","black","gray","gray","gray","green","purple","purple","purple")
pca_heart = data.frame(Sample = rownames(pcaheart$x), A= pcaheart$x[,1], B = pcaheart$x[,2])
ggplot(data=pcaheart, aes(x=A, y=B, label=Sample)) +
  xlab(paste("PC1 - ", pcaheart_var_per[1], "%", sep="")) +
  ylab(paste("PC2 - ", pcaheart_var_per[2], "%", sep="")) +
  theme_bw() +
  ggtitle("My PCA Graph") +
  geom_text(col=pcacolors)
