test_that("rbind works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Motif.rda")
  load("tests/testthat/data/IPD.rda")
  #IPD <- IPD[1:40000,]
  motifIPD <- methylMapR::joinmotifIPD(IPD,Motif)
  expect_equal(nrow(motifIPD), nrow(Motif),
               info = "The number of rows in the result should be the sum of rows in Motif")
  rm(Motif)
  rm(IPD)
  rm(motifIPD)
})
