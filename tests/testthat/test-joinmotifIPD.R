test_that("rbind works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  Motif <- load("data/dfMotif.rda")
  IPD <- load("data/dfIPD.rda")
  dfIPD <- dfIPD[1:40000,]
  dfmotifIPD <- methylMapR::joinmotifIPD(dfIPD,dfMotif)
  expect_equal(nrow(dfmotifIPD), nrow(dfMotif),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
  rm(dfMotif)
  rm(dfIPD)
  rm(dfmotifIPD)
})
