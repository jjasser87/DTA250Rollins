library(tidyverse)
library(palmerpenguins)

# The palmerpenguins dataset uses body_mass_g and bill_length_mm.
penguins_clean <- penguins |>
  select(body_mass_g, bill_length_mm, bill_depth_mm, flipper_length_mm, sex) |>
  drop_na() |>
  mutate(
    sex = str_to_lower(sex),
    sex = factor(sex, levels = c("female", "male"))
  )

# Linear regression: predict body mass from bill and flipper measurements.
body_mass_model <- lm(
  body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm,
  data = penguins_clean
)

print("Linear regression summary:")
print(summary(body_mass_model))

# Logistic regression: predict whether a penguin is male or female.
sex_model <- glm(
  sex ~ bill_length_mm + bill_depth_mm + flipper_length_mm,
  data = penguins_clean,
  family = binomial
)

print("Logistic regression summary:")
print(summary(sex_model))

# Add predictions back to the dataset.
penguin_predictions <- penguins_clean |>
  mutate(
    predicted_body_mass_g = predict(body_mass_model, newdata = penguins_clean),
    probability_male = predict(sex_model, newdata = penguins_clean, type = "response"),
    predicted_sex = if_else(probability_male >= 0.5, "male", "female")
  )

print("First six predicted rows:")
print(head(penguin_predictions))
