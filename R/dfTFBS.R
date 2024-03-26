#' Load in ChipSeq data
#' @title Read ChipSeq data
#' @param chipseqData A chipSeq dataset that contains the regulator (TF), peak position, and score (.gff)
#' @return The read file
#' @export
dfTFBS <- function(chipseqData) {
  ifelse(grepl('.csv$', chipseqData), tfbsMap <- read.csv(chipseqData),tfbsMap <- read.gff(chipseqData))
  if("ChIP.seq.Fold.Enrichment" %in% colnames(tfbsMap)){
    tfbsMap <- tfbsMap %>% rename(peakHeight = ChIP.seq.Fold.Enrichment)
  }
  return(tfbsMap)
}
