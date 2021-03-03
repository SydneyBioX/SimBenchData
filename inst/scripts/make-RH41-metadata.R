
meta <- data.frame(
  Title =  "RH41 cellline" ,
  Description = "Rh41(human alveolar rhabdomyosarcoma) cell line" ,
  BiocVersion="3.13",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE113660",
  SourceVersion = "GSE113660_RAW.tar" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="St. Jude Children's Research Hospital",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/RH41_cellline.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-RH41-cellline.csv",    row.names=FALSE)
