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


# TODO
# Repeat the last TODO
# However, this time remove missing values
# Set the values_drop_na to TRUE.


# TODO
# Repeat the last TODO
# However, this time save the results into a data frame called billboard_longer
# After pivot_longer, mutate the "week" column so that it only contains that
# number of the week only. Use the mutate() function.
# Use the parse_number() function to get the number of the week only


# TODO
# Plot the ranks of all 3 Doors Down songs over all weeks


# Many Variables in Column Names ----

# Load the who2 dataset
data("who2")

# TODO
# Apply the pivot_longer() function on all columns that are not "country" or "year"
# Set the names_to parameter to "diagnosis", "gender", and "age". use the c() function
# Set the names_sep parameter to "_"
# Set the values_to parameter to "count"


# Data and Variable in the column Headers ----

# Load the household dataset
data("household")

# TODO
# Apply the pivot_longer() function on all columns that are not "family"
# Set the names_to parameter to ".value", and "child". Use the c() function
# Set the names_sep parameter to "_"
# Set the values_drop_na to TRUE


# Widening Data ----

# The pivot_wider() function is use to make the dataset wider by increasing the
# number of columns and reducing the number of rows.

# Load the cms_patient_experience dataset
cms <- cms_patient_experience

# TODO
# Find the distinct values in `measure_cd` and `measure_title`. Use the distinct() function


# TODO
# Apply the pivot_wider() function on the `measure_cd` column.
# Set the values_from parameter to `prf_rate`


# TODO
# Repeat the last TODO
# However, use the the id_cols parameter and set it to
# any column that starts with "org"

