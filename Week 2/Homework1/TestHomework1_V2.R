library(testthat)

# Test for Part 1: Variables
test_that("first_number is correct", {
  expect_equal(first_number, 5)
})

test_that("second_number is correct", {
  expect_equal(second_number, 2)
})

test_that("my_character is correct", {
  expect_equal(my_character, "hello")
})

test_that("my_logical is correct", {
  expect_equal(my_logical, TRUE)
})

# Test for Part 2: Operations
test_that("sum_result is correct", {
  expect_equal(sum_result, first_number + second_number)
})

test_that("div_result is correct", {
  expect_equal(div_result, first_number / second_number)
})

test_that("mult_result is correct", {
  expect_equal(mult_result, first_number * my_logical)
})

test_that("char_result is correct", {
  expect_equal(char_result, nchar(my_character))
})

# Test for Part 3: Data Types
test_that("first_number_type is correct", {
  expect_equal(first_number_type, class(first_number))
})

test_that("second_number_int_check is correct", {
  expect_equal(second_number_int_check, is.integer(second_number))
})

test_that("my_logical_check is correct", {
  expect_equal(my_logical_check, is.logical(my_logical))
})

test_that("equal_check is correct", {
  expect_equal(equal_check, my_logical_check == second_number_int_check)
})

# Test for Part 4: Vectors
test_that("num_vector is correct", {
  expect_equal(num_vector, c(1, 2, 3))
})

test_that("range_vector is correct", {
  expect_equal(range_vector, -5:7)
})

test_that("char_vector is correct", {
  expect_equal(char_vector, c("apple", "banana", "cherry"))
})

test_that("log_vector is correct", {
  expect_equal(log_vector, c(TRUE, TRUE, FALSE))
})

test_that("mult_vector is correct", {
  expect_equal(mult_vector, num_vector * log_vector)
})

test_that("bool_vector is correct", {
  expect_equal(bool_vector, sum(bool_vector >= 3 & bool_vector <= 5))
})

# Test for Part 5: Factors
test_that("factor_vector is correct", {
  expect_equal(factor_vector, as.factor(char_vector))
})

test_that("factor_vector_level is correct", {
  expect_equal(levels(factor_vector_level), c("cherry", "apple", "banana"))
})

# Run all tests
test_dir("path/to/tests")
