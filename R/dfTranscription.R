#' @description Load in transcriptomics data, .csv
#' @title dfTranscription
#' @param transcriptionData A transcriptional dataset that contains the transcript, and relative abundance (.csv)
#' @param locusTag A string that contains the first portion of the locus tag that is shared by all tags. It is used for searching for the locus tag column -- example: "KPHS" or "b0" or "PA"
#' @return A dataframe of transcripts and abundance
#' @export
dfTranscription <- function(transcriptionData, locusTag) {
  transcriptionMap <- read.csv(transcriptionData)
  inds <- which(apply(transcriptionMap, 2, function(x) any(grepl(paste0("^", locusTag, "[[:digit:]]+$"), x))))
  colnames(transcriptionMap)[inds] = "locusTag"
  return(transcriptionMap)
}
