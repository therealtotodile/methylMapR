#' Join motifs with ipdRatio call using position, strand
#' @title Create nearest CDS column
#' @param dfmotifIPD, A df with ipdRatio data by position
#' @param dfCDS, A df with CDS name, start site, and end site
#' @return The read file
#' @export
joinmotifGene <- function(dfCDS, dfmotifIPD){
  dfCDS <- dfCDS %>% mutate(Orientation=recode(Orientation, 'minus'='0', 'plus'='1'))
  dfCDS <- dfCDS %>% rename(strand = Orientation)
  #split in two by strand
  dfCDS_0 <- dfCDS[dfCDS$strand == 0,]
  dfCDS_1 <- dfCDS[dfCDS$strand == 1,]
  dfmotifIPD_0 <- dfmotifIPD[dfmotifIPD$strand == 0,]
  dfmotifIPD_1 <- dfmotifIPD[dfmotifIPD$strand == 1,]
  #process each
  inds <- sapply(dfmotifIPD_0$start, function(x) which.min(abs(x - dfCDS_0$Begin)))
  x1 <- transform(dfmotifIPD_0, startCDS = dfCDS_0$Begin[inds],
                  distanceCDS = start - dfCDS_0$Begin[inds],
                  endCDS = dfCDS_0$End[inds],
                  nearestCDS = dfCDS_0$Symbol[inds],
                  locusTag = dfCDS_0$Locus.tag[inds],
                  predictedGene = dfCDS_1$Name[inds])
  #next one
  inds <- sapply(dfmotifIPD_1$start, function(x) which.min(abs(x - dfCDS_1$Begin)))
  x2 <- transform(dfmotifIPD_1, startCDS = dfCDS_1$Begin[inds],
                  distanceCDS = start - dfCDS_1$Begin[inds],
                  endCDS = dfCDS_1$End[inds],
                  nearestCDS = dfCDS_1$Symbol[inds],
                  locusTag = dfCDS_1$Locus.tag[inds],
                  predictedGene = dfCDS_1$Name[inds])
  #combine strand dfs
  dfmethbasestartGene <- rbind(x1, x2)
  dfmethbasestartGene$promoterregionMotif <- ifelse(dfmethbasestartGene$distanceCDS > -35 & dfmethbasestartGene$distanceCDS <= -1, 1, 0)
  return(dfmethbasestartGene)
}
