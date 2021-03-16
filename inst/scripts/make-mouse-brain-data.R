### =========================================================================
###  Zeisel
### =========================================================================

library(Seurat)

download.file("https://storage.googleapis.com/linnarsson-lab-www-blobs/blobs/cortex/expression_mRNA_17-Aug-2014.txt",
              "Zeisel.txt")

Rootdir <- getwd()
zeisel <- read.delim(paste0(Rootdir , "/Zeisel.txt"))
rownames (zeisel) <-  make.names( zeisel[ , 1], unique=TRUE)
zeisel <- zeisel[ , -c(1,2) ]
region <- colnames(zeisel)
region <- unlist( lapply (strsplit( region , "\\."),  `[`, 1) )

group <-  zeisel[ 1 ,  ]
cell_id <-  zeisel[ 7  ,  ]
level1class   <-  zeisel[8 ,  ]
level2class <-  zeisel[ 9 ,  ]
zeisel <- zeisel[ -c(1:10), ]
colnames(zeisel) <- cell_id


zeisel  <- CreateSeuratObject(counts = zeisel, project = "zeisel", min.cells = 0, min.features = 0)
zeisel <- NormalizeData(zeisel, normalization.method = "LogNormalize", scale.factor = 1e6)

zeisel$technology <- "STRT/C1"
zeisel$species <- "Mouse"
zeisel$tissue <- "Brain"

level1class <- data.frame(level1class)
level1class <-  t( level1class)
level1class <- data.frame( level1class)
zeisel$celltype <-   level1class$X.none..1


saveRDS(zeisel, "zeisel_DECENT_mouse_brain_cpm.rds")

