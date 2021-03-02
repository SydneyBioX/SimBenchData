
### =========================================================================
### Soumillon
### =========================================================================

library(Seurat)
library(R.utils)

download.file("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53638/suppl/GSE53638_D3_UMI.dat.gz",
"GSE53638_D1_UMI.dat.gz")
gunzip("/albona/nobackup/yuec/benchmark_simulation/data/GSE53638_D3_UMI.dat.gz")

Rootdir <- getwd()
Soumillon <- read.delim(paste0(Rootdir, "/GSE53638_D3_UMI.dat")
rownames(Soumillon) <- Soumillon[,  1]
Soumillon <- Soumillon[ , -1]
Soumillon <- CreateSeuratObject(counts = Soumillon, project = "Soumillon", min.cells = 0, min.features = 0)

remove <- which(  Soumillon$nFeature_RNA/ dim( count)[1]  < 0.01)
if (length(remove) > 0 ){
  Soumillon<- Soumillon[, -c(remove)]
}


Soumillon <- NormalizeData(Soumillon, normalization.method = "LogNormalize", scale.factor = 1e6)

Soumillon$technology <- "SCRB-Seq"
Soumillon$species <- "Human"
Soumillon$tissue <- "Adipose Derived Stem Cells"

celltype <- colnames(Soumillon)
celltype <- unlist(  lapply ( strsplit(celltype,  "_") ,`[`, 1 ))
Soumillon$celltype <- celltype
#day 0 , day 3, day 7
saveRDS(Soumillon, "Soumillon_DECENT_human_adipose_cpm_sc.rds")
