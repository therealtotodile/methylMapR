#' Load in PacBio motif data, motifs.gff
#' @title Read motif gff file
#' @param motifData A sequencing kinetics dataset that contains only detected motif positions (.gff)
#' @return The read file
#' @export
dfMotif <- function(motifData) {
  motifMap <- read.gff(motifData)
  return(motifMap)
}
