#' Load in CDS data
#' @title Read CDS
#' @param cdsData A sequencing dataset that contains the coding region start and end sites annotated onto the genome (.tsv)
#' @return The read file
#' @export
dfCDS <- function(cdsData) {
  cdsMap <- read.table(cdsData, sep = '\t', header = TRUE, fill = TRUE)
  return(cdsMap)
}
