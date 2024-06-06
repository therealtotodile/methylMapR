test_that("rbind works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Motif.rda")
  load("tests/testthat/data/IPD.rda")
  #dfIPD <- dfIPD[1:40000,]
  load("tests/testthat/data/CDS.rda")
  motifIPD <- methylMapR::joinmotifIPD(IPD,Motif)
  motifGene <- methylMapR::joinmotifGene(CDS,motifIPD)
  expect_equal(nrow(motifGene), nrow(motifIPD),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
  expect_is(motifGene$promoterregionMotif, "numeric")
  rm(motifGene)
  rm(Motif)
  rm(IPD)
  rm(CDS)
  rm(motifIPD)
})


#ok i think i know now! for functions that call other functions , i need to put everything in the test! like the raw data, combine it, then create new frame
#dfIPD <- dfIPD[1:40000,]
