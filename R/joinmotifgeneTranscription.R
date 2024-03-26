#' Join methylated base position and associated gene with transcript abundance data, start and end sites
#' @title Transcriptional Reponse
#' @param dfmethbasestartGene, A motif dataset with ipdRatio and nearest gene
#' @param dfTranscription, A transcriptional dataset with gene, and relative abundance of associated mRNA
#' @return The read file
#' @export
joinmotifgeneTranscription <- function(dfmethbasestartGene, dfTranscription) {
  #dfTranscription <- dfTranscription %>% rename("locusTag" = "Locus.Tag")
  dftranscriptionmethGene<- left_join(dfmethbasestartGene, dfTranscription, by = "locusTag")
  return(dftranscriptionmethGene)
}
