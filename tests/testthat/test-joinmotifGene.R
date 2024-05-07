test_that("rbind works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  Motif <- load("data/dfMotif.rda")
  IPD <- load("data/dfIPD.rda")
  dfIPD <- dfIPD[1:40000,]
  CDS <- load("data/dfCDS.rda")
  dfmotifIPD <- methylMapR::joinmotifIPD(dfIPD,dfMotif)
  dfmotifGene <- methylMapR::joinmotifGene(dfCDS,dfmotifIPD)
  expect_equal(nrow(dfmotifGene), nrow(dfmotifIPD),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
  expect_is(dfmotifGene$promoterregionMotif, "numeric")
  rm(dfmotifGene)
  rm(dfMotif)
  rm(dfIPD)
  rm(dfCDS)
  rm(dfmotifIPD)
})


#ok i think i know now! for functions that call other functions , i need to put everything in the test! like the raw data, combine it, then create new frame
#dfIPD <- dfIPD[1:40000,]
