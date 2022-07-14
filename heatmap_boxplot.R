#heatmap
library(pheatmap)
pheatmap(heart)
heatmap(heart[,1:5])
heart_matrix= as.matrix(heart[,-6])
heatmap(heart_matrix, col= heat.colors(3))
legend(x="right", legend=c("1", "0", "-1"),fill=heat.colors(3))
tras_with_tissues= rownames_to_column(TRA)
TRA_heart = TRAs_mousedata[which(rownames(TRAs_mousedataset) %in% rownames(heart)),]
as.data.frame(TRA_heart)
boxplot (TRA_heart,col = rainbow (18),cex.axis =0.5)
