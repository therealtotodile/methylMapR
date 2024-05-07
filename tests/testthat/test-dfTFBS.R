test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  TFBS <- load("data/dfTFBS.rda")
  #dfTFBS <- methylMapR::dfTFBS("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM5696090_17251_MglB_MHS_i5006_DY330_rep1.gff")
  dfTFBS <- dfTFBS[1:20000,]
  expect_is(dfTFBS, "data.frame")
  expect_is(dfTFBS$score, "numeric")
  rm(dfTFBS)
})
