# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# dplyr ----
# dplyr is a package that provides a grammar of data manipulation
# It is built around the set of common verbs that are used to manipulate data
# It is also built around the pipe operator %>%

#TODO
# Load the library dplyr using the library() function


#TODO
# Use the diamonds dataset to create a new data frame called df


#TODO
# Use the class() function to check the class of df


## select() ----
# select() is used to select columns from a data frame

#TODO
# Use the select() function to select the columns carat, cut, color, and clarity


#TODO
# Redo the last TODO using the select() function and the pipe operator %>%


#TODO
# Select all the columns that starts with the letter c


#TODO
# Select all the columns that ends with the letter e


#TODO
# Select all the columns that contains the letter l


## filter() ----
# filter() is used to filter rows from a data frame

#TODO
# Use the filter() function to filter the rows that has the cut "Ideal"


#TODO
# Use the filter() function to filter the rows that has the cut "Ideal" and
# "Premium". Use the %in% operator


#TODO
# Use the filter() function to filter the rows that has a price greater than
# 1000


#TODO
# Use the filter() function to filter the rows that has the carat greater than
# 2 and the price greater than 1000


## slice() ----
# slice() is used to select rows by position

#TODO
# Use the slice() function to select the rows 5, 6, and 7

## mutate() ----
# mutate() is used to create new columns

#TODO
# Use the mutate() function to create a new column called Ratio that is the
# ratio of the price and the carat


#TODO
# Use the mutate() function to create a new column called Ratio that is the
# ratio of the price and the carat, and another column called Double that is
# the double of the Ratio column


# But still, all these new columns are not saved in the data frame. To save
# them, we need to use the %<>% operator from the magrittr package

#TODO
# Redo the last TODO using the %<>% operator.


## summarize() ----

#TODO
# Use the summarize() function to get the mean price of the diamonds


#TODO
# Use the summarize() function to get the mean price of the diamonds, and the
# mean carat of the diamonds


## group_by() ----
# group_by() is used to group the data by a column

#TODO
# Use the group_by() function to group the data by the cut column and then
# summarize the data to get the mean price of each cut


#TODO
# Use the group_by() function to group the data by the cut and color columns
# and then summarize the data to get the mean price of each cut and color


## arrange() ----
# arrange() is used to sort the data

#TODO
# Use the arrange() function to sort the data by the price column


#TODO
# Use the summarize() function to get the mean price of the diamonds, and the
# mean carat of the diamonds by their cut quality, and then arrange the data 
# by the mean price column