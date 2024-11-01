# Create a function that generate a random whole number between 1 and 100.
# Then create a guessing game where the user has to guess the number.

# Load the tidyverse package
library(tidyverse)

# Create an empty data frame to store the results
# The column names are "Number", "Attempts", and "Score"
results <- data.frame(Number = numeric(),
                      Attempts = numeric(),
                      Score = numeric())

# Function to generate a random number between 1 and 100
generate_number <- function() {
  return(sample(1:100, 1))
}

# Create a function that takes the random number, number of attempts,
# and the score as arguments and stores them in the results data frame
store_results <- function(number, attempts, score) {
    results <<- results |>
        add_row(Number = number, Attempts = attempts, Score = score)
    
}

# Function to play the guessing game
guessing_game <- function() {
  number <- generate_number()
  guess <- -1
  attempts <- 0
  score <- 100
  while (guess != number) {
    guess <- as.integer(readline("Guess the number (between 1 and 100): "))
    if (guess < number) {
      print("Try Higher!.")
    } else if (guess > number) {
      print("Try Lower!.")
    }
    attempts <- attempts + 1
  }
  print("Congratulations! You guessed the number")
  score <- score / attempts
  print(score)

  store_results(number, attempts, score)
}

# Play the guessing game
start_game <- function() {
  play <- TRUE
  while (play) {
    guessing_game()
    response <- readline("Do you want to play again? (y/n): ")
    if (!response | response == "n") {
      play <- FALSE
    }
  }
}

# Start the game
start_game()
