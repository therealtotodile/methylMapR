test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/CDS.rda")
  #dfCDS <- methylMapR::dfCDS("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\ecoliGenes.tsv")
  expect_is(CDS, "data.frame")
  expect_is(CDS$Locus.tag, "factor")
  rm(CDS)
})
