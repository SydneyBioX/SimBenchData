
meta <- data.frame(
  Title =  "breast cell line" ,
  Description = "MDA-MB-231 cells cultured in glucose" ,
  BiocVersion="3.11",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE106202",
  SourceVersion = "GSE106202_FRUCTOSE_GLUCOSE_merge.DGE.txt.gz" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="University of Southampton, Faculty of Medicine",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Breast-cellline.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Breast-cellline.csv",    row.names=FALSE)
