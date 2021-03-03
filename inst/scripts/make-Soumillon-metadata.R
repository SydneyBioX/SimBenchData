
meta <- data.frame(
  Title =  "Soumillon" ,
  Description = "differentiating cells of human adipose-derived stem/stromal cells" ,
  BiocVersion="3.13",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53638",
  SourceVersion = "GSE53638_D3_UMI.dat.gz" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="Harvard University, HSCRB",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Soumillon_adipose.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Soumillon-adipose.csv",    row.names=FALSE)
