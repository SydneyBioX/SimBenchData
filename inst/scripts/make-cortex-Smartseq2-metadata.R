
meta <- data.frame(
  Title =  "Neural Smart-seq2" ,
  Description = "Smart-seq2 subset of the set of four protocols sequenced on mouse cortex" ,
  BiocVersion="3.13",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://singlecell.broadinstitute.org/single_cell/study/SCP425/single-cell-comparison-cortex-data#study-download",
  SourceVersion = "count.reads.txt.gz" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="Broad Institute of MIT & Harvard, Cambridge, MA USA",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Neural_Smartseq2.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Neural-Smartseq2.csv",    row.names=FALSE)
