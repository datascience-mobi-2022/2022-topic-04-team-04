#####venn diagram
if (!require(devtools)) install.packages("devtools")
devtools::install_github("gaospecial/ggVennDiagram")
library("ggVennDiagram")
library("VennDiagram")
install.packages('VennDiagram')
library(VennDiagram)
#Draw the diagram comparing the Olympics and PA sets
v2 <- venn.diagram(gsea_bovineresults[,1], Gsea_mouse@result[,1])


#######
library(limma)
results1
a = vennCounts(results1)
View(a)
vennDiagram(a)

#####
b = vennCounts(DGE_tissues)
venn.diagram(DGE_tissues)




library(limma)
results1
d = vennCounts(results1[1:4,])
View(d)
vennDiagram(d)

#####
b = vennCounts(DGE_tissues)
venn.diagram(DGE_tissues)





library("ggVennDiagram")

# use list as an input
x <-list(q=c(results1[,1]),w=c(results1[,2]),
         e=c(results1[,3]),r=c(results1[,4]),t=c(results1[,5]))

# creating Venn diagram and displaying 
# all sets
ggVennDiagram(x)

#######

z <-list(q=c(results1[,1]),w=c(results1[,2]),
         e=c(results1[,3]),r=c(results1[,4]),t=c(results1[,5]),y=c(DGE_tissues$max.tissue))

# creating Venn diagram and displaying 
# all sets
ggVennDiagram(z)
