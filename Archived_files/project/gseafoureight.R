#######DGE und GSEA nur 4-8
library(limma)
designfe= model.matrix(~0+factor(c(1,1,1,2,2,2)))
colnames(designfe)= c("four", "eight")
fit_matchedfe= lmFit(TRAs_mousedataset[,6:11], designfe)
contrast.matrixfe= makeContrasts(eight-four,levels = designfe)
fit_matchedfe2= contrasts.fit(fit_matchedfe, contrast.matrixfe)
fit_matchedfe2= eBayes(fit_matchedfe2)
topTable(fit_matchedfe2, coef=1)
#linear model is done
dge_dffe=topTable(fit_matchedfe2, coef=1, number=nrow(fit_matchedfe2))
resultsfe= decideTests(fit_matchedfe2)
View(resultsfe)

#####GSEA
library(clusterProfiler)

# Package that contains MSigDB gene sets in tidy format
library(msigdbr)

# mouse annotation package we'll use for gene identifier conversion
library(org.Mm.eg.db)

# We will need this so we can use the pipe: %>%
library(magrittr)

transcriptsfe = rownames(dge_dffe)
dge_dffe= cbind(transcriptsfe,dge_dffe)
dge_femapped_df <- data.frame(
  gene_symbols = mapIds(
    # Replace with annotation package for the organism relevant to your data
    org.Mm.eg.db,
    keys =rownames(dge_dffe),
    # Replace with the type of gene identifiers in your data
    keytype = "ENSEMBLTRANS",
    # Replace with the type of gene identifiers you would like to map to
    column = "SYMBOL",
    # This will keep only the first mapped value for each Ensembl ID
    multiVals = "first"
  )
)%>%
  # If an Ensembl gene identifier doesn't map to a Entrez gene identifier,
  # drop that from the data frame
  dplyr::filter(!is.na(gene_symbols)) %>%
  # Make an `Ensembl` column to store the rownames
  tibble::rownames_to_column("Ensembltrans") %>%
  # Now let's join the rest of the expression data
  dplyr::inner_join(dge_dffe, by = c("Ensembltrans" = "transcriptsfe"))
head(dge_femapped_df)
#The goal of GSEA is to detect situations where many genes in a gene set change in a coordinated way, even when individual changes are small in magnitude (Subramanian et al. 2005).

any(duplicated(dge_femapped_df$gene_symbols))
dup_gene_symbol <- dge_femapped_df %>%
  dplyr::filter(duplicated(gene_symbols)) %>%
  dplyr::pull(gene_symbols)

View(dup_gene_symbol)
#t test

filtered_dge_femapped_df <- dge_femapped_df %>%
  # Sort so that the highest absolute values of the t-statistic are at the top
  dplyr::arrange(dplyr::desc(abs(dge_femapped_df[,4]))) %>%
  # Filter out the duplicated rows using `dplyr::distinct()`-- this will keep
  # the first row with the duplicated value thus keeping the row with the
  # highest absolute value of the t-statistic
  dplyr::distinct(gene_symbols, .keep_all = TRUE)

# Let's create a named vector ranked based on the t-statistic values
Fcfe_vector <- filtered_dge_femapped_df[,4]
names(Fcfe_vector) <- filtered_dge_femapped_df$gene_symbols

# We need to sort the t-statistic values in descending order here
Fcfe_vector <- sort(Fcfe_vector, decreasing = TRUE)

set.seed(2022)
gsea_feresults <- GSEA(
  geneList = Fcfe_vector, # Ordered ranked gene list
  minGSSize = 25, # Minimum gene set size
  maxGSSize = 500, # Maximum gene set set,
  pvalueCutoff = 0.05,# p-value cutoff
  eps = 0, # Boundary for calculating the p-value
  seed = TRUE, # Set seed to make results reproducible
  pAdjustMethod = "BH", # Benjamini-Hochberg correction
  TERM2GENE = dplyr::select(
    Mm_hallmark_df,
    gs_name,
    gene_symbol,
  )
)

head(gsea_feresults@result)
