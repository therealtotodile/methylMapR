test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  CDS <- load("data/dfCDS.rda")
  #dfCDS <- methylMapR::dfCDS("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\ecoliGenes.tsv")
  expect_is(dfCDS, "data.frame")
  expect_is(dfCDS$Locus.tag, "factor")
  rm(dfCDS)
})
