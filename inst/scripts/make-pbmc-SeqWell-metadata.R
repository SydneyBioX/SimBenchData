
meta <- data.frame(
  Title =  "pbmc Seq-Well" ,
  Description = "Seq-Well subset of the set of six protocols sequenced on human PBMC" ,
  BiocVersion="3.13",
  Genome="hg19",
  SourceType = "Zip",
  SourceUrl = "https://singlecell.broadinstitute.org/single_cell/study/SCP424/single-cell-comparison-pbmc-data#study-download",
  SourceVersion = "count.reads.txt.gz" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="Broad Institute of MIT & Harvard, Cambridge, MA USA",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/PBMC_seqwell.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-PBMC-seqwell.csv",    row.names=FALSE)
