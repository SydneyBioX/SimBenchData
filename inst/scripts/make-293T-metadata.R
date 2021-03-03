
meta <- data.frame(
  Title =  "293T cell line" ,
  Description = "293T cell line" ,
  BiocVersion="3.13",
  Genome="hg19",
  SourceType = "tar.gz",
  SourceUrl = "https://support.10xgenomics.com/single-cell-gene-expression/datasets/1.1.0/293t",
  SourceVersion = "293t_filtered_gene_bc_matrices.tar.gz" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="10x genomics",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/293t_cellline.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-293t-cellline.csv",    row.names=FALSE)
