
### =========================================================================
###  Gierahn
### =========================================================================

library(data.table)
library(Seurat)


download.file("https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE92495&format=file" , "temp.tar")
system("tar -xvf temp.tar")
Rootdir = getwd()

HEK  <-  fread(paste0(Rootdir, "/GSM2486331_HEK_SingleCells.txt"))
HEK <- as.data.frame(HEK)
rownames( HEK ) <- HEK[, 1]
HEK <- HEK[, -1]

HEK <- CreateSeuratObject(counts =  HEK, project = "HEK", min.cells = 0, min.features = 0)
remove <- which( HEK$nFeature_RNA/ dim(  HEK)[1]  < 0.01)
if (length(remove) > 0 ){
  HEK <- HEK[, -c(remove)]
}

HEK <- NormalizeData( HEK, normalization.method = "LogNormalize", scale.factor = 1e6)

HEK$technology <- "seqwell"
HEK$species <- "Human"
HEK$tissue <- "kidney"

saveRDS(HEK, "Gierahn_human_HEK_cpm.rds")

