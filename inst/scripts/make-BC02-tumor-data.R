


### =========================================================================
### BC02 tumor
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
BC02_tumor1 <- processdata("/GSM3148604_BC02_TUMOR1_counts.csv.gz"  , "BC02_tumor1"  )
BC02_tumor2 <- processdata("/GSM3148605_BC02_TUMOR2_counts.csv.gz" ,  "BC02_tumor2" )
BC02_tumor3 <- processdata("/GSM3148606_BC02_TUMOR3_counts.csv.gz"  , "BC02_tumor3")
BC02_tumor4 <- processdata("/GSM3148607_BC02_TUMOR4_counts.csv.gz" , "BC02_tumor4")

BC02  <- merge(BC02_tumor1 , y = c(BC02_tumor2, BC02_tumor3,  BC02_tumor4   ) ,
               add.cell.ids = c("tumor1", "tumor2", "tumor3" ,  "tumor4" ), project = "BC02_tumor")
BC02 <- BC02[ , -c( which(BC02$nFeature_RNA/ dim(BC02)[1]  < 0.01) ) ]


BC02$technology <- "10x"
BC02$species <- "Human"
BC02$tissue <- "Breast"

saveRDS(BC02 , "Azizi_BC02_tumor_cpm.rds")
