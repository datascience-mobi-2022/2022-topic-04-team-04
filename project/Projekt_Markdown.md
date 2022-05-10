Basic Info: microarray chip: \[HG-U133\_Plus\_2\] Affymetrix Human
Genome U133 Plus 2.0 Array Database:GEO dataset:GSE18290

1.  Install coressponding brainarray chip packages

<!-- -->

    BiocManager::install("hgu133plus2")

    ## Bioconductor version 3.15 (BiocManager 1.30.17), R 4.2.0 (2022-04-22)

    ## Installing package(s) 'hgu133plus2'

    ## Warning: package 'hgu133plus2' is not available for Bioconductor version '3.15'
    ## 
    ## A version of this package for your version of R might be available elsewhere,
    ## see the ideas at
    ## https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages

    ## Old packages: 'cli', 'dplyr', 'haven', 'RSQLite', 'tibble'

    install.packages("hgu133plus2hsenstcdf_24.0.0.zip.gz", repos = NULL, type = "source")

    ## Warning in install.packages("hgu133plus2hsenstcdf_24.0.0.zip.gz", repos =
    ## NULL, : Installation des Pakets 'hgu133plus2hsenstcdf_24.0.0.zip.gz' hatte Exit-
    ## Status ungleich 0

    install.packages("hgu133plus2hsenstprobe_24.0.0.zip.gz", repos = NULL, type = "source")

    ## Warning in install.packages("hgu133plus2hsenstprobe_24.0.0.zip.gz", repos =
    ## NULL, : Installation des Pakets 'hgu133plus2hsenstprobe_24.0.0.zip.gz' hatte
    ## Exit-Status ungleich 0

    #import all libraries
    library("Rcpp")
    library("tidyverse")

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.6     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ## ✓ tidyr   1.2.0     ✓ stringr 1.4.0
    ## ✓ readr   2.1.2     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    library("affy")

    ## Lade nötiges Paket: BiocGenerics

    ## 
    ## Attache Paket: 'BiocGenerics'

    ## Die folgenden Objekte sind maskiert von 'package:dplyr':
    ## 
    ##     combine, intersect, setdiff, union

    ## Die folgenden Objekte sind maskiert von 'package:stats':
    ## 
    ##     IQR, mad, sd, var, xtabs

    ## Die folgenden Objekte sind maskiert von 'package:base':
    ## 
    ##     anyDuplicated, append, as.data.frame, basename, cbind, colnames,
    ##     dirname, do.call, duplicated, eval, evalq, Filter, Find, get, grep,
    ##     grepl, intersect, is.unsorted, lapply, Map, mapply, match, mget,
    ##     order, paste, pmax, pmax.int, pmin, pmin.int, Position, rank,
    ##     rbind, Reduce, rownames, sapply, setdiff, sort, table, tapply,
    ##     union, unique, unsplit, which.max, which.min

    ## Lade nötiges Paket: Biobase

    ## Welcome to Bioconductor
    ## 
    ##     Vignettes contain introductory material; view with
    ##     'browseVignettes()'. To cite Bioconductor, see
    ##     'citation("Biobase")', and for packages 'citation("pkgname")'.

    library("vsn")
    library("ggplot2")
    library("readr")
    library("AnnotationDbi")

    ## Lade nötiges Paket: stats4

    ## Lade nötiges Paket: IRanges

    ## Lade nötiges Paket: S4Vectors

    ## 
    ## Attache Paket: 'S4Vectors'

    ## Die folgenden Objekte sind maskiert von 'package:dplyr':
    ## 
    ##     first, rename

    ## Das folgende Objekt ist maskiert 'package:tidyr':
    ## 
    ##     expand

    ## Die folgenden Objekte sind maskiert von 'package:base':
    ## 
    ##     expand.grid, I, unname

    ## 
    ## Attache Paket: 'IRanges'

    ## Die folgenden Objekte sind maskiert von 'package:dplyr':
    ## 
    ##     collapse, desc, slice

    ## Das folgende Objekt ist maskiert 'package:purrr':
    ## 
    ##     reduce

    ## 
    ## Attache Paket: 'AnnotationDbi'

    ## Das folgende Objekt ist maskiert 'package:dplyr':
    ## 
    ##     select

    library("hgu133plus2hsenstcdf")

    ## 

    library("hgu133plus2hsenstprobe")
    library("hexbin")

Next Step: Reading in the microarray Data

    setwd("/Users/mariamhassan/Library/CloudStorage/OneDrive-bwedu/4.Fachsemester/2022-topic-04-team-04/project/rawdata/GSE18290_RAW (1)")
    data.mouse=ReadAffy()
    data.mouse@cdfName="HGU133Plus2_Hs_ENST"
    setwd("/Users/mariamhassan/Library/CloudStorage/OneDrive-bwedu/4.Fachsemester/2022-topic-04-team-04/project/RFiles")
    save.image("/Users/mariamhassan/Library/CloudStorage/OneDrive-bwedu/4.Fachsemester/2022-topic-04-team-04/project/RFiles/image.rda")

1.Quality Control: Microarray chips images

    image(data.mouse, col=rainbow (100, start=0,end = 0.75)[100:1])

![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-1.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-2.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-3.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-4.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-5.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-6.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-7.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-8.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-9.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-10.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-11.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-12.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-13.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-14.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-15.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-16.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-17.png)![](Projekt_Markdown_files/figure-markdown_strict/unnamed-chunk-4-18.png)
