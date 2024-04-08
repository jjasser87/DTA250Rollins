library(gradeR)
library(tidyverse)
library(writexl)

rm(list = ls())

setwd("C:/Users/jjasser/OneDrive - Rollins College/DTA250/code/DTA250Rollins/gradeR")

submissionDir <- "SubT/"

grades <- calcGrades(submission_dir = submissionDir,
                     your_test_file = "TestMidterm.R", verbose = TRUE)


grades <- tibble(grades)

# Add weights to the grades

grade_weights <- c(1, 1, 1, 1, 1, # Q1
                   2, 1, 1, 1, 1, 1, 1, 1, 1, # Q2
                   1, 1, 1, 1, 1, # Q3
                   2, 2, 2, 2, 2) # Q4

# Identify numeric columns
numeric_cols <- sapply(grades, is.numeric)

# Multiply only numeric columns with grade_weights
# Multiply only numeric columns with grade_weights row-wise
grades[numeric_cols] <- t(apply(grades[numeric_cols], 1, function(x) x * grade_weights))


#grades <- cbind(grades[, 1], temp)

# Sum the grades in each row starting from column 2 and add it as a new column called total_grade
grades <- grades %>%
  mutate(total_grade = rowSums(.[2:ncol(.)]))

# Relocate total_grade after id
grades <- grades %>%
  relocate(total_grade, .after = id)

# Export the grades to an excel file
#write_xlsx(grades, "MidtermGrades.xlsx")

grades |> select(total_grade)

# Find a specific word in the id column
#grades %>%
#  filter(str_detect(id, "conor"))

#grades |>
#  select(total_grade)
