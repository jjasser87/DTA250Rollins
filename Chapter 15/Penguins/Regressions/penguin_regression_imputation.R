library(tidyverse)
library(palmerpenguins)

# Start with the original penguins data, which contains some missing values.
penguins_imputed <- penguins |>
  mutate(
    sex = str_to_lower(sex),
    sex = if_else(sex %in% c("female", "male"), sex, NA_character_)
  )

# -------------------------------------------------------------------------
# Linear regression imputation for missing body_mass_g
# -------------------------------------------------------------------------

# Use rows with complete predictor values and known body mass to train the model.
body_mass_training <- penguins_imputed |>
  select(body_mass_g, bill_length_mm, bill_depth_mm, flipper_length_mm) |>
  drop_na()

body_mass_imputation_model <- lm(
  body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm,
  data = body_mass_training
)

# Predict body mass only for rows where body_mass_g is missing but the
# predictor variables are available.
body_mass_missing_rows <- is.na(penguins_imputed$body_mass_g) &
  !is.na(penguins_imputed$bill_length_mm) &
  !is.na(penguins_imputed$bill_depth_mm) &
  !is.na(penguins_imputed$flipper_length_mm)

penguins_imputed$body_mass_g[body_mass_missing_rows] <- predict(
  body_mass_imputation_model,
  newdata = penguins_imputed[body_mass_missing_rows, ]
)

# -------------------------------------------------------------------------
# Logistic regression imputation for missing sex
# -------------------------------------------------------------------------

# Use rows with known sex and complete predictor values to train the model.
sex_training <- penguins_imputed |>
  select(sex, bill_length_mm, bill_depth_mm, flipper_length_mm) |>
  drop_na() |>
  mutate(sex = factor(sex, levels = c("female", "male")))

sex_imputation_model <- glm(
  sex ~ bill_length_mm + bill_depth_mm + flipper_length_mm,
  data = sex_training,
  family = binomial
)

# Predict sex only for rows where sex is missing but the predictors are present.
sex_missing_rows <- is.na(penguins_imputed$sex) &
  !is.na(penguins_imputed$bill_length_mm) &
  !is.na(penguins_imputed$bill_depth_mm) &
  !is.na(penguins_imputed$flipper_length_mm)

predicted_probability_male <- predict(
  sex_imputation_model,
  newdata = penguins_imputed[sex_missing_rows, ],
  type = "response"
)

penguins_imputed$sex[sex_missing_rows] <- if_else(
  predicted_probability_male >= 0.5,
  "male",
  "female"
)

penguins_imputed <- penguins_imputed |>
  mutate(
    sex = factor(sex, levels = c("female", "male"))
  )

# -------------------------------------------------------------------------
# Quick summary of the imputation work
# -------------------------------------------------------------------------

body_mass_imputed_count <- sum(body_mass_missing_rows)
sex_imputed_count <- sum(sex_missing_rows)

print("Linear regression imputation summary:")
print(summary(body_mass_imputation_model))

print("Logistic regression imputation summary:")
print(summary(sex_imputation_model))

print("Number of body_mass_g values imputed:")
print(body_mass_imputed_count)

print("Number of sex values imputed:")
print(sex_imputed_count)

print("Rows with imputed values:")
print(
  penguins_imputed |>
    filter(body_mass_missing_rows | sex_missing_rows) |>
    select(species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex)
)
