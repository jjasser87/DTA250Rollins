# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Introduction to RStudio ----

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
