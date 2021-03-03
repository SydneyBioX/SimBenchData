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
#' \item \code{Name}, short name of this data.
#' \item \code{Description}, description of the data.
#' \item \code{Species}, whether it is human or mouse.
#' \item \code{SourceUrl}, where the data was originally obtained from.
#' \item \code{RDataPath}, the corresponding rds file in this package.
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

  dataset_df <- NULL
  allfiles <- system.file("extdata", package="scSimBenchmarkData")
  allfiles <- list.files(allfiles)
  for (thisfile in allfiles ) {
    path <- system.file("extdata",thisfile, package="scSimBenchmarkData")
    temp <- read.csv(path, stringsAsFactors=FALSE)
    dataset_df <- rbind(dataset_df, temp)
  }
  dataset_df <-     dataset_df[, c("Title" ,  "Description" ,  "Species" , "SourceUrl",    "RDataPath"         ) ]
  colnames( dataset_df)[1] <- "Name"

  return (dataset_df)
}
