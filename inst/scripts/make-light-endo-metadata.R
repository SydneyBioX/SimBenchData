
meta <- data.frame(
  Title =  "light exposure endothelial" ,
  Description = "Endothelial smooth muscle of primary visual cortex from mice, exposed to light for 0h, 1h and 4h" ,
  BiocVersion="3.13",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE102827",
  SourceVersion = "GSE102827_merged_all_raw.csv.gz" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Harvard Medical School, Department of Neurobiology",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Lightexposure_endothelial.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Lightexposure-endothelial.csv",    row.names=FALSE)
