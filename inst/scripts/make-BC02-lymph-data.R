


### =========================================================================
### BC02 lymph
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
BC02_lymph1 <- processdata("/GSM3148595_BC02_LYMPHNODE1_counts.csv.gz"  , "BC02_lymph1"  )
BC02_lymph2 <- processdata("/GSM3148596_BC02_LYMPHNODE2_counts.csv.gz" ,  "BC02_lymph2" )
BC02_lymph3 <- processdata("/GSM3148597_BC02_LYMPHNODE3_counts.csv.gz"  , "BC02_lymph3")
BC02_lymph4 <- processdata("/GSM3148598_BC02_LYMPHNODE4_counts.csv.gz" ,  "BC02_lymph4")
BC02_lymph5 <- processdata("/GSM3148599_BC02_LYMPHNODE5_counts.csv.gz" ,  "BC02_lymph5")
BC02_lymph6 <- processdata("/GSM3148600_BC02_LYMPHNODE6_counts.csv.gz" ,  "BC02_lymph6")

BC02_lymph  <- merge(BC02_lymph1, y = c(BC02_lymph2, BC02_lymph3, BC02_lymph4,
                                        BC02_lymph5 , BC02_lymph6 ) ,
                     add.cell.ids = c("lymph1", "lymph2", "lymph3", "lymph4", "lymph5", "lymph6"), project = "BC02_lymph")
BC02_lymph  <- BC02_lymph[ , -c( which(BC02_lymph$nFeature_RNA/ dim(BC02_lymph)[1]  < 0.01) ) ]


BC02_lymph$technology <- "10x"
BC02_lymph$species <- "Human"
BC02_lymph$tissue <- "Breast"

saveRDS(BC02 , "Azizi_BC02_lymph_cpm.rds")




