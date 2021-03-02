


### =========================================================================
### BC01 normal
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
BC01_normal1 <- processdata("/GSM3148587_BC01_NORMAL1_counts.csv.gz"  , "BC01_normal1"  )
BC01_normal2 <- processdata("/GSM3148588_BC01_NORMAL2_counts.csv.gz" ,  "BC01_normal2" )
BC01_normal3 <- processdata("/GSM3148589_BC01_NORMAL3_counts.csv.gz"  , "BC01_normal3")
BC01_normal4 <- processdata("/GSM3148590_BC01_NORMAL4_counts.csv.gz" ,  "BC01_normal4")
BC01_normal5 <- processdata("/GSM3148599_BC01_NORMAL5_counts.csv.gz" ,  "BC01_normal5")
BC01_normal6 <- processdata("/GSM3148600_BC01_NORMAL6_counts.csv.gz" ,  "BC01_normal6")


BC01_normal <- merge(BC01_normal1, y = c(BC01_normal2, BC01_normal3, BC01_normal4 ) , add.cell.ids = c("normal1", "normal2", "normal3", "normal4"), project = "BC01_normal")
BC01_normal <- BC01_normal[ , -c( which(BC01_normal$nFeature_RNA/ dim(BC01_normal)[1]  < 0.01) ) ]

BC01_normal$technology <- "10x"
BC01_normal$species <- "Human"
BC01_normal$tissue <- "Breast"


saveRDS(BC01_normal, "Azizi_BC01_normal_cpm.rds")




