#' Load in transcriptomics data
#' @title Read transcriptional data
#' @param transcriptionData A transcriptional dataset that contains the transcript, and relative abundance (.csv)
#' @return The read file
#' @export
dfTranscription <- function(transcriptionData) {
  transcriptionMap <- read.csv(transcriptionData)
  #need to add if Gene column exists, that becomes locus tag
  inds <- which(apply(transcriptionMap, 2, function(x) any(grepl("^b0|^KPHS|^PA[[:digit:]]+$", x))))
  colnames(transcriptionMap)[inds] = "locusTag"
  return(transcriptionMap)
}
