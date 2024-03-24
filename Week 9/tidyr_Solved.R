# DTA250 - Spring 2024
# JJ

# Data Tidying ----

# Lengthening Data

# tidyr provides two functions for pivoting data: pivot_longer() and pivot_wider()
# pivot_longer() is the most common case.
# The pivot_longer() function is used to lengthen data by increasing the number
# of rows and decreasing the number of columns.

# Load the tidyverse
library(tidyverse)

# Load the billboard dataset
data("billboard")

# TODO
# Apply the pivot_longer() function on all columns that starts with "wk".
# Set the name_to parameter to "week", and the values_to parameter to "rank"
billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank"
  )

# TODO
# Repeat the last TODO
# However, this time remove missing values
# Set the values_drop_na to TRUE.
billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  )

# TODO
# Repeat the last TODO
# However, this time save the results into a data frame called billboard_longer
# After pivot_longer, mutate the "week" column so that it only contains that
# number of the week only. Use the mutate() function.
# Use the parse_number() function to get the number of the week only
billboard_longer <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(
    week = parse_number(week)
  )

# TODO
# Plot the ranks of all 3 Doors Down songs over all weeks
ggplot(billboard_longer |>
         filter(artist == "3 Doors Down"), 
       aes(x = week, 
           y = rank,
           color = track)) +
  geom_line() +
  labs(
    title = "Rank of 3 Doors Down Songs Over Time",
    x = "Week",
    y = "Rank"
  )

# Many Variables in Column Names ----

# Load the who2 dataset
data("who2")

# TODO
# Apply the pivot_longer() function on all columns that are not "country" or "year"
# Set the names_to parameter to "diagnosis", "gender", and "age". use the c() function
# Set the names_sep parameter to "_"
# Set the values_to parameter to "count"
who2 |>
  pivot_longer(
    cols = -c(country, year),
    names_to = c("diagnosis", "gender", "age"),
    names_sep = "_",
    values_to = "count"
  )

# Data and Variable in the column Headers ----

# Load the household dataset
data("household")

# TODO
# Apply the pivot_longer() function on all columns that are not "family"
# Set the names_to parameter to ".value", and "child". Use the c() function
# Set the names_sep parameter to "_"
# Set the values_drop_na to TRUE
household |>
  pivot_longer(
    cols = -family,
    names_to = c(".value", "child"),
    names_sep = "_",
    values_drop_na = TRUE
  )

# Widening Data ----

# The pivot_wider() function is use to make the dataset wider by increasing the
# number of columns and reducing the number of rows.

# Load the cms_patient_experience dataset
cms <- cms_patient_experience

# TODO
# Find the distinct values in `measure_cd` and `measure_title`. Use the distinct() function
cms |>
  distinct(measure_cd, measure_title)

# TODO
# Apply the pivot_wider() function on the `measure_cd` column.
# Set the values_from parameter to `prf_rate`
cms |>
  pivot_wider(
    names_from = measure_cd,
    values_from = prf_rate
  )

# TODO
# Repeat the last TODO
# However, use the the id_cols parameter and set it to
# any column that starts with "org"
cms |>
  pivot_wider(
    names_from = measure_cd,
    values_from = prf_rate,
    id_cols = starts_with("org")
  )
