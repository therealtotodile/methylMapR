#' Join motifs with ipdRatio call using position, strand
#' @title Create data frame of motifs with associated ipdRatio data
#' @param dfIPD, A df (data frame) with ipdRatio data by position
#' @param dfMotif, A df where each row is an identified methylation motif
#' @return The read file
#' @export
joinmotifIPD <- function(dfIPD, dfMotif){
  dfMotif <- dfMotif %>% mutate(strand=recode(strand, '-'='0', '+'='1'))
  dfMotif <- dfMotif %>% rename(scoreMotif = score)
  #split in two by strand
  dfIPD_0 <- dfIPD[dfIPD$strand == 0,]
  dfIPD_1 <- dfIPD[dfIPD$strand == 1,]
  dfMotif_0 <- dfMotif[dfMotif$strand == 0,]
  dfMotif_1 <- dfMotif[dfMotif$strand == 1,]
  #process each
  inds <- sapply(dfMotif_0$start, function(x) which.min(abs(x - dfIPD_0$tpl)))
  x1 <- transform(dfMotif_0, methylatedPosition = dfIPD_0$tpl[inds],
                  ipdRatio = dfIPD_0$ipdRatio[inds],
                  scorekineticDeviation = dfIPD_0$score[inds],
                  base = dfIPD_0$base[inds])
  inds <- sapply(dfMotif_1$start, function(x) which.min(abs(x - dfIPD_1$tpl)))
  x2 <- transform(dfMotif_1, methylatedPosition = dfIPD_1$tpl[inds],
                  ipdRatio = dfIPD_1$ipdRatio[inds],
                  scorekineticDeviation = dfIPD_1$score[inds],
                  base = dfIPD_1$base[inds])
  #combine strand dfs
  rbind(x1, x2)
}
