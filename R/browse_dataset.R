#' Show all 35 datasets
#'
#' This shows all the 35 Summary information for all available datasets in the \pkg{scSimBenchmarkData} package.
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
#' showAllData
#'
#' @export
#' @importFrom S4Vectors DataFrame
#' @importFrom utils read.csv
showAllData <- function() {


    path <- system.file("extdata", "additional_description.csv", package="SimBenchData")
    description <- data.frame( read.csv(path, stringsAsFactors=FALSE) )


  return (description)
}
