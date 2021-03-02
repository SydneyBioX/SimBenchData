
### =========================================================================
### Stem cell
### =========================================================================

download.file( "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE75nnn/GSE75748/suppl/GSE75748_sc_time_course_ec.csv.gz",
               "GSE75748_sc_time_course_ec.csv.gz")

Rootdir <- getwd()
timecourse <- fread(paste0( Rootdir , "/GSE75748_sc_time_course_ec.csv.gz"))
timecourse  <- as.data.frame(timecourse )

rownames( timecourse ) <-  timecourse$V1

timecourse <- timecourse[ , -1]
timepoint <- unlist(  lapply ( strsplit ( colnames( timecourse ) , "\\." ) , `[`, 2))
timepoint <- unlist(  lapply ( strsplit (  timepoint, "_" ) , `[`, 1))


timecourse  <- CreateSeuratObject(counts =  timecourse , project = "liver",
                                  min.cells = 0, min.features = 0)


remove <- which( timecourse$nFeature_RNA/ dim(timecourse  )[1]  < 0.01)
if (length(remove) > 0 ){
  timecourse  <- timecourse [, -c(remove)]
}

timecourse <- NormalizeData(  timecourse , normalization.method = "LogNormalize",
                              scale.factor = 1e6)

timecourse$technology <- "fluidigm c1, smarter"
timecourse$species <- "Human"
timecourse$tissue <-  "pluripotent stem cell"
timecourse$celltype <-  timepoint

saveRDS(timecourse, paste0("GSE75748_human_stemcell_cpm.rds") )

