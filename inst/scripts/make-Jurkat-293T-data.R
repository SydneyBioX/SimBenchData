
### =========================================================================
###  Jurkat and 293T
### =========================================================================

library(Matrix)
library(Seurat)


# process 293T

# download files
download.file("https://cf.10xgenomics.com/samples/cell-exp/1.1.0/293t/293t_filtered_gene_bc_matrices.tar.gz" ,
              "293t_filtered_gene_bc_matrices.tar.gz")
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



# process jurkat

# download files
download.file("https://cf.10xgenomics.com/samples/cell-exp/1.1.0/jurkat/jurkat_filtered_gene_bc_matrices.tar.gz" ,
              "jurkat_filtered_gene_bc_matrices.tar.gz")
system2("tar -xvzf jurkat_filtered_gene_bc_matrices.tar.gz")
Rootdir <- getwd()

# read in files
matrix_dir = paste0(Rootdir, "/filtered_matrices_mex/hg19/")
barcode.path <- paste0(matrix_dir, "barcodes.tsv")
features.path <- paste0(matrix_dir, "genes.tsv")
matrix.path <- paste0(matrix_dir, "matrix.mtx")
mat <- readMM(file = matrix.path)
feature.names <- read.delim(features.path,  header = FALSE,    stringsAsFactors = FALSE)
barcode.names <- read.delim(barcode.path,  header = FALSE,  stringsAsFactors = FALSE)
colnames(mat) <-  barcode.names$V1
rownames(mat) <-  feature.names$V1

zheng_jurkat  <- CreateSeuratObject(counts =  mat , project = "jurkat", min.cells = 0, min.features = 0)


zheng <- cbind( zheng_293t@assays$RNA@counts,   zheng_jurkat@assays$RNA@counts)
zheng  <- CreateSeuratObject(counts =  zheng , project = "zheng", min.cells = 0, min.features = 0)

remove <- which( zheng$nFeature_RNA/ dim(  zheng )[1]  < 0.01)
if (length(remove) > 0 ){
   zheng <-  zheng[, -c(remove)]
}

zheng  <- NormalizeData( zheng  , normalization.method = "LogNormalize", scale.factor = 1e6)

zheng$technology <- "10x"
zheng$species <- "Human"
zheng$tissue <- "cellline_mix"
zheng$trajectory <- "No"
zheng$celltype <- c(rep( "293t", ncol(zheng_293t  )) ,  rep ("jurkat", ncol(zheng_jurkat)))

saveRDS(zheng, "zheng_293t_and_jurkat_cpm.rds")



