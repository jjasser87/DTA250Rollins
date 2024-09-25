# Load the tidyverse library
library(tidyverse)

# Load the patchwork library
library(patchwork)

# Read the wine csv file
df <- read_csv("Week 12/winemag-data_first150k.csv")

# Filter country to be US
USdf <- df |>
  filter(country == "US")

# Load the US map
us_map <- map_data("state")

# We need to convert the province names in USdf into lower case
# to match the names in us_map
USdf <- USdf |>
  mutate(state = tolower(province))

# Get the state, point and price column from USdf
USdf <- USdf |>
  select(state, points, price)

# Get the long, lat, group, region columns from us_map
us_map <- us_map |>
  select(lon = long, lat, group, state = region)

# Group the states for a better performance
USdf_group <- USdf |> group_by(state) |> 
  summarise(avg_point = mean(points), avg_price = mean(price, na.rm=TRUE))

# Create a subset of us_map where state is in USdf state
us_wine_map <- us_map |> 
  filter(state %in% USdf_group$state) |> 
  left_join(USdf_group)

# Plot the US map with the average points
points_plot <- ggplot() +
  geom_polygon(data = us_map, aes(x=lon, y=lat, group=group)) +
  geom_polygon(data = us_wine_map, aes(x=lon, y=lat, group=group, fill=avg_point)) +
  coord_quickmap() +
  labs(title = "US Wine by Points", x="", y="")

# Plot the US map with the average price
price_plot <- ggplot() +
  geom_polygon(data = us_map, aes(x=lon, y=lat, group=group)) +
  geom_polygon(data = us_wine_map, aes(x=lon, y=lat, group=group, fill=avg_price)) +
  coord_quickmap() +
  labs(title = "US Wine by Price", x="", y="")

# Combine the two plots together
points_plot + price_plot

# Finding the correlation between points and price for the states of
# California, Oregon and Washington

p <- ggplot(data = USdf |>
         filter(state %in% c("california", "oregon", "washington") & 
                  price < 200), 
       aes(x=price, y=points)) +
  geom_point(
    color="black",
    fill="#69b3a2",
    shape=22,
    alpha=0.5,
    size=0.5,
    stroke = 1
  ) +
  theme_ipsum() +
  geom_smooth(method = "lm") +
  scale_x_log10() +
  labs(x = "Price", 
       y="Points", 
       color="State", 
       title="Correlating Price and Points")


# with marginal histogram
p1 <- ggMarginal(p, type="histogram")

# Plotting the distribution of points and price for the states of
# California, Oregon and Washington
# Boxplots and Violin plots

# For the price

boxes <- ggplot(data = USdf |> 
                  filter(state %in% c("california", "oregon", "washington") & 
                           price < 100), 
                aes(x=state, y=price)) +
  geom_point() +
  geom_boxplot(aes(fill = state)) +
  labs(
    title = "Price of wine in California, Oregon and Washington",
    x = "State",
    y = "Price",
    fill = "State"
  )

violins <- ggplot(data = USdf |>
                    filter(state %in% c("california", "oregon", "washington") & 
                             price < 100), 
                  aes(x=state, y=price)) +
  geom_point() +
  geom_violin(aes(fill = state)) +
  labs(
    title = "Price of wine in California, Oregon and Washington",
    x = "State",
    y = "Price",
    fill = "State"
  )

# For the points

boxes2 <- ggplot(data = USdf |> 
                   filter(state %in% c("california", "oregon", "washington") & 
                            price < 100), 
                 aes(x=state, y=points)) +
  geom_point() +
  geom_boxplot(aes(fill = state)) +
  labs(
    title = "Points of wine in California, Oregon and Washington",
    x = "State",
    y = "Point",
    fill = "State"
  )

violins2 <- ggplot(data = USdf |>
                     filter(state %in% c("california", "oregon", "washington") & 
                              price < 100), 
                   aes(x=state, y=points)) +
  geom_point() +
  geom_violin(aes(fill = state)) +
  labs(
    title = "Points of wine in California, Oregon and Washington",
    x = "State",
    y = "Point",
    fill = "State"
  )

# Plot them all together

(boxes + violins) / (boxes2 + violins2)

