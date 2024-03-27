#' @description Join methylation motifs and associated gene with transcript abundance data
#' @title joinmotifgeneTranscription
#' @param dfmethbasestartGene, A methylation motif dataframe with ipdRatio and nearest gene
#' @param dfTranscription, A transcriptional dataframe with gene, and relative abundance of associated mRNA
#' @return A dataframe of methylation motifs with each associated gene's transcriptional data
#' @importFrom dplyr 'left_join'
#' @export
joinmotifgeneTranscription <- function(dfmethbasestartGene, dfTranscription) {
  dftranscriptionmethGene<- left_join(dfmethbasestartGene, dfTranscription, by = "locusTag")
  return(dftranscriptionmethGene)
}
