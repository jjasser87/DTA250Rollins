library(testthat)

# first test
test_that("first", {
  expect_equal(myVector, 1:3)
})

# second test
test_that("second", {
  expect_true(is.character(myString))
  expect_true(nchar(myString) > 2)
})

# third test
test_that("third", {
  expect_equal(nrow(myDataFrame), 2)
  expect_equal(myDataFrame[1,1], 700.01, tolerance=1e-3)
})