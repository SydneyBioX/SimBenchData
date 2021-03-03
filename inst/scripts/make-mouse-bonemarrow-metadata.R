
meta <- data.frame(
  Title =  "Mouse bone marrow" ,
  Description = "Bone marrow myeloid progenitors" ,
  BiocVersion="3.13",
  Genome="mm9",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE72857",
  SourceVersion = "GSE72857_umitab.txt.gz" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Weizmann Institute of Science, Immunology",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Mouse_bonemarrow.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Mouse-bonemarrow.csv",    row.names=FALSE)
