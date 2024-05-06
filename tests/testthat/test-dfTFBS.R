test_that("the data type is correct", {
  expect_is(dfTFBS, "data.frame")
  expect_is(dfTFBS$score, "numeric")
})
