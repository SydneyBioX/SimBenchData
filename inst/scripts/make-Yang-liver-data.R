
### =========================================================================
### inDrops Drop-seq
### =========================================================================
library(data.table)
library(Seurat)

download.file("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE90nnn/GSE90047/suppl/GSE90047_Single-cell_RNA-seq_Read_Count.txt.gz",
              "GSE90047_Single-cell_RNA-seq_Read_Count.txt.gz"  )

Rootdir <- getwd()
liver <- fread(paste0(Rootdir, "/GSE90047_Single-cell_RNA-seq_Read_Count.txt.gz"))
liver <-  as.data.frame(liver)
rownames(liver) <- liver$ID
liver <- liver[, -c(1:3)]

timepoint <- colnames(liver)
timepoint <-  unlist( lapply(  strsplit(timepoint, "\\."), `[`, 1))
table(timepoint)

index <- which(timepoint %in% c("E10", "E11",  "E12", "E13", "E14", "E15", "E17"))
timepoint <- timepoint[index]
liver <- liver[ , index]


liver <- CreateSeuratObject(counts =  liver, project = "liver",
                            min.cells = 0, min.features = 0)

remove <- which(  liver$nFeature_RNA/ dim( liver)[1]  < 0.01)
if (length(remove) > 0 ){
  liver <- liver[, -c(remove)]
}

liver <- NormalizeData(  liver , normalization.method = "LogNormalize",
                         scale.factor = 1e6)

liver$technology <- "smart-seq2"
liver$species <- "Mouse"
liver$tissue <-  "liver"
liver$celltype <-  timepoint

saveRDS(liver, paste0("Yang_mouse_liver_cpm.rds") )

