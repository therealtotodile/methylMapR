test_that("left_join works", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Motif.rda")
  load("tests/testthat/data/IPD.rda")
  #IPD <- IPD[1:40000,]
  load("tests/testthat/data/CDS.rda")
  load("tests/testthat/data/Transcription.rda")
  motifIPD <- methylMapR::joinmotifIPD(IPD,Motif)
  motifGene <- methylMapR::joinmotifGene(CDS,motifIPD)
  motifgeneTranscription <- methylMapR::joinmotifgeneTranscription(motifGene,Transcription)
  expect_equal(nrow(motifGene), nrow(motifgeneTranscription),
               info = "The number of rows in the result should be the sum of rows in Motif")
  expect_is(motifgeneTranscription$promoterregionMotif, "numeric")
  expected_num_columns <- ncol(motifGene) + ncol(Transcription) - 1
  expect_equal(ncol(motifgeneTranscription), expected_num_columns)
  rm(motifGene)
  rm(Motif)
  rm(IPD)
  rm(CDS)
  rm(motifIPD)
  rm(Transcription)
  })

#methbasestartGene, Transcription
