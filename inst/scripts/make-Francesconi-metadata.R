
meta <- data.frame(
  Title =  "Francesconi" ,
  Description = "B cell precursors from bone marrow, induced to either trans-differentiate to macrophages or to reprogram into iPSCs" ,
  BiocVersion="3.11",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE112004",
  SourceVersion = "GSE112004_counts.030U.tsv.gz" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Centro Nacional de Análisis Genómico,	Development",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Francesconi-ipsc.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Francesconi-ipsc.csv",    row.names=FALSE)
