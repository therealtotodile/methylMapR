test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  load("tests/testthat/data/Motif.rda")
  #dfMotif <- methylMapR::dfMotif("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM1711631_Escherichia_coli_K12_MG1655_Tet.motifs.gff")
  expect_is(Motif, "data.frame")
  expect_is(Motif$score, "numeric")
  rm(Motif)
})
