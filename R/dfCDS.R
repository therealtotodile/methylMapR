#' @description Load in CDS data, .tsv
#' @title dfCDS
#' @param cdsData A sequencing dataset that contains the coding region start and end sites and predicted gene (.tsv)
#' @return A dataframe of coding region genes
#' @export
dfCDS <- function(cdsData) {
  cdsMap <- read.table(cdsData, sep = '\t', header = TRUE, fill = TRUE)
  return(cdsMap)
}
