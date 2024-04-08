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

# Create a subset where HouseCosts is more than 6K

hc6k <- acs |>
  filter(HouseCosts > 6000)

# Tile plot of NumChildren compared to NumWorkers
ggplot(data = hc6k, aes(x = as.factor(NumChildren), 
                        y = as.factor(NumWorkers))) +
  geom_tile(aes(fill = Income)) +
  labs(x = "Number of Children", y = "Number of Workers")

# Tile plot of NumVehicles compared to NumWorkers
ggplot(data = hc6k, aes(x = as.factor(NumVehicles), 
                        y = as.factor(NumWorkers))) +
  geom_tile(aes(fill = Income)) +
  labs(x = "Number of Vehicles", y = "Number of Workers")

# A Scatter plot between FamilyIncome and Insurance
ggplot(data = hc6k, aes(x = FamilyIncome, y = Insurance)) +
  geom_point(aes(color = Income)) +
  geom_vline(xintercept = 150000, color = "red", linetype=2) +
  geom_point(data = hc6k |>
               filter(FamilyIncome < 75000 & Insurance > 6000),
             shape = "circle open", size = 3, color = "red")

hc6k |> filter(FamilyIncome < 75000 & Insurance > 6000)