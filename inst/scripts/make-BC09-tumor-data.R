

### =========================================================================
### BC09 tumor
### =========================================================================

library(Matrix)
library(Seurat)


# tumor 1

# download the necessary files

download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3148nnn/GSM3148575/suppl/GSM3148575_BC09_TUMOR1_barcodes.tsv.gz",
              "BC09_TUMOR1_barcodes.tsv.gz", )
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3148nnn/GSM3148575/suppl/GSM3148575_BC09_TUMOR1_matrix.mtx.gz",
              "BC09_TUMOR1_matrix.mtx.gz")
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3148nnn/GSM3148575/suppl/GSM3148575_BC09_TUMOR1_genes.tsv.gz",
              "BC09_TUMOR1_genes.tsv.gz")

rootDir = getwd()
barcode.path <- paste0(rootDir, "/BC09_TUMOR1_barcodes.tsv.gz")
features.path <- paste0(rootDir, "/BC09_TUMOR1_genes.tsv.gz")
matrix.path <- paste0(rootDir, "/BC09_TUMOR1_matrix.mtx.gz")
mat <- readMM(file = matrix.path)
feature.names <- read.delim(features.path,    header = FALSE,    stringsAsFactors = FALSE)
barcode.names <- read.delim(barcode.path,    header = FALSE,  stringsAsFactors = FALSE)
colnames(mat) <-  barcode.names$V1
rownames(mat) <-  feature.names$V1


BC09  <- CreateSeuratObject(counts =  mat , project = "BC09", min.cells = 0, min.features = 0)

remove <- which(  BC09 $nFeature_RNA/ dim( BC09 )[1]  < 0.01)
if (length(remove) > 0 ){
  BC09 <- BC09[, -c(remove)]
}

BC09 <- NormalizeData( BC09, normalization.method = "LogNormalize", scale.factor = 1e6)




# tumor 2

# download the necessary files

download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3148nnn/GSM3148576/suppl/GSM3148576_BC09_TUMOR2_barcodes.tsv.gz",
              "BC09_TUMOR2_barcodes.tsv.gz" )
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3148nnn/GSM3148576/suppl/GSM3148576_BC09_TUMOR1_matrix.mtx.gz",
              "BC09_TUMOR2_matrix.mtx.gz")
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3148nnn/GSM3148576/suppl/GSM3148576_BC09_TUMOR1_genes.tsv.gz",
              "BC09_TUMOR2_genes.tsv.gz")

matrix_dir = "/albona/nobackup/yuec/benchmark_simulation/data/azizi/"
barcode.path <- paste0(matrix_dir, "BC09_TUMOR2_barcodes.tsv.gz")
features.path <- paste0(matrix_dir, "BC09_TUMOR2_genes.tsv.gz")
matrix.path <- paste0(matrix_dir, "BC09_TUMOR2_matrix.mtx.gz")
mat <- readMM(file = matrix.path)
feature.names <- read.delim(features.path,    header = FALSE,    stringsAsFactors = FALSE)
barcode.names <- read.delim(barcode.path,    header = FALSE,  stringsAsFactors = FALSE)
colnames(mat) <-  barcode.names$V1
rownames(mat) <-  feature.names$V1


BC09_2  <- CreateSeuratObject(counts =  mat , project = "BC09_2", min.cells = 0, min.features = 0)

remove <- which(  BC09_02$nFeature_RNA/ dim( BC09 )[1]  < 0.01)
if (length(remove) > 0 ){
  BC09_02 <- BC09_02[, -c(remove)]
}

BC09_2 <- NormalizeData( BC09_2, normalization.method = "LogNormalize", scale.factor = 1e6)


# combine the 2 tumors

BC09_combine <- merge(BC09, y = BC09_2  , add.cell.ids = c("tumor1", "tumor2"   ), project = "BC09_tumor")

BC09_combine$technology <- "indrop"
BC09_combine$species <- "Human"
BC09_combine$tissue <- "Breast"


saveRDS(BC09_combine, "Azizi_BC09_tumor_cpm.rds")

