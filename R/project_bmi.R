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
  
  # check for input types
  if (!(is.numeric(weight) & is.numeric(height) &
        is.logical(return_graph) & is.numeric(target_bmi)
        & is.numeric(number_of_days))) {
    stop("TypeError! Please check the type of input parameters carefully!")
  }
  
  # check for positive input values
  if (!(weight > 0 & height > 0 & target_bmi > 0  & number_of_days > 0)) {
    stop("ValueError! Please enter a positive non-zero input")
  }
  
  # BMI change computation
  current_bmi = weight / height^2
  bmi_change = target_bmi - current_bmi
  bmi_change_per_day = bmi_change / number_of_days
  
  # return computation or graph
  if (return_graph == FALSE){
    return (round(bmi_change_per_day * 7, digits = 2))
  } 
  else {
    df = data.frame(
      "Days" = seq(1, number_of_days),
      "BMI" =  seq(current_bmi, target_bmi,  bmi_change_per_day)[1:number_of_days])
    
    df
    fig <- plotly::plot_ly(df, x = ~Days, y = ~BMI, type = 'scatter', mode = 'lines')
    
    fig <- fig |> plotly::layout(title = "Projected BMI Trajectory",
                                 xaxis = list(title = "Days"),
                                 yaxis = list (title = "BMI"))
    return(fig)
  }
  
}