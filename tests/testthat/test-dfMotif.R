test_that("the data type is correct", {
  setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylMapR")
  Motif <- load("data/dfMotif.rda")
  #dfMotif <- methylMapR::dfMotif("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM1711631_Escherichia_coli_K12_MG1655_Tet.motifs.gff")
  expect_is(dfMotif, "data.frame")
  expect_is(dfMotif$score, "numeric")
  rm(dfMotif)
})
