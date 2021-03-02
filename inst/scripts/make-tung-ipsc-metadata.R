
meta <- data.frame(
  Title =  "Tung ipsc" ,
  Description = "Three iPSC (Induced Pluripotent Stem Cells) lines" ,
  BiocVersion="3.11",
  Genome="hg19",
  SourceType = "TXT",
  SourceUrl = "https://github.com/jdblischak/singleCellSeq",
  SourceVersion = "Tung_DECENT_human_iPSC_raw_filtered.txt" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="University of Chicago, Human Genetics",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Tung_ipsc.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Tung-ipsc.csv",    row.names=FALSE)
