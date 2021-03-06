% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/browse_dataset.R
\name{showMetaData}
\alias{showMetaData}
\title{Metadata of the 35 datasets}
\usage{
showMetaData()
}
\value{
A \linkS4class{DataFrame}, containing the following fields
\itemize{
\item \code{Name}, short name of this data.
\item \code{Description}, description of the data.
\item \code{BiocVersion}, the first Bioconductor version the resource was
made available for.
\item \code{Genome}, Genome build.
\item \code{SourceType}, Format of original data.
\item \code{SourceUrl}, link of the original data.
\item \code{SourceVersion}, version of the original data.
\item \code{Species}, whether it is human or mouse.
\item \code{TaxonomyId}, taxonomy ID.
\item \code{Coordinate_1_based}, TRUE if data are 1-based.
\item \code{DataProvider}, organisation or company that provided the
original data.
\item \code{Maintainer}, maintainer name and email.
\item \code{RDataClass}, R / Bioconductor class the data are stored in.
\item \code{DispatchClass}, whether Rda or Rds data.
\item \code{RDataPath}, the corresponding file in this package.
}
}
\description{
This displays the metadata for all available datasets in the
\pkg{SimBenchData} package.
}
\details{
This package contains a total of 35 curated datasets, covering a range of
sequencing protocols, tissues types (including different cell lines) and
from both mouse and human.
}
\examples{
showMetaData

}
\author{
Yue Cao
}
