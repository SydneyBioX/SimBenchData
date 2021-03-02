### =========================================================================
###  Chen
### =========================================================================

library(Matrix)
library(Seurat)



download.file("https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE113660&format=file", "temp.tar")
system("tar -xvf temp.tar")
Rootdir <- getwd()


barcode.path <- paste0(Rootdir, "/GSM3110765_barcodes.tsv.gz")
features.path <- paste0(Rootdir, "/GSM3110765_genes.tsv.gz")
matrix.path <- paste0(Rootdir, "/GSM3110765_matrix.mtx.gz")
mat <- readMM(file = matrix.path)
feature.names <- read.delim(features.path,    header = FALSE,    stringsAsFactors = FALSE)
barcode.names <- read.delim(barcode.path,    header = FALSE,  stringsAsFactors = FALSE)
colnames(mat) <-  barcode.names$V1
rownames(mat) <-  feature.names$V1

chen  <- CreateSeuratObject(counts =  mat , project = "Chen_single", min.cells = 0, min.features = 0)


remove <- which( chen$nFeature_RNA/ dim(chen)[1]  < 0.01)
if (length(remove) > 0 ){
  chen  <-  chen[, -c(remove)]
}

chen <- NormalizeData( chen, normalization.method = "LogNormalize", scale.factor = 1e6)


chen$technology <- "10x"
chen$species <- "Human"
chen$tissue <- "Lung"

# obtained from author
label <- read.delim("Rh41_cluster.txt")
label <- label [ match(colnames(chen), label$cellID), ]
chen$cluster <- label$cluster
chen$celltype <- chen$cluster
chen <-  chen[, -c(which(is.na(chen$cluster) ))]

saveRDS(chen, "Chen_DECENT_human_RH41_cpm_sc.rds")



