#DTA250 - Fall 2023
#JJ

# Joins ----
# Joins are used to combine data from two or more data frames based on the
# values of one or more keys that are common between the data frames.

## Prerequisites ----

#TODO
# load the tidyverse package using the library() function
library(tidyverse)

#TODO
# load the nycflights13 package using the library() function
library(nycflights13)

## Basic joins ----
# There are six basic types of joins: inner, left, right, full, semi, and
# anti.

# We will focus on the left join for now.

## Mutating joins ----
# Mutating joins add columns from the second data frame to the first data frame.
# The columns are added to the right of the first data frame.

#TODO
# load the flights dataset using the data() function
data(flights)

#TODO
# Create a subset of flights called flights2 that contains the following columns:
# year, time_hour, origin, dest, tailnum, and carrier.
# use the select() function to create the subset
flights2 <- flights |>
    select(year, time_hour, origin, dest, tailnum, carrier)

#TODO
# Do a left_join() of flights2 and airlines.
flights2 |>
    left_join(airlines)

#TODO
# Do a left_join() with the weather dataset.
# However, only keep the origin, time_hour, temp, and wind_speed columns from
# the weather dataset.
# Use the select() function to create the subset from the weather dataset.
flights2 |>
    left_join(weather |>
                  select(origin, time_hour, temp, wind_speed)
              )

#TODO
# Do a left_join() of flights2 and planes.
# However, only keep the tailnum, type, engines, and seats columns from the
# planes dataset.
# Use the select() function to create the subset from the planes dataset.
flights2 |>
    left_join(planes |>
                  select(tailnum, type, engines, seats)
              )

## Specifying keys ----
# By default, the left_join() function uses all the columns that are common
# between the two data frames as the keys.
# However, you can specify the keys to use for the join.
# We use the join_by() function to specify the keys to use for the join.

#TODO
# Do a left_join() of flights2 and planes.
# use the join_by() function to specify tailnum as the key to use for the join.
flights2 |>
    left_join(planes, join_by(tailnum))

# Notice the year.y column in the output.
# This column contains the year from the planes dataset.
# This column is added to the flights2 dataset because the tailnum column is
# not unique in the planes dataset.

# To rename the year.y column, we can use the rename() function.
#TODO
# Follow after me with the code
flights2 |>
    left_join(planes, join_by(tailnum)) |>
    rename(trip_year = year.x, plane_manf_year = year.y)

# In the above code, we renamed the year.x column to trip_year and the year.y
# column to plane_manf_year.

# join_by(tailnum) is equal to join_by(tailnum == tailnum)
# You can join the the flights2 and airports datasets either by dest or by origin

#TODO
# Do a left_join() of flights2 and airports.
# use the join_by() function and join the two datasets through dest and faa
flights2 |>
    left_join(airports, join_by(dest == faa))

# In the above code, we joined the flights2 and airports datasets through dest
# and faa.

#TODO
# Repeat the last TODO but join the two datasets through origin and faa
flights2 |>
    left_join(airports, join_by(origin == faa))

# In the above code, we joined the flights2 and airports datasets through origin
# and faa. We got a different result than the previous join.


## Filtering joins ----
# Filtering joins filter the rows of the first data frame based on the values of
# the keys in the second data frame.

# There are two types
# semi_join() - keeps the rows in the first data frame that have a match in the
# second data frame
# anti_join() - keeps the rows in the first data frame that do not have a match
# in the second data frame

#TODO
# Do a semi_join() between flights2 and airports.
# use the join_by() function and join the two datasets through dest and faa
flights2 |>
    semi_join(airports, join_by(dest == faa))

# The semi_join() function is used to return all rows from flights2 where there
# is a match in airports based on the condition dest == faa. This means that
# only the rows from flights2 that have a destination airport code that
# matches an airport code in the airports data frame will be returned.

#TODO
# Do a anti_join() between flights2 and airports.
# use the join_by() function and join the two datasets through dest and faa
# use the distinct() function to remove duplicate dest rows
flights2 |>
    anti_join(airports, join_by(dest == faa)) |>
    distinct(dest)

# The anti_join() function is used to return all rows from flights2 that do not 
# have a match in the airports data frame based on the condition dest == faa. 
# This means that only the rows from flights2 that do not have a destination 
# airport code that matches an airport code in the airports data frame will be 
# returned.

# This is useful when you want to find the rows in one data frame that do not
# have a match in another data frame.
# In this case, we have implicit missing values in the airports data frame.