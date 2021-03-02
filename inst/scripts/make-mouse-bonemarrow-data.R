
### =========================================================================
###  Pual
### =========================================================================
library(data.table)
library(Seurat)


# download the file
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE72nnn/GSE72857/suppl/GSE72857_umitab.txt.gz",
              "GSE72857_umitab.txt.gz")
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE72nnn/GSE72857/suppl/GSE72857_experimental_design.txt.gz",
              "GSE72857_experimental_design.txt.gz")


# read in data
Rootdir <- getwd()
pual <- fread(paste0(Rootdir,  "/GSE72857_umitab.txt.gz"))
pual <- as.data.frame(pual)
rownames(pual) <- pual[, 1]
pual <- pual[, -1]

# read in cell type label
pual_label <- fread(paste0(Rootdir,  "/GSE72857_experimental_design.txt"))

# For samples 21-22, 25-26, 31-32, mice were injected three times with 300 µg poly(I:C) three weeks before bone marrow harvest
# remove these samples to reduce variations in the cell types
remove <-  which(pual_label$Amp_batch_ID %in% c("AB246" , "AB247"  , "AB283"  ,"AB284" , "AB295" , "AB296" ))
pual_label <- pual_label[ -c(remove), ]
pual <- pual[, -c(remove)  ]

# remove undefined cell types
remove <-  which(pual_label$Batch_desc   %in% c("Unsorted myeloid" ))
pual_label <- pual_label[ -c(remove), ]
pual <- pual[, -c(remove)  ]

rownames(pual) <- unlist( lapply ( strsplit(rownames(pual), ";"), `[`, 1))

pual  <- CreateSeuratObject(counts = pual, project = "pual", min.cells = 0, min.features = 0)
remove <- which( pual$nFeature_RNA/ dim(pual)[1]  < 0.01)
if (length(remove) > 0 ){
  pual <- pual[, -c(remove)]
}

pual<- NormalizeData(pual, normalization.method = "LogNormalize", scale.factor = 1e6)

pual$celltype <- pual_label$Batch_desc
pual$technology <- "mars-seq"
pual$species <- "Mouse"
pual$tissue <- "Bone Marrow"


saveRDS(pual, "pual_cscGAN_mouse_bonemarrow_cpm.rds")
