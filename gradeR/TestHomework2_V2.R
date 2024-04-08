library(testthat)

# Assuming df is already loaded in the environment

# Cell Access Tests
test_that("Second row, third column access", {
  expect_equal(df[2, 3], second_row_third_column, info = "Second row, third column test failed")
})

test_that("Horsepower for first car", {
  expect_equal(df[1, "horsepower"], horsepower_first_car, info = "Horsepower for first car test failed")
})

test_that("Cylinders for fifth car", {
  expect_equal(df[5, "cylinders"], cylinders_fifth_car, info = "Cylinders for fifth car test failed")
})

test_that("Weight for third car", {
  expect_equal(df[3, "weight"], weight_third_car, info = "Weight for third car test failed")
})

test_that("Acceleration for tenth car", {
  expect_equal(df[10, "acceleration"], acceleration_tenth_car, info = "Acceleration for tenth car test failed")
})

# Row Access Tests
test_that("First car data access", {
  expect_equal(df[1, ], first_car, info = "First car data access test failed")
})

test_that("Seventh car data access", {
  expect_equal(df[7, ], seventh_car, info = "Seventh car data access test failed")
})

test_that("Cars 15 to 20 data access", {
  expect_equal(df[15:20, ], cars_15_to_20, info = "Cars 15 to 20 data access test failed")
})

test_that("Cars 20, 26, 50 data access", {
  expect_equal(df[c(20, 26, 50), ], cars_20_26_50, info = "Cars 20, 26, 50 data access test failed")
})

test_that("Specific cars data access (30-45, 47, 79)", {
  expect_equal(df[c(30:45, 47, 79), ], cars_30_to_45_47_79, info = "Specific cars data access test failed")
})

# Column Access Tests
test_that("MPG column access", {
  expect_equal(df[,"mpg"], mpg_column, info = "MPG column access test failed")
})

test_that("Year column access", {
  expect_equal(df[,"year"], year_column, info = "Year column access test failed")
})

test_that("Origin and year columns access", {
  condition_met <- all(c("origin", "year") %in% names(origin_year_columns))
  #expect_equal(c("origin", "year"), names(origin_year_columns), info = "Origin and year columns access test failed")
  expect_true(condition_met, info = "Origin and year columns access test failed")
})

test_that("Columns 1 to 4 access", {
  expect_equal(df[,1:4], columns_1_to_4, info = "Columns 1 to 4 access test failed")
})

test_that("Columns 1 to 4 and acceleration access", {
  expect_equal(df[,c(1:4, which(names(df) == "acceleration"))], columns_1_to_4_acceleration, info = "Columns 1 to 4 and acceleration access test failed")
})

# Combined Access Tests
test_that("MPG and year for first five cars", {
  expect_equal(df[1:5, c("mpg", "year")], mpg_year_first_five, info = "MPG and year for first five cars test failed")
})

test_that("Horsepower and weight for cars 10 to 15", {
  expect_equal(df[10:15, c("horsepower", "weight")], horsepower_weight_10_to_15, info = "Horsepower and weight for cars 10 to 15 test failed")
})

test_that("MPG, horsepower, and year for selected cars", {
  expect_equal(df[c(20, 25, 30), c("mpg", "horsepower", "year")], mpg_horsepower_year_20_25_30, info = "MPG, horsepower, and year for selected cars test failed")
})

test_that("Specific details for selected cars access", {
  expect_equal(df[c(30:45, 47, 79), c("cylinders", "displacement", "acceleration")], cylinders_displacement_acceleration_30_to_45_47_79, info = "Specific details for selected cars access test failed")
})

test_that("First 4 columns and acceleration for selected cars", {
  expect_equal(df[c(2, 3, 4, 6), c(1:4, which(names(df) == "acceleration"))], columns_1_to_4_acceleration_2_to_4_6, info = "First 4 columns and acceleration for selected")
})