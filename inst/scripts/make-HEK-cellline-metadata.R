
meta <- data.frame(
  Title =  "HEK cellline" ,
  Description = "human HEK293 (embryonic kidney cells)  cell line" ,
  BiocVersion="3.11",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE92495",
  SourceVersion = "GSE92495_RAW.tar" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="Massachusetts Institute of Technology, Chemistry",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/HEK_cellline.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-HEK-cellline.csv",    row.names=FALSE)
