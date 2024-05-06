test_that("rbind works", {
  expect_equal(nrow(dfmotifGene), nrow(dfmotifIPD),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
  expect_is(dfmotifGene$promoterregionMotif, "numeric")
})
