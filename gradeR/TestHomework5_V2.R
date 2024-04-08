# Load the testthat library
library(testthat)

# Test il_filter
test_that("il_filter", {
    expect_equal(unique(il_filter$state), "IL")
})

# Test il_filter_percollege
test_that("il_filter_percollege", {
    expect_equal(il_filter_percollege[1,1] |> pull(), 18.78814, tolerance = 0.001)
})

# Test all_states_percollege
test_that("all_states_percollege", {
    expect_equal(all_states_percollege[1,2] |> pull(), 18.8, tolerance = 0.1)
})

# Test avg_percollege_percbelowpoverty
test_that("avg_percollege_percbelowpoverty", {
    expect_equal(avg_percollege_percbelowpoverty[1,3] |> pull(), 13.1, tolerance = 0.1)
})

# Test median_popadults
test_that("median_popadults", {
    expect_equal(median_popadults[1,2] |> pull(), 16382, tolerance = 0.1)
})

# Test std_dev_percchildbelowpovert_percbelowpoverty
test_that("std_dev_percchildbelowpovert_percbelowpoverty", {
    expect_equal(std_dev_percchildbelowpovert_percbelowpoverty[1,3] |> pull(), 5.29, tolerance = 0.01)
})

# Test setosa_filter
test_that("setosa_filter", {
    expect_equal(unique(setosa_filter$Species) |> as.character(), "setosa")
})

# Test setosa_filter_avg_sepal_length
test_that("setosa_filter_avg_sepal_length", {
    expect_equal(setosa_filter_avg_sepal_length |> pull(), 5.006)
})

# Test sep_width_avg_by_species
test_that("sep_width_avg_by_species", {
    expect_equal(sep_width_avg_by_species[1,2] |> pull(), 3.43, tolerance = 0.01)
})

# Test avg_sepal_length_petal_length_by_species
test_that("avg_sepal_length_petal_length_by_species", {
    expect_equal(avg_sepal_length_petal_length_by_species[1,3] |> pull(), 1.46, tolerance = 0.01)
})

# Test more_than_100_hp
test_that("more_than_100_hp", {
    expect_equal(more_than_100_hp, mtcars |> filter(hp > 100))
})

# Test more_than_100_hp_more_than_4_cyl
test_that("more_than_100_hp_more_than_4_cyl", {
    expect_equal(more_than_100_hp_more_than_4_cyl, mtcars |> filter(hp > 100, cyl > 4))
})

# Test more_than_100_hp_less_than_20_mpg_more_than_6_cyl
test_that("more_than_100_hp_less_than_20_mpg_more_than_6_cyl", {
    expect_equal(more_than_100_hp_less_than_20_mpg_more_than_6_cyl, mtcars |> filter(hp > 100, mpg < 20, cyl > 6) |> arrange(desc(mpg)))
})

# Test avg_mpg_by_cyl
test_that("avg_mpg_by_cyl", {
    expect_equal(avg_mpg_by_cyl[1,2] |> pull(), 26.66364, tolerance = 0.1)
})

# Test avg_mpg_by_cyl_gear
test_that("avg_mpg_by_cyl_gear", {
    expect_equal(avg_mpg_by_cyl_gear[1,3] |> pull(), 21.5, tolerance = 0.1)
})

# Test avg_mpg_by_cyl_gear_carb
test_that("avg_mpg_by_cyl_gear_carb", {
    expect_equal(avg_mpg_by_cyl_gear_carb[1,4] |> pull(), 21.5, tolerance = 0.1)
})