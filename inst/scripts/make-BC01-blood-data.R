

### =========================================================================
### BC01 blood
### =========================================================================
library(data.table)
library(Seurat)


# download data
download.file("https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE114725&format=file", "temp.tar")
system("tar -xvf temp.tar")
Rootdir = getwd()


# process data
processdata <- function( pathname , name){

  scdata <-  fread(paste0( Rootdir , pathname   ))
  scdata  <- t(scdata )
  colnames(scdata ) <-  scdata [1, ]
  scdata  <- scdata [-1, ]
  scdata [is.na(scdata )] <- 0

  scdata   <- CreateSeuratObject(counts = scdata  , project = name ,
                                 min.cells = 0, min.features = 0)
  scdata  <- scdata [ , -c( which(scdata$nFeature_RNA/ dim(scdata )[1]  < 0.01))]
  scdata  <- NormalizeData( scdata  , normalization.method = "LogNormalize", scale.factor = 1e6)

  return( scdata  )
}


# process and combine the datasets
BC01_blood1 <- processdata("/GSM3148585_BC01_BLOOD1_counts.csv.gz"  , "BC01_blood1"  )
BC01_blood3 <- processdata("/GSM3148586_BC01_BLOOD3_counts.csv.gz" ,  "BC01_blood3" )

BC01_blood <- merge(BC01_blood1, y = BC01_blood3, add.cell.ids = c("blood1", "blood3"), project = "BC01_blood")
BC01_blood <- BC01_blood[ , -c( which(BC01_blood$nFeature_RNA/ dim(BC01_blood)[1]  < 0.01))]

BC01_blood$technology <- "10x"
BC01_blood$species <- "Human"
BC01_blood$tissue <- "PBMC"


saveRDS(BC01_blood, "Azizi_BC01_blood_cpm.rds")

