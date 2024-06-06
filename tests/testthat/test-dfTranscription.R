test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Transcription.rda")
  #dfTranscription <- methylMapR::dfTranscription("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\Dataset_S5 The dataset of gene expression (TPM)_useme.csv", "b0" )
  expect_is(Transcription, "data.frame")
  expect_is(Transcription$locusTag, "factor")
  rm(Transcription)
})
