test_that("the data type is correct", {
  expect_is(dfCDS, "data.frame")
  expect_is(dfCDS$Locus.tag, "factor")
})
