#' Calculate caloric intake per day based in a target weight. Assumption is
#' that the goal is losing weight rather than gaining weight.
#'
#' @param weight A numeric number of current weight in kilograms (kg).
#' @param height A numeric number of current height in meters (m).
#' @param sex A numeric number for sex, used in the Harris–Benedict equation estimation, 
#' 1 for male and 2 for female 
#' @param age A numeric number for current age in years.
#' @param pal A numeric number for physical activity level, can only be one of the four listed values:
#' 1.2 for "Little/no exercise"
#' 1.4 for "Light exercise 1-3 times a week"
#' 1.6 for "Moderate exercise 3-5 times a week"
#' 1.75 for "Hard exercise 3-5 times a week"
#' @param target_weight A numeric number for weight goal to be achieved in number_of_days
#' @param number_of_days A numeric number for number of days allotted to achieve target_weight
#' @param return_graph TRUE or FALSE on whether to return a graphical visualization instead of a caloric intake value. 
#'
#' @return A float or a ggplot visualization. If `return_graph` is `False`, returns a float specifying caloric intake
#' divided by the number of days. If `return_graph` is `True`, returns a straight line graph of projected 
#' weight loss per day.
#' 
#' @export
#'
#' @examples
#' project_calories(100, 1.85, 1, 25, 1.6, 75, 25, return_graph=False)
#' 2417.0400000000004
#' 
project_calories <- function(weight, height, sex, age, pal, target_weight, number_of_days, return_graph=FALSE) {
}