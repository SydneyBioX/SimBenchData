
meta <- data.frame(
  Title =  "Jurkat and 293T" ,
  Description = "mixture of Jurkat (human T lymphocyte)  and 293T" ,
  BiocVersion="3.11",
  Genome="hg19",
  SourceType = "tar.gz",
  SourceUrl = "https://support.10xgenomics.com/single-cell-gene-expression/datasets/1.1.0/jurkat",
  SourceVersion = "jurkat_filtered_gene_bc_matrices.tar.gz" ,
  Species = "Homo sapiens",
  TaxonomyId=9606,
  Coordinate_1_based="NA",
  DataProvider="10x genomics",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/293t_jurkat.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-293t_jurkat.csv",    row.names=FALSE)
