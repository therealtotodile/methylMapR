test_that("the data type is correct", {
  expect_is(dfMotif, "data.frame")
  expect_is(dfMotif$score, "numeric")
})
