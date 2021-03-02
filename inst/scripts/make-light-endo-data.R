
### =========================================================================
###  light endo
### =========================================================================

library(data.table)
library(Seurat)

# download the cell type information and count matrix
download.file("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE102nnn/GSE102827/suppl/GSE102827_cell_type_assignments.csv.gz",  "GSE102827_cell_type_assignments.csv.gz"  )

download.file("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE102nnn/GSE102827/suppl/GSE102827_merged_all_raw.csv.gz",
              "GSE102827_merged_all_raw.csv.gz"  )


Rootdir <- getwd()
merged <- fread(paste0(Rootdir ,  "/GSE102827_merged_all_raw.csv.gz" ))
merged <- as.data.frame(merged )
rownames(merged)  <- merged$V1
merged <- merged[ , -1]

label <- fread( paste0(Rootdir ,  "/GSE102827_cell_type_assignments.csv.gz"), header = T    )
tissue  <- label$maintype
timepoint <- label$stim


index <- which(tissue  ==  "Endothelial_SmoothMuscle")
thistimepoint <- timepoint[  index   ]
this_merged <- merged[ , index]
this_merged <- CreateSeuratObject(counts =  this_merged, project = "timeexposure",
                                    min.cells = 0, min.features = 0)

remove <- which(   this_merged$nFeature_RNA/ dim(   this_merged)[1]  < 0.01)

if (length(remove) > 0 ){
    this_merged  <- this_merged[, -c(remove)]
    thistimepoint  <- thistimepoint[-c(remove)]
}

this_merged <- NormalizeData(  this_merged , normalization.method = "LogNormalize",
                                 scale.factor = 1e6)

this_merged$technology <-  "indrops"
this_merged$species <- "Mouse"
this_merged$tissue <-  thistissue
this_merged$celltype <- thistimepoint

saveRDS(this_merged,  "lightexposure_Endothelial_SmoothMuscle_cpm.rds")


