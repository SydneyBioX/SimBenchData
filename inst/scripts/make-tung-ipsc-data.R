
### =========================================================================
###  Tung
### =========================================================================

library(data.table)
library(Seurat)


download.file("https://github.com/jdblischak/singleCellSeq/raw/master/data/reads-filter.txt",
              "Tung_DECENT_human_iPSC_raw_filtered.txt")

Rootdir <- getwd()
tung <- read.delim(paste0(Rootdir , "Tung_DECENT_human_iPSC_raw_filtered.txt"))
rownames(tung) <- tung[,  1]
tung <- tung[ , -1]

tung <- CreateSeuratObject(counts = tung, project = "tung", min.cells = 0, min.features = 0)

remove <- which( tung $nFeature_RNA/ dim( tung )[1]  < 0.01)

if (length(remove) > 0 ){
  tung  <- tung [, -c(remove)]
}


# this is cell line data from 3 individual patients
celltype <- colnames(tung)
celltype <- unlist(lapply ( strsplit(celltype, "\\."), `[`, 2))
tung$technology <- "fluidigm c1"
tung$species <- "Human"
tung$tissue <- "iPSC cell line"
tung$celltype <- celltype


saveRDS(tung, "Tung_DECENT_human_iPSC_raw_filtered.rds")

