library(testthat)

# Test crim
test_that("crim", {
    expect_equal(Boston_long[1,1] |> pull(), "crim")
})

# Test crim value
test_that("crim value", {
    expect_equal(Boston_long[1,2] |> pull(), 0.00632)
})

# Test zn
test_that("zn", {
    expect_equal(Boston_long[2,1] |> pull(), "zn")
})

# Test zn value
test_that("zn value", {
    expect_equal(Boston_long[2,2] |> pull(), 18)
})

# Test indus
test_that("indus", {
    expect_equal(Boston_long[3,1] |> pull(), "indus")
})

# Test geom_bar
test_that("geom_bar", {
    expect_true("GeomBar" %in% attributes(all_plot$layers[[1]]$geom)$class)
})

# Test facet_wrap
test_that("facet_wrap", {
    expect_true("FacetWrap" %in% attributes(all_plot$facet)$class)
})

# Test Variable
test_that("Variable", {
    expect_true("Variable" %in% attributes(all_plot[["facet"]][["params"]][["facets"]]))
})

# Test Free scales
test_that("Free scales x", {
    expect_true(all_plot[["facet"]][["params"]][["free"]][["x"]])
})
test_that("Free scales y", {
    expect_true(all_plot[["facet"]][["params"]][["free"]][["y"]])
})
