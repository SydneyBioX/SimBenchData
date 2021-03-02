

### =========================================================================
###  Tabula Muris 10x
### =========================================================================


library(Matrix)
library(Seurat)

# download and unzip the file
download.file("https://ndownloader.figshare.com/articles/5968960/versions/1", "01_droplet_raw_data.zip" )
system("unzip 01_droplet_raw_data.zip")
system("unzip droplet.zip")

rootDir <- getwd()
dir <- paste0(rootDir, "/droplet/")

##Read data matrices from organs
fileNames <- list.files(paste0(rootDir, "/droplet/") )
organ <- gsub("\\-.*", "", fileNames)
data_byOrgan <- list()
for(i in 1:length(fileNames)){
  print(fileNames[i])
  name <- unlist( lapply( strsplit(fileNames[i] , "-") , `[`, 2))
  data_byOrgan[[i]] <- readMM(paste0(dir, fileNames[i] , "/matrix.mtx") )
  columns <- read.csv(paste0(dir, fileNames[i] , "/barcodes.tsv") , header = F )
  columns <-  unlist( lapply( strsplit( columns$V1 , "-") , `[`, 1))
  columns <- paste0(  name ,  "_" ,  columns )
  rows <-  read.csv(paste0(dir, fileNames[i] , "/genes.tsv" ), sep = "\t", header = F)
  dimnames( data_byOrgan[[i]]) = list(rows$V1, columns)

}

names(data_byOrgan) <- organ
rownames_total <- rownames(data_byOrgan[[1]])
cat("All rownames are the same")
sum(!unlist(lapply(data_byOrgan, function(x)identical(rownames(x), rownames_total)))) == 0
###Combine the dataset
data_comb <- do.call(cbind, data_byOrgan)
colnames(data_comb) <- unlist(lapply(data_byOrgan, colnames))


##Read annotations
anno <- read.csv(paste0(rootDir,"/annotations_droplet.csv"), row.names = 1)
# "Cell Type information"
table(anno$cell_ontology_class)
##Only keep the cells that have annotation information
sum(!rownames(anno)%in%colnames(data_comb))
data_comb_filter <- data_comb[, which( colnames( data_comb) %in% rownames(anno) )]
data_comb_filter <- data_comb_filter[, anno$cell_ontology_class != "unknown"]
anno <- anno[anno$cell_ontology_class != "unknown",]
dim(data_comb_filter)

# store in seurat object
count <- CreateSeuratObject(counts =  data_comb_filter,  project = "TabulaMuris", min.cells = 0, min.features = 0)

# filter the low quality cells , nFeatures is the number of expressed genes
remove <- which(  count$nFeature_RNA/ dim( count)[1]  < 0.01)
if (length(remove) > 0 ){
  count <- count [, -c(remove)]
}

# normalise
count <- NormalizeData( count , normalization.method = "LogNormalize",  scale.factor = 1e6)


saveRDS(count, "tabulaMuris_10x.rds")



