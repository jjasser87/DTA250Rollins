# Analyzing the number of enrollees in Medicare in Florida

# Load readxl
library(readxl)

# load tidyverse
library(tidyverse)

# Load map data for Florida counties
fl_counties <- map_data("county", "florida") |>
    select(lon = long, lat, group, county = subregion)

# Read in the Excel data
df <- read_excel("Week 10/Medicare_enrollees_2014.xls")
# Notice that the file path is relative to the location of the R file
# on my computer. On your computer, you will need to change the path
# to the location of the file on your computer.
# Or, you can use the import dataset button in the Environment tab
# to import the data into RStudio.

# Filter for Florida
fl_enrollees <- df |>
    filter(state_county |> str_starts("FL"))
# In the above code, the str_starts() function is used to filter
# for counties in Florida. The function str_starts() returns TRUE
# if the string starts with the specified pattern. In this case,
# the pattern is "FL", which is the abbreviation for Florida.

# Create a new column with the county name
fl_enrollees <- fl_enrollees |>
    mutate(county = state_county |> str_sub(4, -8) |> str_to_lower())
# In the above code, the str_sub() function is used to extract the
# county name from the state_county column. The str_sub() function
# returns a substring of a string.
# As an example, consider the string "Hello Word". The substring
# from the 1st to the 5th character is "Hello". The substring from
# the 7th to the 11th character is "World".
# The str_to_lower() function is used to convert the county name
# to lower case.

# Better explanation of str_sub()
#   1   2  3  4  5  6  7  8  9  10  11
#   H   e  l  l  o     W  o  r   l   d
# -11 -10 -9 -8 -7 -6 -5 -4 -3  -2  -1

# Notice that space is also a character

test <- "Hello World"
test |> str_sub(1, 5)
test |> str_sub(7, 11)

# Let us check the negative indices
test |> str_sub(-11, -7)
test |> str_sub(-5, -1)

# Let us try a mix of positive and negative indices
test |> str_sub(1, -1)
test |> str_sub(-11, 11)
test |> str_sub(-11, -1)
test |> str_sub(4, -2)

# ENOUGH ABOUT str_sub()

# Check if there are any implicit missing values in fl_enrollees
fl_counties |>
    anti_join(fl_enrollees, join_by(county)) |>
    distinct(county)
# It seems there are implicit values?

# Let us do one more test to make sure

# Check number of unique counties in fl_enrollees
fl_enrollees |> 
    distinct(county) |> 
    nrow()

# Check number of unique counties in fl_counties
fl_counties |> 
    distinct(county) |> 
    nrow()

# Same number of counties.
# Check if there are counties with different names

# Yes. There are counties with different names

# desoto is written as de soto in fl_enrollees. There is space between de and soto
# st johns in written as st. johns in fl_enrollees. There is a period between st and johns
# st lucie is written as st. lucie in fl_enrollees. There is a period between st and lucie

# Fix the names of de soto, st johns, and st lucie
fl_enrollees <- fl_enrollees |>
    mutate(
      county = county |> 
        str_replace_all("desoto", "de soto") |> 
               str_replace_all("st. johns", "st johns") |> 
               str_replace_all("st. lucie", "st lucie")
      )
# In the above code, the str_replace_all() function is used to replace
# all occurrences of a pattern with a replacement string.
# In the above code, the pattern is "desoto" and the replacement string
# is "de soto". The str_replace_all() function replaces all occurrences
# of "desoto" with "de soto". Same for the other patterns

# Check for implicit values again
fl_counties |>
    anti_join(fl_enrollees, join_by(county)) |>
    distinct(county)

# No implicit missing or different values


# Join the data with a left_join()
counties_enrollees <- fl_counties |>
    left_join(fl_enrollees |>
                  select(enrollees, county))

# Plot
ggplot(data = counties_enrollees, aes(x = lon, y = lat, group = county)) +
    geom_polygon(aes(fill = enrollees)) +
    coord_quickmap()

# We need to better communicate the data

# Find the top 5 counties with the most enrollees
top_counties <- fl_enrollees |> 
    slice_max(enrollees, n = 5) |>
    pull(county)
# In the above code, the slice_max() function is used to select the
# top 5 counties with the most enrollees. The pull() function is used
# to extract the county names from the data frame, and store them in
# a vector.

# Get the average coordinates for the top 5 counties
counties_coord <- counties_enrollees |>
    filter(county %in% top_counties) |> 
    group_by(county) |> 
    summarize(lon = mean(lon), lat = mean(lat))
# We are getting the average lon and lat for the top 5 counties
# so that we can figure out where to place the labels on the map plot.


# Plot Again. This time with labels
ggplot(data = counties_enrollees, aes(x = lon, y = lat, group = county)) +
    geom_polygon(aes(fill = enrollees)) +
    coord_quickmap() +
    # Add label for county with most enrollees
    geom_text(data = counties_coord, aes(x = lon, y = lat, label = county), 
              color = "red", size = 5)
# The geom_text() function is used to add text to the plot.
# The data argument is used to specify the data frame that contains
# the data for the labels. The aes() function is used to specify
# the x and y coordinates for the labels, and the text for the labels.
# The color argument is used to specify the color of the labels.
# The size argument is used to specify the size of the labels.
