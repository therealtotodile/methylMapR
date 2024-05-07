test_that("left_join works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  Motif <- load("data/dfMotif.rda")
  IPD <- load("data/dfIPD.rda")
  dfIPD <- dfIPD[1:40000,]
  CDS <- load("data/dfCDS.rda")
  Transcription <- load("data/dfTranscription.rda")
  dfmotifIPD <- methylMapR::joinmotifIPD(dfIPD,dfMotif)
  dfmotifGene <- methylMapR::joinmotifGene(dfCDS,dfmotifIPD)
  dfmotifgeneTranscription <- methylMapR::joinmotifgeneTranscription(dfmotifGene,dfTranscription)
  expect_equal(nrow(dfmotifGene), nrow(dfmotifgeneTranscription),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
  expect_is(dfmotifgeneTranscription$promoterregionMotif, "numeric")
  expected_num_columns <- ncol(dfmotifGene) + ncol(dfTranscription) - 1
  expect_equal(ncol(dfmotifgeneTranscription), expected_num_columns)
  rm(dfmotifGene)
  rm(dfMotif)
  rm(dfIPD)
  rm(dfCDS)
  rm(dfmotifIPD)
  rm(dfTranscription)
  })

#dfmethbasestartGene, dfTranscription
