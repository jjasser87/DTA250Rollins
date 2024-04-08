# Load the tidyverse package
library(tidyverse)

# Load the acs dataset from the acs.csv file either using code or the 
# Import Dataset button in the Environment pane

p1 <- ggplot(data = acs, aes(x = FamilyIncome)) +
  geom_histogram() +
  geom_vline(xintercept = 150000, color = "red", linetype=2) +
  labs(x = "Family Income", y = "Count")

p2 <- ggplot(data = acs, aes(x = FamilyIncome)) +
  geom_density(fill = "grey50") +
  geom_vline(xintercept = 150000, color = "red", linetype=2) +
  labs(x = "Family Income", y = "Density")

library(patchwork)
p1 + p2

ggplot(data = acs, aes(x = Income)) +
  geom_bar()

# Create a historgram of the HouseCosts
ggplot(data = acs, aes(x = HouseCosts)) +
  geom_histogram()

ggplot(data = acs, aes(x = HouseCosts)) +
  geom_histogram(aes(fill = Income), position = "dodge")

# Create a density plot of the HouseCosts
ggplot(data = acs, aes(x = HouseCosts)) +
  geom_density(aes(fill = Income), alpha=0.5)