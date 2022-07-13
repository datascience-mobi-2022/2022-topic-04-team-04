# Topic 04 - team 04: The role of tissue-restricted antigens (TRAs) in the embryonic development
====================================================================================

**Participants:**
* Nina Droste, Aleksandra Dohren, Amena ElMaadawy, Mariam Hassan

**Supervisors:**
* Dr. Maria Dinkelacker, Ian Fichtner 

**Our Project:**

We used [GSE18290 mouse data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18290). The chips contained data from six different cell stages, ranging from 1cell stage to blastocyst cell stage, in three replicates. 

<p align="center">
  <img width="700" height="250" src="https://github.com/datascience-mobi-2022/2022-topic-04-team-04/blob/8bdce2e53b4b714cc99cee5cbfea0e31622c70e8/Topic4_cellstages.png">
  
</p>
Figure 1 Cell stages in mouse dataset (Xie et al., 2010)



Our aim was to compare mouse TRA-gene tables, provided by Dr. Maria Dinkelacker, with TRAs present in our dataset.

We were interested in finding out, if:


<p align="center">
  <img width="460" height="300" src="https://github.com/datascience-mobi-2022/2022-topic-04-team-04/blob/1b6a4cc1fc4fcf1aaf52a296396986c63ca121b1/Topic4_Researchquestion.png">
</p>
Figure 2 Research question


Additionally, we focussed on three sub question, that could be answered during our project: 

> Is the greatest TRA expression found between the fourth and eighth cell stage


We compared TRA expression of different cell stages and found the change between 4.th and 8.th cell stage to be the greatest.

> Is TRA expression in bovine comparable to TRA expression in mouse?


We added bovine data to compare important pathways in mouse and bovine embroys


> Which is the earliest biological function expressed by those genes?




To answer the main research question and the three sub questions, we first performed quality control for the 18 mouse chips, and continued with merging the TRA tables and mouse data. In further steps, we performed different methods of dimension reduction, clustering, DGE; GSEA as well as additional bioinformatic methods.

To compare the embryo development of mouse and bovine, we performed quality control of the [GSE18290 bovine data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18290).


