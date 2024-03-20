#' Load in PacBio methylation data, modifications.csv
#' @title Read IPD csv file
#' @param ipd_data A sequencing kinetics dataset from PacBio SMRT Sequencing kineticsTools pkg, contains base call and ipdRatio (.csv)
#' @return The read file
#' @export
dfIPD <- function(ipdData) {
  methylMap <- read.csv(ipdData)
  return(methylMap)
}
