#' Compute average BMI change per week based on current weight, height, age, 
#' and target BMI. The average BMI increase or decrease each week is computed.
#'  If `return_graph`is `TRUE`, a `ggplot` graph is given based on forcasted 
#'  BMI trajectory for the target timeframe.
#'
#' @param weight A positive numeric value of body weight value in kilograms. 
#' @param height A positive numeric value of height value in meters. 
#' @param target_bmi A positive numeric value of target BMI
#' @param number_of_days A postive integer of number of days to achieve target
#' @param return_graph TRUE or FALSE on whether to return a graphical 
#' visualization instead of a bmi value. 
#'
#' @return A numeric number of body mass index value. 
#' @export
#'
#' @examples
#' project_bmi(weight=108, height=1.88, target_bmi = 28, number_of_days=60, return_graph=FALSE)
#' 
#' -0.3

project_bmi <- function(weight, height, target_bmi, number_of_days, return_graph=FALSE) {
}