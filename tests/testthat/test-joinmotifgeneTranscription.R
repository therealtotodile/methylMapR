test_that("left_join works", {
  expect_equal(nrow(dfmotifGene), nrow(dfmotifgeneTranscription),
               info = "The number of rows in the result should be the sum of rows in dfMotif")
  expect_is(dfmotifgeneTranscription$promoterregionMotif, "numeric")
  expected_num_columns <- ncol(dfmotifGene) + ncol(dfTranscription) - 1
  expect_equal(ncol(dfmotifgeneTranscription), expected_num_columns)
  })

#dfmethbasestartGene, dfTranscription
