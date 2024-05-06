test_that("the data type is correct", {
  expect_is(dfTranscription, "data.frame")
  expect_is(dfTranscription$locusTag, "factor")
})
