test_that("sqldf mapping works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  Motif <- load("data/dfMotif.rda")
  IPD <- load("data/dfIPD.rda")
  dfIPD <- dfIPD[1:40000,]
  CDS <- load("data/dfCDS.rda")
  TFBS <- load("data/dfTFBS.rda")
  dfTFBS <- dfTFBS[1:5000,]
  dfmotifIPD <- methylMapR::joinmotifIPD(dfIPD,dfMotif)
  dfmotifGene <- methylMapR::joinmotifGene(dfCDS,dfmotifIPD)
  dfmotifgeneFactor <- methylMapR::joinmotifgeneFactor(dfmotifGene, dfTFBS, 10)
  expect_true(all(dfmotifgeneFactor$numberTFBS > 0))
  rm(dfmotifGene)
  rm(dfMotif)
  rm(dfIPD)
  rm(dfCDS)
  rm(dfmotifIPD)
  rm(dfmotifgeneFactor)
})

