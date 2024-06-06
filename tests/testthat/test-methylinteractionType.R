test_that("check if the interaction call is working", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Motif.rda")
  load("tests/testthat/data/IPD.rda")
  #IPD <- IPD[1:40000,]
  load("tests/testthat/data/CDS.rda")
  load("tests/testthat/data/TFBS.rda")
  #TFBS <- TFBS[1:5000,]
  motifIPD <- methylMapR::joinmotifIPD(IPD,Motif)
  motifGene <- methylMapR::joinmotifGene(CDS,motifIPD)
  motifgeneFactor <- methylMapR::joinmotifgeneFactor(motifGene, TFBS, 10)
  methylinteractionType <- methylMapR::methylinteractionType(motifgeneFactor, 10, 100)
  expect_is(methylinteractionType$interactiontypeMeth, "character")
  column_data <- methylinteractionType$interactiontypeMeth
  num_unique <- length(unique(column_data))
  expect_true(num_unique == 2 || num_unique == 3,
              info = "The number of unique strings in the column should be either 2 or 3")
  rm(motifGene)
  rm(Motif)
  rm(IPD)
  rm(CDS)
  rm(motifIPD)
  rm(motifgeneFactor)
  rm(methylinteractionType)
})
