#' @description Assign methylation -- TF interaction type, by comparing ipdRatio and scoreTFBS (peak height), can only be called for methylated sites. Based on https://pubmed.ncbi.nlm.nih.gov/31755929/
#' @title methylinteractionType
#' @param tfactormethGene A TFBS and methylation motif dataset
#' @param qualityScore A quality score cutoff for how certain we are about the presence of kinetic deviation. 10 is equivalent to 90 percent certainty, 20 is 99.9 percent and so on
#' @param peakHeight A peak height cutoff for how certain we are about TF binding. This will be variable depending on the type of TF binding data used
#' @return A column that has the methyl interaction type call (character)
#' @export
methylinteractionType <- function(tfactormethGene, qualityScore, peakHeight){
  tfactormethGene$interactiontypeMeth <- ifelse(tfactormethGene$scorekineticDeviation > qualityScore & tfactormethGene$peakHeight < peakHeight, "repressive",
                                                ifelse(tfactormethGene$scorekineticDeviation > qualityScore & tfactormethGene$peakHeight > peakHeight, "promoting_notaffective", "not_methylated"))
  return(tfactormethGene)
}
