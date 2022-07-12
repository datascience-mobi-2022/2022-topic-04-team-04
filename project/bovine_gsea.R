##### gsea bovine
BiocManager::install("org.Bt.eg.db", update = FALSE)
## library
library(clusterProfiler)

# Package that contains MSigDB gene sets in tidy format
library(msigdbr)

# mouse annotation package we'll use for gene identifier conversion
library(org.Bt.eg.db)

# We will need this so we can use the pipe: %>%
library(magrittr)
projectPath <- dirname(rstudioapi::getSourceEditorContext()$path)
Bt_hallmark_df <- msigdbr(
  species = "Bos taurus", # Replace with species name relevant to your data
  category = "H")
head(Bt_hallmark_df)
keytypes(org.Bt.eg.db)
bovine_transcript = rownames(dge_bovine)
dge_bovine = cbind(bovine_transcript,dge_bovine)

# First let's create a mapped data frame we can join to the differential
# expression stats
dge_bovinemapped_df <- data.frame(
  gene_symbols = mapIds(
    # Replace with annotation package for the organism relevant to your data
    org.Bt.eg.db,
    keys =rownames(dge_bovine),
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
  tibble::rownames_to_column("Ensembltransbovine") %>%
  # Now let's join the rest of the expression data
  dplyr::inner_join(dge_bovine, by = c("Ensembltransbovine" = "bovine_transcript"))
head(dge_bovinemapped_df)
#The goal of GSEA is to detect situations where many genes in a gene set change in a coordinated way, even when individual changes are small in magnitude (Subramanian et al. 2005).

any(duplicated(dge_bovinemapped_df$gene_symbols))
bovinedup_gene_symbol <- dge_bovinemapped_df %>%
  dplyr::filter(duplicated(gene_symbols)) %>%
  dplyr::pull(gene_symbols)

View(bovinedup_gene_symbol)
#t test

filtered_dge_bovinemapped_df <- dge_bovinemapped_df %>%
  # Sort so that the highest absolute values of the t-statistic are at the top
  dplyr::arrange(dplyr::desc(abs(dge_bovinemapped_df[,3]))) %>%
  # Filter out the duplicated rows using `dplyr::distinct()`-- this will keep
  # the first row with the duplicated value thus keeping the row with the
  # highest absolute value of the t-statistic
  dplyr::distinct(gene_symbols, .keep_all = TRUE)

# Let's create a named vector ranked based on the t-statistic values
Fcbovine_vector <- filtered_dge_bovinemapped_df[,3]
names(Fcbovine_vector) <- filtered_dge_bovinemapped_df$gene_symbols

# We need to sort the t-statistic values in descending order here
Fcbovine_vector <- sort(Fcbovine_vector, decreasing = TRUE)

set.seed(2022)
gsea_bovineresults <- GSEA(
  geneList = Fcbovine_vector, # Ordered ranked gene list
  minGSSize = 25, # Minimum gene set size
  maxGSSize = 500, # Maximum gene set set,
  pvalueCutoff = 0.5,# p-value cutoff
  eps = 0, # Boundary for calculating the p-value
  seed = TRUE, # Set seed to make results reproducible
  pAdjustMethod = "BH", # Benjamini-Hochberg correction
  TERM2GENE = dplyr::select(
    Bt_hallmark_df,
    gs_name,
    gene_symbol,
  )
)

head(gsea_bovineresults@result)
saveRDS(gsea_bovineresults, file="Gsea_bovine.rds")
saveRDS(gsea_bovineresults@geneSets, file="GSEA_bovine_genesets.rds")
View(gsea_bovineresults)
View(gsea_bovineresults@result)
GSEA_bovine_tableresults = gsea_bovineresults[,11]
View(GSEA_bovine_tableresults)
saveRDS(gsea_bovineresults@result, file="GSEA_bovine_resulttable.rds")
