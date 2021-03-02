
meta <- data.frame(
  Title =  "Yang liver" ,
  Description = "Liver cells of E10.5 to E17.5 mouse embryos" ,
  BiocVersion="3.11",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE90047",
  SourceVersion = "GSE90047_Single-cell_RNA-seq_Read_Count.txt.gz" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Peking University",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Yang_mouse_liver.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Yang-mouse-liver.csv",    row.names=FALSE)
