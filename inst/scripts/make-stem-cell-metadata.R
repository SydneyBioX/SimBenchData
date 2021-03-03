
meta <- data.frame(
  Title =  "stem cell" ,
  Description = "Human pluripotent stem cells (hPSCs)" ,
  BiocVersion="3.13",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE75748",
  SourceVersion = "GSE75748_sc_time_course_ec.csv.gz" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="Morgridge Institute for Research",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Stemcell-timecourse.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Stemcell-timecourse.csv",    row.names=FALSE)
