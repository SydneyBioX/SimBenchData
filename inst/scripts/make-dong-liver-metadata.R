
meta <- data.frame(
  Title =  "Dong liver" ,
  Description = "liver cells of E9.5 to E11.5 mouse embryos" ,
  BiocVersion="3.11",
  Genome="mm10",
  SourceType = "XLS/XLSX",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE87038",
  SourceVersion = "GSE87038_Mouse_Organogenesis_UMI_counts_matrix.xlsx" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Peking University",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Dong_mouse_liver.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Dong-mouse-liver.csv",    row.names=FALSE)
