
meta <- data.frame(
  Title =  "BC09 tumor" ,
  Description = "Tumor of breast cancer patient ID BC09" ,
  BiocVersion="3.11",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE114724",
  SourceVersion = "GSE114724_RAW.tar" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="Memorial Sloan Kettering Cancer Center, Computational and Systems Biology Program, SKI",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/BC09_tumor.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-BC09-tumor.csv",   row.names=FALSE)
