#' Calculate the body mass index (BMI) based on current weight and height.
#' 
#' Body Mass Index (BMI) is a calculated measure of weight relative to height,
#' defined as body weight in kilograms divided by height in meters squared
#' (Keys et al., 1972). If `return_graph` is `TRUE`, an
#' ggplot object is returned instead of a bmi value.
#'
#' @param weight A numeric number of body weight value. 
#' @param height A numeric number of height value. 
#' @param return_graph TRUE or FALSE on whether to return a graphical 
#' visualization instead of a bmi value. 
#'
#' @return A numeric number of body mass index value. 
#' @export
#'
#' @examples
#' calculate_bmi(100, 1.85, return_graph=FALSE)
#' 
#' 29.218407596785973
#' 
calculate_bmi <- function(weight, height) {
  weight <- weight
  height <- height
  weight / (height^2)
}