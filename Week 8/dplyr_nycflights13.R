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

## Analyzing delayed departure and arrival flights by month ----

# Remove na values from dep_delay and arr_delay
flights <- flights |> filter(!is.na(dep_delay) & !is.na(arr_delay))

# Creating a smaller subset of the data
delay_data <- flights |> select(month, dep_delay, arr_delay)

# Group by month
delay_month_group <- delay_data |>
  group_by(month) |>
  summarize(avg_dep_delay = mean(dep_delay), avg_arr_delay = mean(arr_delay))

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

# Creating the season column

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
    title="Average departure delay by month",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
    )

# Plot for average arrival delay

ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_arr_delay, fill=season)) +
  labs(
    title="Average arrival delay by month",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
  )

## Combining the plots together ----

# installing patchwork
install.packages("patchwork")

# loading patchwork
library(patchwork)

# Assign the plots to variables
p1 <- ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_dep_delay, fill=season)) +
  ylim(NA, 25) +
  labs(
    title="Average departure delay by month",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
  )

p2 <- ggplot(data = delay_month_group, aes(x=month_factor)) +
  geom_col(aes(y=avg_arr_delay, fill=season)) +
  ylim(NA, 25) +
  labs(
    title="Average arrival delay by month",
    x = "Month",
    y = "Average Delay",
    fill = "Season"
  )

# Combine the plots
combined_plot <- p1 / p2

print(combined_plot)

