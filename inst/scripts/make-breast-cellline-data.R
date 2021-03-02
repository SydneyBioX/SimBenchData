
### =========================================================================
###  breast cell line
### =========================================================================

library(data.table)
library(Seurat)


# download files
download.file("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE106nnn/GSE106202/suppl/GSE106202_FRUCTOSE_GLUCOSE_merge.DGE.txt.gz", "GSE106202_FRUCTOSE_GLUCOSE_merge.DGE.txt.gz")

Rootdir = getwd()
cellline <- fread(paste0(Rootdir , "/GSE106202_FRUCTOSE_GLUCOSE_merge.DGE.txt.gz"))
cellline <-  as.data.frame(cellline )
rownames(cellline) <- cellline$GENE
cellline <- cellline[ , -1]
celltype <- colnames(cellline)

# take the subset cultured in glucose
cellline <- cellline [ , grep ( "Glucose" , celltype )]


cellline  <- CreateSeuratObject(counts =  cellline  , project = "breastcellline",
                                min.cells = 0, min.features = 0)

remove <- which( cellline$nFeature_RNA/ dim(  cellline)[1]  < 0.01)

if (length(remove) > 0 ){
  cellline <-  cellline[, -c(remove)]

}

cellline  <- NormalizeData(  cellline  , normalization.method = "LogNormalize",
                             scale.factor = 1e6)

cellline$technology <- "dropseq"
cellline$species <- "Human"
cellline$tissue <-  "breast_cellline"
cellline$celltype <-  "breast_cellline"

saveRDS(  cellline , paste0("GSE106202_human_breastcellline_cpm.rds") )

