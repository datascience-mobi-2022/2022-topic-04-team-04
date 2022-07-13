# Topic 04 - team 04: The role of tissue-restricted antigens (TRAs) in the embryonic development
====================================================================================

**Participants:**
* Nina Droste, Aleksandra Dohren, Amena ElMaadawy, Mariam Hassan

**Supervisors:**
* Dr. Maria Dinkelacker, Ian Fichtner 

**Our Project:**

We used [GSE18290 mouse data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18290). The chips contained data from six different cell stages, ranging from 1cell stage to blastocyst cell stage, in three replicates. 

<p align="center">
  <img width="700" height="300" src="https://github.com/datascience-mobi-2022/2022-topic-04-team-04/blob/8bdce2e53b4b714cc99cee5cbfea0e31622c70e8/Topic4_cellstages.png">
  
  
  Fig 1. Different cell stages of dataset, Xie et al. (2010)
</p>

Our aim was to compare mouse TRA-gene tables, provided by Dr. Maria Dinkelacker, with TRAs present in our dataset.

We were interested in finding out, if:


<p align="center">
  <img width="460" height="300" src="https://github.com/datascience-mobi-2022/2022-topic-04-team-04/blob/1b6a4cc1fc4fcf1aaf52a296396986c63ca121b1/Topic4_Researchquestion.png">
  
  
  Fig 2. Researchquestion
</p>

Additionally, we focussed on three sub question, that could be answered during our project. 

> Is the greatest TRA expression found between the fourth and eighth cell stage?
> Is TRA expression in bovine comparable to TRA expression in mouse?
> Which is the earliest biological function expressed by those genes?

To answer the main research question and the three sub questions, we first performed quality control for the 18 mouse chips, and continued with merging the TRA tables and mouse data. In further steps, we performed different methods of dimension reduction, clustering, DGE; GSEA as well as additional bioinformatic methods.

To compare the embryo development of mouse and bovine, we performed quality control of the [GSE18290 bovine data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18290).


