## GSEA trial
# install packages
BiocManager::install("clusterProfiler", update = FALSE)
BiocManager::install("msigdbr", update = FALSE)
BiocManager::install("org.Mm.eg.db", update = FALSE)

## library
library(clusterProfiler)

# Package that contains MSigDB gene sets in tidy format
library(msigdbr)

# mouse annotation package we'll use for gene identifier conversion
library(org.Mm.eg.db)

# We will need this so we can use the pipe: %>%
library(magrittr)

load("fit_matched2.tsv")

#projectPath <- dirname(rstudioapi::getSourceEditorContext()$path)
file.exists("fit.tsv")
dge_df <- readr::read_tsv("fit.tsv")
Mm_hallmark_df <- msigdbr(
  species = "Mus musculus", # Replace with species name relevant to your data
  category = "H")
head(Mm_hallmark_df)
keytypes(org.Mm.eg.db)
dge_heart= subset(dge_df, ...1 %in% heart$`Gene Script`)
# First let's create a mapped data frame we can join to the differential
# expression stats
dge_mapped_df <- data.frame(
  gene_symbols = mapIds(
    # Replace with annotation package for the organism relevant to your data
    org.Mm.eg.db,
    keys = dge_df$...1,
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
  dplyr::inner_join(dge_heart, by = c("Ensembltrans" = "...1"))
head(dge_mapped_df)
#The goal of GSEA is to detect situations where many genes in a gene set change in a coordinated way, even when individual changes are small in magnitude (Subramanian et al. 2005).

any(duplicated(dge_mapped_df$gene_symbols))
dup_gene_symbol <- dge_mapped_df %>%
  dplyr::filter(duplicated(gene_symbols)) %>%
  dplyr::pull(gene_symbols)

view(dup_gene_symbol)
#t test
t.test(dge_mapped_df)
filtered_dge_mapped_df <- dge_mapped_df %>%
  # Sort so that the highest absolute values of the t-statistic are at the top
  dplyr::arrange(dplyr::desc(abs(F))) %>%
  # Filter out the duplicated rows using `dplyr::distinct()`-- this will keep
  # the first row with the duplicated value thus keeping the row with the
  # highest absolute value of the t-statistic
  dplyr::distinct(gene_symbols, .keep_all = TRUE)

# Let's create a named vector ranked based on the t-statistic values
f_vector <- filtered_dge_mapped_df$F
names(f_vector) <- filtered_dge_mapped_df$gene_symbols

# We need to sort the t-statistic values in descending order here
f_vector <- sort(f_vector, decreasing = TRUE)

set.seed(2022)
gsea_results <- GSEA(
  geneList = f_vector, # Ordered ranked gene list
  minGSSize = 25, # Minimum gene set size
  maxGSSize = 500, # Maximum gene set set
  pvalueCutoff = 0.05, # p-value cutoff
  eps = 0, # Boundary for calculating the p-value
  seed = TRUE, # Set seed to make results reproducible
  pAdjustMethod = "BH", # Benjamini-Hochberg correction
  TERM2GENE = dplyr::select(
    Mm_hallmark_df,
    gene_symbol,
    gs_name
  )
)
