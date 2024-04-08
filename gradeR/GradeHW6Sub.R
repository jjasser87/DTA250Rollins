library(gradeR)
library(tidyverse)
library(writexl)

rm(list = ls())

setwd("C:/Users/jjasser/OneDrive - Rollins College/DTA250/code/DTA250Rollins/gradeR")

submissionDir <- "HW6Subs/"

grades <- calcGrades(submission_dir = submissionDir,
                     your_test_file = "TestHomework6_V2.R", verbose = TRUE)


grades <- tibble(grades)

# Sum the grades in each row starting from column 2 and add it as a new column called total_grade
grades <- grades %>%
  mutate(total_grade = rowSums(.[2:ncol(.)]))

# Relocate total_grade after id
grades <- grades %>%
  relocate(total_grade, .after = id)

# Export the grades to an excel file
write_xlsx(grades, "Homework6Grades.xlsx")

#grades |> select(total_grade)

# Find a specific word in the id column
#grades %>%
#  filter(str_detect(id, "conor"))

#grades |>
#  select(total_grade)
