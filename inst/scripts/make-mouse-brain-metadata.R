
meta <- data.frame(
  Title =  "Mouse brain" ,
  Description = "cortex of mice" ,
  BiocVersion="3.13",
  Genome="NA",
  SourceType = "TXT",
  SourceUrl = "https://storage.googleapis.com/linnarsson-lab-www-blobs/blobs/cortex/expression_mRNA_17-Aug-2014.txt",
  SourceVersion = "expression_mRNA_17-Aug-2014.txt" ,
  Species = "Mus musculus",
  TaxonomyId="10090",
  Coordinate_1_based="NA",
  DataProvider="Karolinska Institutet, Medical Biochemistry and Biophysics",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/Mouse_brain.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-Mouse-brain.csv", row.names=FALSE)
