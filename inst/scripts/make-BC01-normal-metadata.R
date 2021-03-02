
meta <- data.frame(
  Title =  "BC01 normal" ,
  Description = "Normal breast tissue of patient ID BC01" ,
  BiocVersion="3.11",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE114725",
  SourceVersion = "GSE114725_RAW.tar" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="Memorial Sloan Kettering Cancer Center,	Computational and Systems Biology Program, SKI",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/BC01_normal.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-BC01-normal.csv",    row.names=FALSE)
