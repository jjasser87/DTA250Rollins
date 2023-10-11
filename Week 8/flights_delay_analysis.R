# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Getting an insight from nycflights13 dataset ----

## Preaparing the environment ----

# Loading dplyr
library(dplyr)

# Downloading and loading the nycflights13 library
install.packages("nycflights13")
library(nycflights13)

# Loading the flights dataset
data(flights) 

## Data Cleaning ----
# In this section, we will clean the data by removing NA values and
# creating a smaller subset of the data

# Checking how many na values are in dep_delay and arr_delay
sum(is.na(flights$dep_delay))
sum(is.na(flights$arr_delay))

# Check the number of rows in flights before removing na values
nrow(flights)

# Remove na values from dep_delay and arr_delay
flights <- flights |> filter(!is.na(dep_delay) & !is.na(arr_delay))

# If you noticed, we used the |> operator to pipe the flights dataset
# instead of using the %>% operator. The |> operator is the same as the
# %>% operator. The |> operator is a new operator that was introduced in
# R 4.1.0. The |> operator is more efficient than the %>% operator.
# The |> operator is also easier to read than the %>% operator.
# The |> operator is not part of the tidyverse. The |> operator is part
# of base R.
# However, still a majority of R users are using R 4.0.5 or older.
# So, %>% is still used more than |>.
# You will come across both operators in the wild. So, it is important
# to know both operators.
# At one point, the |> operator will replace the %>% operator.

# Check the number of rows in flights after removing na values
nrow(flights)

# Creating a smaller subset of the data
delay_data <- flights |> select(month, dep_delay, arr_delay)

# Group by month
delay_month_group <- delay_data |>
  group_by(month) |>
  summarize(avg_dep_delay = mean(dep_delay), avg_arr_delay = mean(arr_delay))
# The delay_month_group name is effective that it literally tells us what
# the data is about. Make sure to name your variables effectively.

## Plotting ----

# load ggplot2
library(ggplot2)

# Creating a line chart
ggplot(data = delay_month_group, aes(x=month)) +
  geom_line(aes(y=avg_dep_delay))

# This is ugly.
# Let us try different type of plot

# Creating bar plots
ggplot(data = delay_month_group, aes(x=month)) +
  geom_col(aes(y=avg_dep_delay))

# Running into issues. We need to convert the month column into a factor

delay_month_group <- delay_month_group |> 
  mutate(month_factor = factor(month))

# Plot again
ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_dep_delay))

# This is better. But still not good enough.
# I can convey more information by adding a "season" column

## Data Manipulation ----

# Creating the season column

# In the code below, we are using the ifelse() function to create the season
# column. The ifelse() function takes three arguments. The first argument is
# the condition. The second argument is the value to return if the condition
# is true. The third argument is the value to return if the condition is false.
# Below is a nested ifelse() function. The first ifelse() function checks if
# the month is in the vector c(1,2,12). If it is, then the value "Winter" is
# returned. If it is not, then the second ifelse() function is executed. The
# second ifelse() function checks if the month is in the vector c(3,4,5). If
# it is, then the value "Spring" is returned. If it is not, then the third
# ifelse() function is executed. The third ifelse() function checks if the
# month is in the vector c(6,7,8). If it is, then the value "Summer" is
# returned. If it is not, then the value "Fall" is returned.
delay_month_group <- delay_month_group |> 
  mutate(
    season = 
           ifelse(month %in% c(1,2,12), "Winter",
                  ifelse(month %in% 3:5, "Spring",
                         ifelse(month %in% 6:8, "Summer", "Fall")))
    )

# Plot again with season as filler

ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_dep_delay, fill=season)) +
  labs(
    title="Average departure delay by season",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
    )

# Plot for average arrival delay

ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_arr_delay, fill=season)) +
  labs(
    title="Average arrival delay by season",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
  )

## Combining the plots together ----

# We can combine the plots together using the patchwork package

# installing patchwork
install.packages("patchwork")

# loading patchwork
library(patchwork)

# Assign the plots to variables
p1 <- ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_dep_delay, fill=season)) +
  ylim(NA, 25) +
  labs(
    title="Average departure delay by season",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
  )

p2 <- ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_arr_delay, fill=season)) +
  ylim(NA, 25) +
  labs(
    title="Average arrival delay by season",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
  )

# Combine the plots
combined_plot <- p1 / p2
# above, we are using the / operator to combine the plots.
# We can also use the + operator to combine the plots.
# The + operator will place the plots side by side.
# The / operator will place the plots on top of each other.

# Print the combined plot
print(combined_plot)

## Insight ----
# The insight we can get from the plots is that the average departure and
# arrival delay is lower in the Fall and higher in the Summer.
# This makes sense because the Summer is the busiest season for airports.
# The Fall is the least busiest season for airports.
# In other words, if you want to avoid delays, then you should travel
# during the Fall.
# This insight is only for the city of New York. We cannot generalize this
# insight to all airports in the United States. We can only generalize this
# insight to all airports in the United States if we have data for all or
# the majority of airports in the United States.
# We can also use the insight to improve the airport system. For example,
# we can hire more staff during the Summer to reduce the average departure
# delay and average arrival delay.
