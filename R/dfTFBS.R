#' @description Load in ChIPSeq data, .csv or .gff
#' @title dfTFBS
#' @param chipseqData A ChIPSeq dataset that contains the regulator (TF), peak position, and score (.gff or .csv)
#' @return A dataframe of the TF binding data
#' @importFrom dplyr 'rename' '%>%'
#' @export
dfTFBS <- function(chipseqData) {
  ifelse(grepl('.csv$', chipseqData), tfbsMap <- read.csv(chipseqData),tfbsMap <- read.gff(chipseqData))
  if("ChIP.seq.Fold.Enrichment" %in% colnames(tfbsMap)){
    tfbsMap <- tfbsMap %>% rename(peakHeight = ChIP.seq.Fold.Enrichment)
  }
  return(tfbsMap)
}
