
### =========================================================================
###  293T
### =========================================================================

library(Matrix)
library(Seurat)


# download files
download.file("https://cf.10xgenomics.com/samples/cell-exp/1.1.0/293t/293t_filtered_gene_bc_matrices.tar.gz" , "293t_filtered_gene_bc_matrices.tar.gz")
system2("tar -xvzf 293t_filtered_gene_bc_matrices.tar.gz")
Rootdir <- getwd()

# read in files
matrix_dir = paste0(Rootdir, "/filtered_matrices_mex/hg19/")
barcode.path <- paste0(matrix_dir, "barcodes.tsv")
features.path <- paste0(matrix_dir, "genes.tsv")
matrix.path <- paste0(matrix_dir, "matrix.mtx")
mat <- readMM(file = matrix.path)
feature.names <- read.delim(features.path,    header = FALSE,    stringsAsFactors = FALSE)
barcode.names <- read.delim(barcode.path,    header = FALSE,  stringsAsFactors = FALSE)
colnames(mat) <-  barcode.names$V1
rownames(mat) <-  feature.names$V1


zheng_293t  <- CreateSeuratObject(counts =  mat , project = "293t", min.cells = 0, min.features = 0)

remove <- which( zheng_293t$nFeature_RNA/ dim(  zheng_293t )[1]  < 0.01)
if (length(remove) > 0 ){
  zheng_293t <-  zheng_293t[, -c(remove)]
}

zheng_293t <- NormalizeData( zheng_293t, normalization.method = "LogNormalize", scale.factor = 1e6)


zheng_293t$technology <- "10x"
zheng_293t$species <- "Human"
zheng_293t$tissue <- "Kidney"

saveRDS(zheng_293t, "zheng_293t_human_kidneycellline_cpm.rds")


