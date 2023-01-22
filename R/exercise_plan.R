#' Create an exercise plan based on current weight, height, age and target BMI.
#'
#' The calorie consumption needed each day is computed and a set of activities
#' is suggested accordingly. If `return_graph` is `True`, a `ggplot` object
#' instead of a dictionary.
#'
#' @param weight A numeric vector of body weight value, in kilograms.
#' @param height A numeric vector of height, in meters.
#' @param sex An integer vector of sex, used in the Harris–Benedict equation
#'   estimation, 1 for male and 2 for female.
#' @param age An integer vector of current age, in years.
#' @param target_weight A numeric vector of target weight, in kilograms.
#' @param number_of_days An integer vector of number of days to reach the
#'   target weight.
#' @param return_graph TRUE or FALSE on whether to return a graphical 
#'   visualization instead of a dictionary. 
#' 
#' @return A dictionary of recommended exercises, or a graph plotting that
#' @export
#' 
#' @examples
#' exercise_plan(100, 1.83, 2, 27, 68, 30)
exercise_plan <- function(weight, height, sex, age, target_weight, number_of_days, return_graph=FALSE) {
    NULL
}
