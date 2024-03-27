#' @description Load in PacBio methylation data, modifications.csv
#' @title dfIPD
#' @param ipdData A sequencing kinetics dataset from PacBio SMRT Sequencing kineticsTools pkg, contains base call and ipdRatio (.csv)
#' @return A dataframe of the genome, that includes the called base and ipdRatio at every base
#' @export
dfIPD <- function(ipdData) {
  methylMap <- read.csv(ipdData)
  return(methylMap)
}
