
### =========================================================================
###  retina
### =========================================================================
library(data.table)
library(Seurat)


# download the expression matrix of one mouse to reduce heterogeneity in the data
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM1626nnn/GSM1626793/suppl/GSM1626793_P14Retina_1.digital_expression.txt.gz",
              "GSM1626793_P14Retina_1.digital_expression.txt.gz" )

Rootdir <- getwd()

retina <- fread ( paste0( Rootdir,  "/GSM1626793_P14Retina_1.digital_expression.txt.gz")
retina <- as.data.frame(retina)
rownames( retina ) <- retina$gene
retina <- retina[, -1]



retina <- CreateSeuratObject(counts =  retina , project = "retina",
                             min.cells = 0, min.features = 0)

remove <- which( retina$nFeature_RNA/ dim(  retina )[1]  < 0.01)

if (length(remove) > 0 ){
  retina <-retina[, -c(remove)]

}

retina  <- NormalizeData(  retina  , normalization.method = "LogNormalize",
                           scale.factor = 1e6)

retina$technology <- "dropseq"
retina$species <- "Mouse"
retina$tissue <-  "retina"
retina$celltype <-  "retina"

saveRDS( retina, "GSE63472_mouse_retina_cpm.rds")
