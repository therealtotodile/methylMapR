test_that("the data type is correct", {
  expect_is(dfIPD, "data.frame")
  expect_is(dfIPD$ipdRatio, "numeric")
})

#some code that is udeful for testing!
#need to move to methylMApR directory
#setwd("C:/Users/cmorrissey/OneDrive - Illumina, Inc/Documents/methylmapR")
#then devtools load all
#devtools::load_all()
#to test...
#testthat::test_file("tests/testthat/test-dfIPD.R")
#to test everything in the testing suite
#devtools::test()
#as a final check
#devtools::check()
