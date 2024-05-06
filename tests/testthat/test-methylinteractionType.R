test_that("check if the interaction call is working", {
  expect_is(dfmethylinteractionType$interactiontypeMeth, "character")
  column_data <- dfmethylinteractionType$interactiontypeMeth
  num_unique <- length(unique(column_data))
  expect_true(num_unique == 2 || num_unique == 3,
              info = "The number of unique strings in the column should be either 2 or 3")
})
