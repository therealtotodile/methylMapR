test_that("rbind works", {
  expect_equal(nrow(dfmotifIPD), nrow(dfMotif),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
})
