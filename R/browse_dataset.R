#' Additional details on 35 datasets
#'
#' This shows the additional details for the 35 datasets in the \pkg{SimBenchData} package.
#'
#' @details
#' This package contains a total of 35 curated datasets, covering a range of sequencing protocols, tissues types (including different cell lines) and from both mouse and human.
#'
#'
#' @return
#' A \linkS4class{DataFrame}, containing the following fields
#' \itemize{
#' \item \code{ExperimentHub ID}, accession ID.
#' \item \code{Name}, short name of this data.
#' \item \code{Species}, whether human or mouse.
#' \item \code{Protocol}, sequencing protocol.
#' \item \code{Number of cells}, number of cells.
#' \item \code{Mutiple cell types/conditions ?}, whether the dataset contains multiple cell types or conditions (eg, treated vs untreated).
#' }
#'
#' @author Yue Cao
#'
#' @examples
#' showAdditionalDetail
#'
#' @export
#' @importFrom S4Vectors DataFrame
#' @importFrom utils read.csv
showAdditionalDetail <- function() {
    path <- system.file("extdata", "additional_description.csv", package="SimBenchData")
    description <- data.frame( read.csv(path, stringsAsFactors=FALSE) )
  return (description)
}




#' Metadata of the 35 datasets
#'
#' This displays the metadata for all available datasets in the \pkg{SimBenchData} package.
#'
#' @details
#' This package contains a total of 35 curated datasets, covering a range of sequencing protocols, tissues types (including different cell lines) and from both mouse and human.
#'
#'
#' @return
#' A \linkS4class{DataFrame}, containing the following fields
#' \itemize{
#' \item \code{Name}, short name of this data.
#' \item \code{Description}, description of the data.
#' \item \code{BiocVersion}, the first Bioconductor version the resource was made available for.
#' \item \code{Genome}, Genome build.
#' \item \code{SourceType}, Format of original data.
#' \item \code{SourceUrl}, link of the original data.
#' \item \code{SourceVersion}, version of the original data.
#' \item \code{Species}, whether it is human or mouse.
#' \item \code{TaxonomyId}, taxonomy ID.
#' \item \code{Coordinate_1_based}, TRUE if data are 1-based.
#' \item \code{DataProvider}, organisation or company that provided the original data.
#' \item \code{Maintainer}, maintainer name and email.
#' \item \code{RDataClass}, R / Bioconductor class the data are stored in.
#' \item \code{DispatchClass}, whether Rda or Rds data.
#' \item \code{RDataPath}, the corresponding file in this package.
#' }
#'
#' @author Yue Cao
#'
#' @examples
#' showMetaData
#'
#' @export
#' @importFrom S4Vectors DataFrame
#' @importFrom utils read.csv
showMetaData <- function() {

  dataset_df <- NULL
  allfiles <- system.file("extdata", package="SimBenchData")
  allfiles <- list.files(allfiles)
  for (thisfile in allfiles[-1] ) {
    path <- system.file("extdata",thisfile, package="SimBenchData")
    temp <- read.csv(path, stringsAsFactors=FALSE)
    dataset_df <- rbind(dataset_df, temp)
  }
  colnames( dataset_df)[1] <- "Name"

  dataset_df$RDataPath <- gsub("scSimBenchmarkData", "SimBenchData", dataset_df$RDataPath )
  meta <- showAdditionalDetail()
  dataset_df$ExperimentHub_ID <- meta$ExperimentHub_ID
  return (dataset_df)
}






