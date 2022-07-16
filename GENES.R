

TRAs = c(rownames(TRAs_mousedata))
TRA_gene_matrix = TRA_total[TRA_total[,1] %in% TRAs,]
View(TRA_gene_matrix)
####################
TRA_new = TRA_gene_matrix[!duplicated(TRA_gene_matrix$gene.symbol),]
View(TRA_new)
df = data.frame(TRA_new$ensembl.transcript, TRA_new$gene.symbol, TRA_new$max.tissue)
View(df)
heart_genes= df[df$TRA_new.max.tissue=="heart",]
View(heart_genes)
write.csv(heart_genes,"heart_genes.csv", row.names= FALSE)


