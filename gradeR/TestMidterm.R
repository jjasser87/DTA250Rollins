# Load testthat library
library(testthat)

# Function to test plots, wrapped in grade_question
grade_plot <- function(question_id, plot, expected_components) {
    
    for (component in expected_components) {
      switch(component$type,
             aes = {
               test_that(paste("Plot", question_id, "- Aesthetic", component$details, "is correctly mapped"), {
                 expect_true(component$details %in% names(plot$mapping))
               })
             },
             geom = {
               if(component$details == "geom_point") {
                 component$details <- "GeomPoint"
               } else if(component$details == "geom_smooth") {
                 component$details <- "GeomSmooth"
               } else if(component$details == "geom_density") {
                 component$details <- "GeomDensity"
               } else if(component$details == "geom_boxplot") {
                 component$details <- "GeomBoxplot"
               } else if(component$details == "geom_histogram") {
                 component$details <- "GeomBar"
               }
               test_that(paste("Plot", question_id, "- Geom", component$details, "is used"), {
                 expect_true(any(sapply(plot$layers, function(x) class(x$geom)[1] == component$details)))
               })
             },
             facet = {
               test_that(paste("Plot", question_id, "- Correct facet is used"), {
                 expect_true(class(plot$facet)[1] == component$details)
               })
             },
             title = {
               test_that(paste("Plot", question_id, "- Correct title is set"), {
                 expect_equal(plot$labels$title, component$details)
               })
             },
             xlab = {
               test_that(paste("Plot", question_id, "- Correct x label is set"), {
                 expect_equal(plot$labels$x, component$details)
               })
             },
             ylab = {
               test_that(paste("Plot", question_id, "- Correct y label is set"), {
                 expect_equal(plot$labels$y, component$details)
               })
             }
      )
    }
  }

# Test Q1 ----

# Test popularity_5th
test_that("popularity_5th", {
  expect_equal(popularity_5th, 65L)
})

# Test rows_5_to_10_20_to_22
test_that("rows_5_to_10_20_to_22", {
  expect_equal(rows_5_to_10_20_to_22$energy[1], 0.928)
})

# Test result
test_that("result", {
  expect_equal(result$energy[1], 060.320)
})

# Test class_popularity_5th
test_that("class_popularity_5th", {
  expect_equal(class_popularity_5th, "integer")
})

# Test class_popularity_5th_is_numeric
test_that("class_popularity_5th_is_numeric", {
  expect_equal(class_popularity_5th_is_numeric, TRUE)
})

# Test Q2 ----

# Test plot exist
test_that("plot exists", {
  expect_true(exists("plot"))
})

# Test plot
grade_plot("Q2", plot, list(
  list(type = "aes", details = "x"),
  list(type = "aes", details = "y"),
  list(type = "geom", details = "geom_point"),
  list(type = "geom", details = "geom_smooth"),
  list(type = "facet", details = "FacetWrap"),
  list(type = "title", details = "Scatter Plot of Danceability and Energy"),
  list(type = "xlab", details = "Danceability"),
  list(type = "ylab", details = "Energy")
))

# Test Q3 ----

# Test average_dance_energy11
test_that("average_dance_energy11", {
  expect_equal(average_dance_energy(df$danceability[1], df$energy[1]), "High")
})

# Test average_dance_energy22
test_that("average_dance_energy22", {
  expect_equal(average_dance_energy(df$danceability[2], df$energy[2]), "High")
})

# Test average_dance_energy.1.1
test_that("average_dance_energy.1.1", {
  expect_equal(average_dance_energy(0.1, 0.1), "Low")
})

# Test average_dance_energy255255
test_that("average_dance_energy255255", {
  expect_equal(average_dance_energy(df$danceability[255], df$energy[255]), "Low")
})

# Test average_dance_energy255330
test_that("average_dance_energy255330", {
  expect_equal(average_dance_energy(df$danceability[255], df$energy[330]), "High")
})

# Test Q4 ----

# Test q4df[1, 2]
test_that("q4df[1, 2]", {
  expect_equal(q4df |> slice(1) |> select(2) |> pull(), 88)
})

# Test q4df[2, 3]
test_that("q4df[2, 3]", {
  expect_equal(q4df |> slice(2) |> select(3) |> pull(), 0.6)
})

# Test q4df[3, 4]
test_that("q4df[3, 4]", {
  expect_equal(q4df |> slice(3) |> select(4) |> pull(), 0.705)
})

# Test q4df[5, 1]
test_that("q4df[5, 1]", {
  expect_equal(q4df |> slice(5) |> select(1) |> pull(), "Tame Impala")
})

# Test most_popular_artist
test_that("most_popular_artist", {
  expect_equal(most_popular_artist, "Tom Odell")
})