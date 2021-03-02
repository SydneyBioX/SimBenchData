
### =========================================================================
###  inDrops CEL-Seq2
### =========================================================================
library(data.table)
library(Matrix)
library(Seurat)

## Note, please download the following files from the Broad Institute Single Cell portal
## An account is required to access the download page
## The download page is https://singlecell.broadinstitute.org/single_cell/study/SCP425/single-cell-comparison-cortex-data#study-download

# count data is counts.read.txt.gz
# gene name is genes.read.txt
# cell name is cells.read.new.txt
# meta data is meta.txt


# parse
rootDir <- getwd()
count   <-  readMM(paste0(rootDir , "/counts.read.txt.gz"))
cell_name <- fread(paste0(rootDir , "/cells.read.new.txt"), header = F)
gene_name <- fread(paste0(rootDir , "/genes.read.txt"), header = F)
colnames(count  )  <-  cell_name$V1
rownames(count ) <- gene_name$V1

meta <-  fread(paste0(rootDir , "/meta.txt"))
meta <- meta[ -1, ]
count  <- count [ ,   match (  meta$NAME,  colnames(count  ) ) ]


# remove the unknown cell type
index <-  which(  meta$CellType ==  "Unassigned")
meta <- meta [ -c(index),  ]
count <- count[, -c(index) ]

# get meta information
tech <-  meta$Method
celltype <- meta$CellType


# subset to CEL-Seq2
index <- which(tech   ==  "CEL-Seq2" )
celltype <- celltype[  index   ]
count <- count[ , index]
tech <- tech[ index]

count <- CreateSeuratObject(counts =  count, project = "compareprotocol", min.cells = 0, min.features = 0)

# filter the low quality cells , nFeatures is the number of expressed genes
remove <- which(  count$nFeature_RNA/ dim( count)[1]  < 0.01)
if (length(remove) > 0 ){
  count <- count [, -c(remove)]
  celltype  <- celltype[-c(remove)]
  tech <- tech [  -c(remove)]
}

# normalise
count <- NormalizeData( count , normalization.method = "LogNormalize",  scale.factor = 1e6)

count$technology <-  tech
count$species <- "Human"
count$tissue <-  "PBMC"
count$celltype <-  celltype

saveRDS(count,  "compareprotocol_celseq2_cpm.rds")


