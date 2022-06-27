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
  dplyr::inner_join(dge_df, by = c("Ensembltrans" = "...1"))

dup_entrez_ids <- dge_mapped_df %>%
  dplyr::filter(duplicated(gene_symbols)) %>%
  dplyr::pull(gene_symbols)

dup_entrez_ids

filtered_dge_mapped_df <- dge_mapped_df %>%
  # Sort so that the highest absolute values of the t-statistic are at the top
  dplyr::arrange(dplyr::desc(abs(t))) %>%
  # Filter out the duplicated rows using `dplyr::distinct()`-- this will keep
  # the first row with the duplicated value thus keeping the row with the
  # highest absolute value of the t-statistic
  dplyr::distinct(gene_symbols, .keep_all = TRUE)