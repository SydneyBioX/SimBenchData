
meta <- data.frame(
  Title =  "BC01 blood" ,
  Description = "PBMC of breast cancer patient ID BC01" ,
  BiocVersion="3.13",
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
  RDataPath = "scSimBenchmarkData/BC01_blood.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-BC01-blood.csv",    row.names=FALSE)
