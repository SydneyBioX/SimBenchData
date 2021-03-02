
### =========================================================================
### Francesconi
### =========================================================================

library(GEOquery)
library(Seurat)


# download the expression files
files <- c("030U" , "031U", "032U","033U","672T","673T","674T","675T",
           "676T", "677T", "678T","679T","932S","933S","934S","935S",
            "936S","937S","938S","939S" )

for ( thisfile in files  ) {
  download.file(paste0("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE112nnn/GSE112004/suppl/GSE112004_counts.", thisfile, ".tsv.gz") ,
                paste0("GSE112004_counts." , thisfile, ".tsv.gz"))
}


# download the label
F_label <- getGEO("GSE112004")
F_label <- F_label$GSE112004_series_matrix.txt.gz


Rootdir <- getwd()
files <- list.files(paste0( Rootdir , "/ipsc/"))

treatment <- c()
fate <- c()
timepoint <- c()
temp_matrix <- list()

# process each matrix
for (i in c(1:length( files))){
  print(i )
  F_030U <- fread(paste0( Rootdir , "/ipsc/", files[i]))
  F_030U  <- as.data.frame(F_030U )
  rownames(F_030U) <- F_030U[, 1]
  F_030U <- F_030U[, -1]

  F_030U <- CreateSeuratObject(counts =  F_030U, project = "Francesconi", min.cells = 0, min.features = 0)

  remove <- which( F_030U $nFeature_RNA/ dim( F_030U )[1]  < 0.01)
  if (length(remove) > 0 ){
    F_030U <- F_030U[, -c(remove)]
  }

  F_030U <- NormalizeData(  F_030U, normalization.method = "LogNormalize", scale.factor = 1e6)

  temp_matrix[[i]] <-   F_030U
  index <- match(colnames( F_030U) ,F_label$title  )
  treatment <- c( treatment, F_label$`treatment:ch1`[index]  )
  fate <- c( fate, F_label$`fate:ch1`[index]   )
  timepoint <- c(timepoint, F_label$`time point:ch1`[index]    )


}


# combine each matrix into one matrix

final_matrix <- merge(x = temp_matrix[[1]], y = temp_matrix[c(2:20)]   )
final_matrix$treatment <- treatment
final_matrix$fate <- fate
final_matrix$timepoint <- timepoint

final_matrix$technology <- "mars-seq"
final_matrix$species <- "Mouse"
final_matrix$tissue <- "bone marrow"

saveRDS(final_matrix, "Francesconi_human_ipsc_cpm.rds")
