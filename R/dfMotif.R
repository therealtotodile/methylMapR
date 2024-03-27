#' @description Load in PacBio motif data, motifs.gff
#' @title dfMotif
#' @param motifData A sequencing kinetics dataset that contains the kineticstools detected motif positions (.gff)
#' @return A dataframe of methylation motifs
#' @importFrom ape 'read.gff'
#' @export
dfMotif <- function(motifData) {
  motifMap <- read.gff(motifData)
  return(motifMap)
}
