# Topic 04 - team 04: The role of tissue-restricted antigens (TRAs) in heart development during embryogenesis


**Participants:**
* Nina Droste, Amena ElMaadawy, Mariam Hassan, Aleksandra Dohren, 

**Supervisors:**
* Dr. Maria Dinkelacker, Ian Fichtner 

**Our Project:**

We used [GSE18290 mouse data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18290). The chips contained data from six different cell stages, ranging from 1cell stage to blastocyst cell stage, in three replicates. 

<p align="center">
  <img width="700" height="250" src="https://github.com/datascience-mobi-2022/2022-topic-04-team-04/blob/8bdce2e53b4b714cc99cee5cbfea0e31622c70e8/Topic4_cellstages.png">
  
</p>

Our aim was to compare mouse TRA-gene tables, provided by Dr. Maria Dinkelacker, with TRAs present in our dataset.

We were interested in finding out, if:


<p align="center">
  <img width="460" height="300" src="https://github.com/datascience-mobi-2022/2022-topic-04-team-04/blob/1b6a4cc1fc4fcf1aaf52a296396986c63ca121b1/Topic4_Researchquestion.png">
</p>



Additionally, we focussed on three sub question, that could be answered during our project: 

> Is the greatest TRA expression found between the fourth and eighth cell stage


We compared TRA expression of different cell stages and found the change between 4th and 8th cell stage to be the greatest.

> Is TRA expression in bovine comparable to TRA expression in mouse?


We added bovine data to compare important pathways in mouse and bovine embroys


> Which is the earliest biological function expressed by those genes?

To answer the main research question and the three sub questions, we first performed quality control for the 18 mouse chips, and continued with merging the TRA tables and mouse data. In further steps, we performed different methods of dimension reduction, clustering, DGE; GSEA as well as additional bioinformatic methods.

To compare the embryo development of mouse and bovine, we performed quality control of the [GSE18290 bovine data](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18290).

**Abstract**
The embryogenesis is one of the most fascinating processes before life onsets. With our provided data set (_Mus musculus_) from the one cell stadium to a fully formed blastocyst before preimplantation we were able to evaluate the changes in genetic expression patterns necessary for specific tissue and thus organ development in depth. With the provided TRA database by Dr. Dinkelacker we were able to examine the connection of Tissue Restricted Antigens (TRAs), the establishment of self-tolerance due to the upregulation of TRAs in specific cell stages and tissues. Through the means of differential gene expression (DGE) and gene set enrichment analysis (GSEA) were able to achieve further results and thus contribute to the overall understanding of embryogenesis and tissue formation.  A particularly interesting outcome of upregulated gene transcripts in the fourth to eighth cell stages, connected with the TRA data set implies an upregulated gene activation of hypoxia relevant genes. Furthermore, the most upregulated TRA transcripts could be found in the heart tissue, consequently we conclude that the upregulation of hypoxia genes and thus the sensitive regulation of oxygen levels in the early embryo are one of the most important events in the embryogenesis. Moreover, we could confirm the timing of zygote genome activation (ZGA) by clustering and the sum of the total gene expression changes, as well as the downregulation of histone activity right after discard of maternal transcripts. Working with a bovine data set (_Bos taurus_) for comparison, we concluded that the different development and regulation of metabolic pathways is due to a divergent time dependent cell differentiation and hence change of genetic expression. In summary, we could show that the expression of TRAs in the early stages of tissue development are essential and connected with the tissue formation and thus a vital cardiovascular system.

