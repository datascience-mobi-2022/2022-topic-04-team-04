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
########### Treemap
install.packages("treemap")
library(treemap)

matched_tissuenames_df = as.data.frame(matched_tissuenames)
treemap.m = data.frame (matched_tissuenames_df$max.tissue, matched_tissuenames_df$Freq)
treemap(treemap.m,
        index= matched_tissuenames_df$max.tissue,
        vSize= matched_tissuenames_df$Freq,
        type="index"
)
######## AGAIN
treemap.tissue = c(matched_tissuenames_df$max.tissue)
treemap.freq = c(matched_tissuenames_df$Freq)
treemap.m = data.frame(treemap.tissue, treemap.freq) 
png(filename="tree_trasmouse.png",width=800, height=800)
treemap(treemap.m,
        index= "treemap.tissue",
        vSize= "treemap.freq",
        type="index",
        palette = "Pastel2",
        title =" Tissues with highest TRA frequency in mouse data"
)
dev.off()


View(DGE_foureight_oe_count)

treemap.tissue.oe = c(DGE_foureight_oe_count$DGE_foureight_oe...2.)
treemap.freq.oe = c(DGE_foureight_oe_count$Freq)
treemap.m.oe = data.frame(treemap.tissue.oe, treemap.freq.oe)
png(filename="tree_trasmouse_oe_foureight.png",width=800, height=800)
treemap(treemap.m.oe,index= "treemap.tissue.oe",
        vSize= "treemap.freq.oe",
        type="index",
        palette = "Pastel2",
        title ="Tissues with most overexpressed TRAs between fourth and eighth cell stages in mouse data"
) 
dev.off()



