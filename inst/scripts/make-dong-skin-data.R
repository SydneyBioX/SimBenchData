
### =========================================================================
###  Dong skin
### =========================================================================

library(Seurat)
library(readxl)


download.file("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE87nnn/GSE87038/suppl/GSE87038_Mouse_Organogenesis_UMI_counts_matrix.xlsx",
              "GSE87038_Mouse_Organogenesis_UMI_counts.xlsx")
Rootdir <- getwd()

GSE87038_Mouse_Organogenesis_UMI_counts <- read_excel(paste0 (Rootdir, "/GSE87038_Mouse_Organogenesis_UMI_counts.xlsx"))

Organogenesis <- GSE87038_Mouse_Organogenesis_UMI_counts
Organogenesis <-  as.data.frame(Organogenesis )
rownames(  Organogenesis)  <- Organogenesis$Gene
Organogenesis <-  Organogenesis[  ,-1]
tissue  <- colnames(  Organogenesis)
tissue <-  unlist(  lapply (  strsplit(tissue, "_"), `[` , 1))

timepoint <- colnames(  Organogenesis)
timepoint <-  unlist(  lapply (  strsplit(timepoint, "_"), `[` , 2))


thistissue <- "skin"

index <- which(tissue ==  thistissue)
thistimepoint <- timepoint[  index   ]

this_Organogenesis <- Organogenesis[ , index]
this_Organogenesis <- CreateSeuratObject(counts =  this_Organogenesis, project = "Organogenesis",
                                         min.cells = 0, min.features = 0)

remove <- which(   this_Organogenesis$nFeature_RNA/ dim(   this_Organogenesis)[1]  < 0.01)
if (length(remove) > 0 ){
  this_Organogenesis <- this_Organogenesis[, -c(remove)]
  thistimepoint  <- thistimepoint[-c(remove)]
}

this_Organogenesis <- NormalizeData(  this_Organogenesis , normalization.method = "LogNormalize",
                                      scale.factor = 1e6)

this_Organogenesis$technology <-  "strt-seq"
this_Organogenesis$species <- "Mouse"
this_Organogenesis$tissue <-  thistissue
this_Organogenesis$celltype <- thistimepoint

saveRDS(this_Organogenesis, paste0("Dong_mouse_",  thistissue ,  "_cpm.rds") )


