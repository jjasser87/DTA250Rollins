library(tidyverse)

library(patchwork)

df <- read_csv("Week 12/winemag-data_first150k.csv")

USdf <- df |>
  filter(country == "US")

us_map <- map_data("state")

USdf <- USdf |>
  mutate(state = tolower(province))

USdf <- USdf |>
  select(state, points, price)

us_map <- us_map |>
  select(lon = long, lat, group, state = region)

USdf_group <- USdf |> group_by(state) |> 
  summarise(avg_point = mean(points), avg_price = mean(price, na.rm=TRUE))

us_wine_map <- us_map |> 
  filter(state %in% USdf_group$state) |> 
  left_join(USdf_group)

points_plot <- ggplot() +
  geom_polygon(data = us_map, aes(x=lon, y=lat, group=group)) +
  geom_polygon(data = us_wine_map, aes(x=lon, y=lat, group=group, fill=avg_point)) +
  coord_quickmap() +
  labs(title = "US Wine by Points", x="", y="")

price_plot <- ggplot() +
  geom_polygon(data = us_map, aes(x=lon, y=lat, group=group)) +
  geom_polygon(data = us_wine_map, aes(x=lon, y=lat, group=group, fill=avg_price)) +
  coord_quickmap() +
  labs(title = "US Wine by Price", x="", y="")

points_plot + price_plot


ggplot(data = USdf |>
         filter(state %in% c("california", "oregon", "washington") & 
                  price < 100), 
       aes(x=price, y=points)) +
  geom_point(aes(color = state)) +
  geom_smooth(method = "lm") +
  labs(x = "Price", 
       y="Points", 
       color="State", 
       title="Correlating Price and Points")



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


(boxes + violins) / (boxes2 + violins2)

