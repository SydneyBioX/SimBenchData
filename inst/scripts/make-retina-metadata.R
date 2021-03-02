
meta <- data.frame(
  Title =  "retina" ,
  Description = "Mouse retina" ,
  BiocVersion="3.11",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1626793",
  SourceVersion = "GSM1626793_P14Retina_1.digital_expression.txt.gz" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Harvard Medical School, Genetics",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Mouse_retina.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Mouse-retina.csv",    row.names=FALSE)
