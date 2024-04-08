library(testthat)

# Test for Part 1: Variables
test_that("first_number", {
  expect_equal(first_number, 5)
})

test_that("second_number", {
  expect_equal(second_number, 2)
})

test_that("my_character", {
  expect_equal(my_character, "hello")
})

test_that("my_logical", {
  expect_equal(my_logical, TRUE)
})

# Test for Part 2: Operations
test_that("sum_result", {
  expect_equal(sum_result, first_number + second_number)
})

test_that("div_result", {
  expect_equal(div_result, first_number / second_number)
})

test_that("mult_result", {
  expect_equal(mult_result, first_number * my_logical)
})

test_that("char_result", {
  expect_equal(char_result, nchar(my_character))
})

# Test for Part 3: Data Types
test_that("first_number_type", {
  expect_equal(first_number_type, class(first_number))
})

test_that("second_number_int_check", {
  expect_equal(second_number_int_check, is.integer(second_number))
})

test_that("my_logical_check", {
  expect_equal(my_logical_check, is.logical(my_logical))
})

test_that("equal_check", {
  expect_equal(equal_check, my_logical_check == second_number_int_check)
})

# Test for Part 4: Vectors
test_that("num_vector", {
  expect_equal(sum(num_vector), 6)
  expect_equal(length(num_vector), 3)
  expect_equal(class(num_vector), "numeric")
})

test_that("range_vector", {
  expect_equal(sum(range_vector), 13)
  expect_equal(length(range_vector), 13)
  expect_equal(class(range_vector), "integer")
})

test_that("char_vector", {
  expect_equal(char_vector, c("apple", "banana", "cherry"))
})

test_that("log_vector", {
  expect_gte(sum(log_vector), 2)
})

test_that("mult_vector", {
  expect_gte(sum(mult_vector), 3)
  expect_lte(sum(mult_vector), 5)
})

test_that("bool_vector", {
  expect_equal(bool_vector, c(FALSE, TRUE, TRUE))
})

# Test for Part 5: Factors
test_that("factor_vector", {
  expect_equal(factor_vector, as.factor(char_vector))
})

test_that("factor_vector_level", {
  expect_equal(levels(factor_vector_level), c("cherry", "apple", "banana"))
})
