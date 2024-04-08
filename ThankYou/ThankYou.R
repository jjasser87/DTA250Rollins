library(tidyverse)

df <- read.csv("ThankYou/ThankYou.csv")

df <- df |> mutate(group2 = sample(1:9, nrow(df), replace=TRUE))


ggplot(data = df, aes(x=x, y=y)) +
    geom_tile(aes(fill = as.factor(group2)))

ggplot(data = df, aes(x=x, y=y)) +
  geom_tile(aes(fill = group2))

ggplot(data = df, aes(x=x, y=y)) +
  geom_tile(aes(fill = group))
