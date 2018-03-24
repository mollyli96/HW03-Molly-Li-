#title: hw03 
#desceuption:writing function,documenting functions with Roxygen comments, using conditionals,using loops
#author: Molly Li
#date: 3/21/2018


# Important Restrictions
# In order to practice writing loops (e..g. for loops), you will have to assume that R does not provide vectorized operations. For example, if you have a numeric vector x <- c(1, 2, 3, 4, 5) and you need to add 2 to each element in x, you will need to write a for loop:
# =================================
# Assume that R is not vectorized
# =================================
# input vector
x <- c(1,2,3,4,5)
# output vector
y <- rep(0,5)
# iterations
for (i in 1:length(x)) {
  y[i] <- x[i] + 2
}
y

# Function is_integer()
# Write a function is_integer() that tests if a numeric value can be considered to be an integer number (e.g. 2L or 2). This function should return TRUE if the input can be an integer, FALSE otherwise. Hint: the modulo operator %% is your friend (see ?'%%' for more info). Assume that the input is always a single number.
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
is_integer <- function(x) {
  if (x %% 1 == 0) {
    return(TRUE)
  }  else {
    return(FALSE)
  }
}
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)
is_integer(2.1)
is_integer(pi)
is_integer(0.01)

# Function is_positive()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
is_positive <- function(x) {
  if (x > 0) {
    return(TRUE)
  } 
  else {
    return(FALSE)
  }
}
is_positive(0.01)
is_positive(2)
is_positive(-2)
is_positive(0)

# Function is_nonnegative()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
is_nonnegative <- function(x) {
  if (x >= 0) {
    return(TRUE)
  } 
  else {
    return (FALSE)
  }
}
is_nonnegative(0)
is_nonnegative(2)
is_nonnegative(-0.00001)
is_nonnegative(-2)

# Function is_positive_integer()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
is_positive_integer <- function(x) {
  if (is_integer(x) == TRUE & is_positive(x) == TRUE) {
    return(TRUE)
  } 
  else {
    return(FALSE)
  }
}
is_positive_integer(2)
is_positive_integer(2L)
is_positive_integer(0)
is_positive_integer(-2)

# Function is_nonneg_integer()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
is_nonneg_integer <- function(x) {
  if (is_nonnegative(x) == TRUE & is_integer(x) == TRUE) {
    return(TRUE)
  } 
  else {
    return(FALSE)
  }
}
is_nonneg_integer(0)
is_nonneg_integer(1)
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)

# Function is_probability()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
is_probability <- function(p) {
  if (p >= 0 & p <= 1) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
is_probability(0)
is_probability(0.5)
is_probability(1)
is_probability(-1)
is_probability(1.0000001)

# Function bin_factorial()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
bin_factorial <- function(n){
  if (n < 0 | n %% 1 != 0) {
    return(NA)
  }
  else if(n == 0) {
    return(1)
  } 
  else {
    x <- 1
    for(i in 1:n){
      x <-x*((1:n)[i])
    }
    return(x)
  }
}
bin_factorial(5)
bin_factorial(0)

# Function bin_combinations()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
bin_combinations <- function(n,k) {
  y <- (bin_factorial(n)) / ((bin_factorial(k))*(bin_factorial(n-k)))
  return(y)
}
bin_combinations(n = 5, k = 2)
bin_combinations(10, 3)
bin_combinations(4, 4)

# Function bin_probability()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
bin_probability <- function(trials, success, prob) {
  if(!is_nonneg_integer(trials)) {
    stop("trials must be nonnegative")
  } 
  if(!is_nonneg_integer(success)) {
    stop("success must be nonnegative")
  } 
  if(!is_probability(prob)) {
    stop("probability must be between 0 and 1")
  } 
  (bin_combinations(trials, success)) * ((prob)^success) * ((1-prob)^(trials-success))
}
bin_probability(trials = 5, success = 2, prob = 0.5)

# Function bin_distribution()
#' @title area of rectangle
#' @description calculates the area of a rectangle
#' @param len length of the rectangle (numeric)
#' @param wid width of the rectangle (numeric)
#' @return computed area
bin_distribution <- function(trials, prob) {
  m <- rep(0, trials + 1)
  success <- rep(0, trials + 1)
  for (i in 0:trials) {
    success[i+1] <- success[i+1] + i
    m[i+1] <- bin_probability(trials, success[i+1],prob)
    df <- data.frame(success, probability = m)
  }
  return(df)
}
bin_distribution (trials = 5, prob = 0.5)