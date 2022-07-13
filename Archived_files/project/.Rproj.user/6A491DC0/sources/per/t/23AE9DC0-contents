library(affy)
library(vsn)
library(AnnotationDbi)
library(moe430ammenstprobe)
library(moe430ammenstcdf)
library(hexbin)
library(pheatmap)
library(rstudioapi)
library(tidyverse)
library(dplyr)
library(icd.data)
library(tibble)
library(data.table)


#Wir brauchen: 
TRA_total # Alle TRAs die uns zur verfügung stehen, enthält Tissues die wir brauchen
TRAs_mousedataset #TRAs, die in unserem Dataset sind, 6188 Zeilen, TRA_total muss gekürzt werden


#1. Erste column von TRA_total(esemble.transcript) als row names, um später matchen/subsetten zu können
rownames(TRA_total) = TRA_total$ensembl.transcript # gibt error, da es doppelte rownames gibt, Plan: nuiques nutzen, um keine gleichen rownames zu haben

#2. Unique TRAs in Dataset als Vektor abspeichern, um TRA_total subsetten zu können.  Uniques aus TRA_total finden, sodass man esemble.transcript als Row names setzen kann

vec = c(rownames(TRAs_mousedataset)) # alle unique TRAs sind jetzt in diesem Vektor

#3. Subsetting von TRA_total, sodass nur Werte behalten werden, deren esemble.transcript mit Werte in c übereinstimmt

tissue = TRA_total[TRA_total$ensembl.transcript %in% rownames_TRAs_mousedataset, ] #Problem: gibt zwar was aus aber das sieht sehr falsch aus

tissue1 = TRA_total[is.element(TRA_total$ensembl.transcript, vec), ] #hat 10207 Zeilen anstatt nur 6188...

tissue2 = filter(TRA_total, "ensembl.transcript" %in% vec) #keine Entries mehr

###-> Plan war, eine Tabelle zu bekommen, die genau so wie TRAs_mousedataset aussieht aber auch noch die Tissues hat
tissue3 = setDT(TRA_total, key= "ensembl.transcript")[J(vec)] ## auch keine Uniques...

tissue4 = TRA_total[which(rownames(TRA_total[1, ]) %in% keeprows_Mousedata), ] # filtern nach TRA namen der anderen geht auch nicht 

#4. Uniques erneut filtern, da anscheinend (warum auch immer) neue Zeilen dazukommen
tissues_unique = unique(tissue1) # das sieht besser aus, die Zahlen stimmen aber immernoch nicht mit 6188 überein

### es ist gerade nicht möglich, die TRAs mit den Tissues zusammenzubringen, weil 

Tissues_table = TRA_total[,11]##Problem: Da man die esemble transcripts nicht als rownames machen kann ( weil doppelte), verschwinden hier die Transcript IDs, ich weiß nicht ob R die sich merkt

unique_TRA_total = unique(TRA_total[,1]) # schmießt doppelte esemble transcripts raus

namesTRA_total = c(unique_TRA_total[,1]) # vektor aus unique TRA namen

TRA_unique_names = rownames(rownamesTRA_total) # vektor aus unique TRA names als rownames setzen -> NULL




#####Anderer Code Dump----------------------------####################
#Tissue overview in total TRA --- 08.06.2022 AD, ND

TRA_total
TRA_tissuenames = as.data.frame(TRA_total[,11])
TRA_tissuevector = c(TRA_tissuenames)
Tissue_counts = table(TRA_tissuevector)
Tissue_sort = sort(Tissue_counts)
Top_tissue = tail(Tissue_sort)
plot(Top_tissue)
plot(Tissue_counts)


# Make a new table of results, 

mean_expression_1cell = rowMeans(TRAs_mousedataset[,1:3])
mean_expression_2cell = rowMeans(TRAs_mousedataset[,4:5])
mean_expression_4cell = rowMeans(TRAs_mousedataset[,6:8])
mean_expression_8cell = rowMeans(TRAs_mousedataset[,9:11])
mean_expression_morula = TRAs_mousedataset[,12]
mean_expression_blastocyst = rowMeans(TRAs_mousedataset[,13:15])

# df mean expression zeigt mean expressions pro zellstadium, noch keine Tissues vorhanden
df_mean_expression= data.frame(mean_expression_1cell, mean_expression_2cell, mean_expression_4cell, mean_expression_8cell, mean_expression_morula,mean_expression_blastocyst)
df_mean_expression
# In TRAs_mousedataset liegen alle TRAs, die in unserem Datensatz verfügbar sind, aber ohen tissue informationen
# In df_mean_expression sind die Expressionslevel angezeigt


#df_mean_expression[Tissue_max] = TRA_total[,11]

#TRAs_Transkriptnames ist mean expression mit Transcript ID als Spalte
#TRAs_Transcriptnames <- cbind(rownames(df_mean_expression), data.frame(df_mean_expression, row.names=NULL))

# wir wollen: df_mean_expression mit tissues und Results -> Matchen von TRAs_Transcriptnames with TRAs_total
#df_mean_expression -> Mean von 6188 Genes
#TRA_total --> TRA table with tissue and all genes
Tissue_TRA = df_mean_expression[which(rownames(df_mean_expression) %in% unique_TRAs)]

TRAs_mousedataset = data_ohneaffx[which(rownames(data_ohneaffx) %in% unique_TRAs),] 
Matched_with_tissue = cbind

#merge(x = df_mean_expression, y = TRA_total[ , c("rownames(df_mean_expression", "max.tissue")], by = , all.x=TRUE)

#-> Problem: wir wollten tabelle erstellen, die transcript ID, Tissue und result zeigt, aber nur von den TRAs, die in unserem Datenset vorhanden sind

#####Amena Code Dump----------------------------####################
matched_tissues = TRA_total[which(TRA_total[,1] %in% rownames(TRAs_mousedataset)),]
View(matched_tissues)
#matched_tissues_copy = cbind(matched_tissues[,1], matched_tissues)
duplicates = duplicated(matched_tissues[,1])
matched_tissues_new = matched_tissues[!duplicates,]

####just trying to see if we could do the same with TRA total

# 1. hagib TRA1 we TRA2 we hashuf anhi mesh zai ba3d men spalte 1
# el false hashuf el indices beto3hom we ashil el TRUE men el datafram kolaha
# hagib TRA 1 kolaha we azawed el false men TRA2 we a7otohom as TRA total
# then match this with th TRA_mousedata