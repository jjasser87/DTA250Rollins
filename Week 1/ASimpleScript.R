# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Introduction to RStudio ----

#TODO
# Write your name below


# The code below is to give you a peek at the capabilities of R.
# I do not expect you to understand this code at all.
# Imagine yourself watching a trailer of a movie.
# The Exorcist trailer (https://youtu.be/jyW5YXDcIGs?si=ZNTVgGBLd1THoa1N)
# is perhaps the best at capturing the feel and premise of the movie without
# revealing much about the story. (Be careful, this trailer is disturbing)

install.packages("palmerpenguins")
install.packages("tidyverse")

library(ggplot2)
library(palmerpenguins)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm,
                y = body_mass_g,
                color = species)
) +
  geom_point()

