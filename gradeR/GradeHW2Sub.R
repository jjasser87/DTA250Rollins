library(gradeR)
library(tidyverse)
library(writexl)

# Clear all objects in the environment
rm(list = ls())

setwd("C:/Users/jjasser/OneDrive - Rollins College/DTA250/code/DTA250Rollins/gradeR")

submissionDir = "SubT/"

grades <- calcGrades(submission_dir = submissionDir,
                     your_test_file = "TestHomework2_V2.R")


grades <- tibble(grades)

# Sum the grades in each row starting from column 2 and add it as a new column called total_grade
grades <- grades %>%
  mutate(total_grade = rowSums(.[2:ncol(.)]))

# Relocate total_grade after of id
grades <- grades %>%
  relocate(total_grade, .after = id)

# Export the grades to an excel file
#write_xlsx(grades, "gradeR/Homework2Grades.xlsx")

# Find a specific word in the id column
#grades %>%
#  filter(str_detect(id, "conor"))

#grades |>
#  select(total_grade)
