test_that("check if the interaction call is working", {
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
  dfmethylinteractionType <- methylMapR::methylinteractionType(dfmotifgeneFactor, 10, 100)
  expect_is(dfmethylinteractionType$interactiontypeMeth, "character")
  column_data <- dfmethylinteractionType$interactiontypeMeth
  num_unique <- length(unique(column_data))
  expect_true(num_unique == 2 || num_unique == 3,
              info = "The number of unique strings in the column should be either 2 or 3")
  rm(dfmotifGene)
  rm(dfMotif)
  rm(dfIPD)
  rm(dfCDS)
  rm(dfmotifIPD)
  rm(dfmotifgeneFactor)
  rm(dfmethylinteractionType)
})
