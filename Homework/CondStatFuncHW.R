# Create a function that takes a temperature and check the following:
# If the temperature is greater than 90, return "It is hot!"
# If the temperature is less than 30, return "It is cold!"
# If the temperature is greater than 30 and less than 90, return "It is moderate!"

tempCheck <- function(temp){
  if(temp > 90){
    return("It is hot!")
  } else if(temp < 30){
    return("It is cold!")
  } else {
    return("It is moderate!")
  }
}

# Create a function that takes an age and check the following:
# If age is less than 13, return "child"
# If age is between 13 and 19, return "teen"
# If age is between 20 and 64, return "adult"
# If age is 65 or older, return "senior"

ageCheck <- function(age){
  if(age < 13){
    return("child")
  } else if(age >= 13 & age <= 19){
    return("teen")
  } else if(age >= 20 & age <= 64){
    return("adult")
  } else {
    return("senior")
  }
}

# Create a function that takes a user name and password and check the following:
# If the user name is "admin" or "administrator" and the password is "admin", 
# return "Welcome admin", otherwise return "Access denied"

loginCheck <- function(user, password){
  if((user == "admin" | user == "administrator") & password == "admin"){
    return("Welcome admin")
  } else {
    return("Access denied")
  }
}