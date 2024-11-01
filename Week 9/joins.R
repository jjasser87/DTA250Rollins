#DTA250 - Fall 2023
#JJ

# Joins ----
# Joins are used to combine data from two or more data frames based on the
# values of one or more keys that are common between the data frames.

## Prerequisites ----

#TODO
# load the tidyverse package using the library() function


#TODO
# load the nycflights13 package using the library() function


## Basic joins ----
# There are six basic types of joins: inner, left, right, full, semi, and
# anti.

# We will focus on the left join for now.

## Mutating joins ----
# Mutating joins add columns from the second data frame to the first data frame.
# The columns are added to the right of the first data frame.

#TODO
# load the flights dataset using the data() function


#TODO
# Load the airlines dataset using the data() function


#TODO
# Load the weather dataset using the data() function


#TODO
# Load the planes dataset using the data() function


#TODO
# Load the airports dataset using the data() function


#TODO
# Create a subset of flights called flights2 that contains the following columns:
# year, time_hour, origin, dest, tailnum, and carrier.
# use the select() function to create the subset


#TODO
# Do a left_join() of flights2 and airlines.


#TODO
# Do a left_join() with the weather dataset.
# However, only keep the origin, time_hour, temp, and wind_speed columns from
# the weather dataset.
# Use the select() function to create the subset from the weather dataset.



#TODO
# Do a left_join() of flights2 and planes.
# However, only keep the tailnum, type, engines, and seats columns from the
# planes dataset.
# Use the select() function to create the subset from the planes dataset.


## Specifying keys ----
# By default, the left_join() function uses all the columns that are common
# between the two data frames as the keys.
# However, you can specify the keys to use for the join.
# We use the join_by() function to specify the keys to use for the join.

#TODO
# Do a left_join() of flights2 and planes.
# use the join_by() function to specify tailnum as the key to use for the join.


# Notice the year.y column in the output.
# This column contains the year from the planes dataset.
# This column is added to the flights2 dataset because the tailnum column is
# not unique in the planes dataset.

# To rename the year.y column, we can use the rename() function.
#TODO
# Follow after me with the code


# join_by(tailnum) is equal to join_by(tailnum == tailnum)
# You can join the the flights2 and airports datasets either by dest or by origin

#TODO
# Do a left_join() of flights2 and airports.
# use the join_by() function and join the two datasets through dest and faa


#TODO
# Repeat the last TODO but join the two datasets through origin and faa



## Filtering joins ----
# Filtering joins filter the rows of the first data frame based on the values of
# the keys in the second data frame.

# There are two types
# semi_join() - keeps the rows in the first data frame that have a match in the
# second data frame
# anti_join() - keeps the rows in the first data frame that do not have a match
# in the second data frame

#TODO
# Do a semi_join() between airports and flights2.
# use the join_by() function and join the two datasets through dest and faa


#TODO
# Do a anti_join() between flights2 and airports.
# use the join_by() function and join the two datasets through dest and faa
# use the distinct() function to remove duplicate dest rows
# distinct() is a function that removes duplicate rows from a data frame.

