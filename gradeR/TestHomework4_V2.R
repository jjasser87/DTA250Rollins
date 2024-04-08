# Load the testthat library
library(testthat)

# Q1 ----

# Test the area57 restuls
test_that("area57", {
  expect_equal(area57, 17.5)
})

# Test the area1015 results
test_that("area1015", {
  expect_equal(area1015, 75)
})

# Test the area34 results
test_that("area34", {
  expect_equal(area_triangle(3,4), 6)
})

# Test the area69 results
test_that("area69", {
  expect_equal(area_triangle(6,9), 27)
})

# Test the area810 results
test_that("area810", {
  expect_equal(area_triangle(8,10), 40)
})

# Q2 ----

# Test evenodd5 results
test_that("evenodd5", {
  expect_equal(evenodd5, "5 is odd")
})

# Test evenodd8 results
test_that("evenodd8", {
  expect_equal(evenodd8, "8 is even")
})

# Test evenodd11 results
test_that("evenodd11", {
  expect_equal(even_or_odd(11), "11 is odd")
})

# Test evenodd14 results
test_that("evenodd14", {
  expect_equal(even_or_odd(14), "14 is even")
})

# Test evenodd17 results
test_that("evenodd17", {
  expect_equal(even_or_odd(17), "17 is odd")
})

# Q3 ----

# Test celsius40 results
test_that("celsius40", {
  expect_equal(celsius40, "It's hot!")
})

# Test celsius25 results
test_that("celsius25", {
  expect_equal(celsius25, "It's not hot!")
})

# Test celsius5 results
test_that("celsius5", {
  expect_equal(celsius5, "It's not hot!")
})

# Test celsius0 results
test_that("celsius0", {
  expect_equal(celsius_to_fahrenheit(0), "It's not hot!")
})

# Test celsius60 results
test_that("celsius60", {
  expect_equal(celsius_to_fahrenheit(60), "It's hot!")
})