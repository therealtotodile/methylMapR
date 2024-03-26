#' Assign methylation -- TF interaction type, by comparing ipdRatio and scoreTFBS (peak height), can only be called for methylated sites. Based on https://pubmed.ncbi.nlm.nih.gov/31755929/
#' @title methylation -- TF Interaction Type
#' @param tfactormethGene, A TFBS and methylation motif dataset
#' @param qualityScore, A quality score cutoff for how certain we are about the presence of kinetic deviation. 10 is equivalent to 90% certainty, 20 is 99.9% and so on.
#' @param peakHeight, A peak height cutoff for how certain we are about TF binding. 10 is equivalent to 90% certainty, 20 is 99.9% and so on.
#' @return The read file
#' @export
methylinteractionType <- function(tfactormethGene, qualityScore, peakHeight){
  tfactormethGene$interactiontypeMeth <- ifelse(tfactormethGene$scorekineticDeviation > qualityScore & tfactormethGene$peakHeight < peakHeight, "repressive",
                                                ifelse(tfactormethGene$scorekineticDeviation > qualityScore & tfactormethGene$peakHeight > peakHeight, "promoting_notaffective", "not_methylated"))
  return(tfactormethGene)
}
e <- methylinteractionType(f, 10, 150)