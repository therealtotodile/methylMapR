#' @description Join methylated base position and associated gene with TFBS (chipSeq) data binding site
#' @title joinmotifgeneFactor
#' @param dfmethbasestartGene A motif dataset with ipdRatio and nearest gene
#' @param dfTFBS A CHIP seq/exo dataset with peak and position information
#' @param motifTFBSWindow An integer number that represents the total length of a window that surrounds the chip peak position (peakCenteR). Distance cutoff for motif interaction with a TFBS.
#' @return A dataframe of combined methylation and TF binding data
#' @importFrom dplyr 'rename' '%>%' 'mutate'
#' @importFrom tibble 'as_tibble'
#' @importFrom sqldf 'sqldf'
#' @export
joinmotifgeneFactor <- function(dfmethbasestartGene, dfTFBS, motifTFBSWindow) {
  if("strand" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% rename(strandTFBS = strand)
  }
  if("score" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% rename(peakHeight = score)
  }
  if("pileup" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% rename(peakHeight = pileup)
  }
  if("attributes" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% rename(peakWidth_stdev = attributes)
  }
  if("peakWidth_stdev" %in% colnames(dfTFBS)){
    dfTFBS$peakWidth_stdev <- gsub("[^0-9.-]", "", dfTFBS$peakWidth_stdev)
  }
  dfmethbasestartGene <- dfmethbasestartGene %>% rename(strandMotif = strand)
  if("strandTFBS" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% mutate(strandTFBS=recode(strandTFBS, '-'='0', '+'='1'))
  }
  if("Start" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% rename(start = Start)
  }
  if("End" %in% colnames(dfTFBS)){
    dfTFBS <- dfTFBS %>% rename(end = End)
  }
  dfTFBS$peakCenter <- (dfTFBS$start + dfTFBS$end)/2
  dfTFBS$startWindow <- dfTFBS$peakCenter - motifTFBSWindow/2
  dfTFBS$endWindow <- dfTFBS$peakCenter + motifTFBSWindow/2
  if ("strandTFBS" %in% colnames(dfTFBS)) {
    # Run this if the column exists
    dftfactormethGene <- as_tibble(sqldf("select dfmethbasestartGene.type, dfmethbasestartGene.scorekineticDeviation, dfmethbasestartGene.locusTag, dfmethbasestartGene.ipdRatio, dfmethbasestartGene.base, dfmethbasestartGene.strandMotif, dfmethbasestartGene.methylatedPosition, dfTFBS.peakHeight, dfTFBS.peakCenter, dfTFBS.strandTFBS from dfmethbasestartGene
                join dfTFBS on dfmethbasestartGene.methylatedPosition >= dfTFBS.startWindow and
                          dfmethbasestartGene.methylatedPosition <= dfTFBS.endWindow"))
  } else {
    # Run this if the column does not exist
    dftfactormethGene <- as_tibble(sqldf("select dfmethbasestartGene.type, dfmethbasestartGene.scorekineticDeviation, dfmethbasestartGene.locusTag, dfmethbasestartGene.ipdRatio, dfmethbasestartGene.base, dfmethbasestartGene.strandMotif, dfmethbasestartGene.methylatedPosition, dfTFBS.peakHeight, dfTFBS.peakCenter from dfmethbasestartGene
                join dfTFBS on dfmethbasestartGene.methylatedPosition >= dfTFBS.startWindow and
                          dfmethbasestartGene.methylatedPosition <= dfTFBS.endWindow"))
  }
  dftfactormethGene$distanceTFBS <- dftfactormethGene$methylatedPosition - dftfactormethGene$peakCenter
  dftfactormethGene$numberTFBS <- as.numeric(ave(as.character(dftfactormethGene$methylatedPosition), as.character(dftfactormethGene$methylatedPosition), FUN = length))
  return(dftfactormethGene)
}
