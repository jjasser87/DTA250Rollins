library(testthat)

# Mock-up function to simulate grading mechanism
# Replace or modify according to your actual grading framework
grade_question <- function(question_id, test_code) {
  test_code()
}

# Function to test plots, wrapped in grade_question
grade_plot <- function(question_id, plot, expected_components) {
  grade_question(question_id, function() {
    test_that(paste("Plot", question_id, "- Plot is a ggplot"), {
      expect_true(is.ggplot(plot))
    })
    
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
  })
}

# Example call for Plot 1
grade_plot("Q1", plot1, list(
  list(type = "aes", details = "x"),
  list(type = "geom", details = "geom_density"),
  list(type = "facet", details = "FacetGrid"),
  list(type = "title", details = "Density Plot of Bill Length by Species"),
  list(type = "xlab", details = "Bill Length (mm)"),
  list(type = "ylab", details = "Density")
))

# Plot 2: Carat vs. Price by Cut Quality
grade_plot("Q2", plot2, list(
  list(type = "aes", details = "x"),
  list(type = "aes", details = "y"),
  list(type = "geom", details = "geom_point"),
  list(type = "geom", details = "geom_smooth"),
  list(type = "title", details = "Carat vs. Price by Cut Quality"),
  list(type = "xlab", details = "Carat"),
  list(type = "ylab", details = "Price")
))

# Plot 3: Miles Per Gallon by Cylinder Number
grade_plot("Q3", plot3, list(
  list(type = "aes", details = "x"),
  list(type = "aes", details = "y"),
  list(type = "geom", details = "geom_boxplot"),
  list(type = "title", details = "Miles Per Gallon by Cylinder Number"),
  list(type = "xlab", details = "Number of Cylinders"),
  list(type = "ylab", details = "Miles Per Gallon (mpg)")
))

# Plot 4: Petal Length Distribution for Each Species
grade_plot("Q4", plot4, list(
  list(type = "aes", details = "x"),
  list(type = "geom", details = "geom_histogram"),
  list(type = "facet", details = "FacetWrap"),
  list(type = "title", details = "Petal Length Distribution for Each Species"),
  list(type = "xlab", details = "Petal Length"),
  list(type = "ylab", details = "Count")
))

