test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  Transcription <- load("data/dfTranscription.rda")
  #dfTranscription <- methylMapR::dfTranscription("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\Dataset_S5 The dataset of gene expression (TPM)_useme.csv", "b0" )
  expect_is(dfTranscription, "data.frame")
  expect_is(dfTranscription$locusTag, "factor")
  rm(dfTranscription)
})
