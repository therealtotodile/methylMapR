test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/TFBS.rda")
  #dfTFBS <- methylMapR::dfTFBS("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM5696090_17251_MglB_MHS_i5006_DY330_rep1.gff")
  #TFBS <- TFBS[1:20000,]
  expect_is(TFBS, "data.frame")
  expect_is(TFBS$score, "numeric")
  rm(TFBS)
})
