test_that("sqldf mapping works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Motif.rda")
  load("tests/testthat/data/IPD.rda")
  #dfIPD <- dfIPD[1:40000,]
  load("tests/testthat/data/CDS.rda")
  load("tests/testthat/data/TFBS.rda")
  #dfTFBS <- dfTFBS[1:5000,]
  motifIPD <- methylMapR::joinmotifIPD(IPD,Motif)
  motifGene <- methylMapR::joinmotifGene(CDS,motifIPD)
  motifgeneFactor <- methylMapR::joinmotifgeneFactor(motifGene, TFBS, 10)
  expect_true(all(motifgeneFactor$numberTFBS > 0))
  rm(motifGene)
  rm(Motif)
  rm(IPD)
  rm(CDS)
  rm(motifIPD)
  rm(motifgeneFactor)
})

