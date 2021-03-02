
meta <- data.frame(
  Title =  "BC02 lymph" ,
  Description = "Lymph node of breast cancer patient ID BC02" ,
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
  RDataPath = "scSimBenchmarkData/BC02_lymph.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-BC02-lymph.csv",    row.names=FALSE)
