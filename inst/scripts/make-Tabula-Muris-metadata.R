
meta <- data.frame(
  Title =  "Tabula Muris" ,
  Description = "10x subset of Tabula Muris" ,
  BiocVersion="3.11",
  Genome="mm10",
  SourceType = "Zip",
  SourceUrl = "https://figshare.com/projects/Tabula_Muris_Transcriptomic_characterization_of_20_organs_and_tissues_from_Mus_musculus_at_single_cell_resolution/27733",
  SourceVersion = "droplet.zip" ,
  Species = "Mus musculus",
  TaxonomyId=10090,
  Coordinate_1_based="NA",
  DataProvider="The Tabula Muris Consortium",
  Maintainer="Yue Cao <yue.cao@sydney.edu.au>",
  RDataClass= "SeuratObject",
  DispatchClass="Rds",
  RDataPath = "scSimBenchmarkData/TabulaMuris_dropseq.rds" ,
  stringsAsFactors = FALSE
)

write.csv( meta,  file="../extdata/metadata-TabulaMuris-dropseq.csv",    row.names=FALSE)
