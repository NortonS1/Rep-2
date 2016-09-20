# Heatmap v 1
My_Palette <- colorRampPalette(c("firebrick","chocolate1","white","aliceblue","navy"))(256)
heatmap(as.matrix(DS3)
,col=My_Palette
,scale="column"
,main="Relative Gene Expression"
,Colv=NA)


source("https://bioconductor.org/biocLite.R")
biocLite("ComplexHeatmap")

My_Palette <- colorRampPalette(c("firebrick","chocolate1","white","aliceblue","navy"))(256)
scale((as.matrix(DS3)), center = TRUE, scale = TRUE) -> ScaledDS3
Heatmap(ScaledDS3, cluster_columns = FALSE, col = My_Palette)



# Heatmap v 2
apply(DS3, 2, scale) -> BSDS3
My_Palette <- colorRampPalette(c("navy","aliceblue","white","chocolate1","firebrick"))(256)
Heatmap(BSDS3, cluster_columns = FALSE, col = My_Palette, row_hclust_width = unit(5, "cm"))

# selecting rows and columns to form matrix of raw data
as.matrix(Raw [c(1:7,11,12,13,14,16) ,c(2:22)]) -> matrix2

read.csv("/Users/Sam/Desktop/R work/Citrus R/Staged features.csv") ->rawstaged
as.matrix(rawstaged [ ,c(6,7,10,11,14,22,16,17:21)]) -> matrix2
apply(matrix2, 2, scale) ->matrix2scaled
My_Palette <- colorRampPalette(c("navy","aliceblue","white","chocolate1","firebrick"))(256)
Heatmap(matrix2scaled, cluster_rows = FALSE, col = My_Palette)

# reading an FCS File and only showing actual factors
library(flowCore)
x <- read.FCS("Normal Concat.fcs", column.pattern = "Di", tread.csvransformation = "scale")

# Remove infinites and NAs from rows
Xl[!rowSums(!is.finite(Xl)),]

# Full Heatmap with extended Dendros of flow data
library(ComplexHeatmap)
read.csv("N 1289 Macs.csv") -> x
as.matrix(x) -> Xm
log10(Xm) -> Xl
Xl[!rowSums(!is.finite(Xl)),] -> Xl
apply(Xl,2,scale) -> Xs
My_Palette <- colorRampPalette(c("navy","aliceblue","bisque","chocolate1","firebrick"))(256)
Heatmap(Xs, cluster_columns = FALSE, col = My_Palette, row_dend_width = unit(3,"cm"))

# refined above heatmap
library(ComplexHeatmap)
library(dendextend)
read.csv("T Concatflow.csv") -> x
as.matrix(x) -> Xm
log10(Xm) -> Xl
Xl[!rowSums(!is.finite(Xl)),] -> Xl
apply(Xl,2,scale) -> Xs
My_Palette <- colorRampPalette(c("navy","aliceblue","bisque","chocolate1","firebrick"))(256)
Heatmap(Xs, cluster_columns = FALSE, col = My_Palette, row_dend_width = unit(3,"cm"))
 



