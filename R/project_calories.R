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
#' project_calories(100, 1.85, 1, 25, 1.6, 75, 25, return_graph=FALSE)
#' 2417.04
#' 
project_calories <- function(weight, height, sex, age, pal, target_weight, number_of_days, return_graph=FALSE) {
  # Ensuring that inputs are valid
  if (!(is.numeric(weight) || 
        is.numeric(height) || 
        is.numeric(age) || 
        is.numeric(pal) ||
        is.numeric(target_weight) || 
        is.numeric(number_of_days) ||
        is.logical(return_graph))) {
    stop("TypeError! Please check carefully on the type of input parameters!")
  }
  
  if (weight <= 0 || height <= 0 || age <= 0 || target_weight <= 0 || number_of_days <= 0) {
      stop("ValueError! Please check your input values and ensure that they are appropriate.")}
  
  if (!(pal %in% list(1.2, 1.4, 1.6, 1.75))) {
    stop("ValueError! Please enter either 1.2, 1.4, 1.6, or 1.75 as a value for pal")
  }
  
  if (target_weight > weight) {
    stop("This application is for weight loss only. Please enter a target weight that is lower than your current weight")
  }
  
  # Calories per day calculation
  if (sex ==1) {
    BMR <- 66.47 + (13.75*weight) + (5.003*(height*100)) - (6.755*age)
  } else if (sex == 2) {
    BMR <- 665.1 + (9.563 * weight) + (1.85 * (height * 100)) - (4.676 * age)
  } else {
    stop("TypeError! Please enter either 1 for male or 2 for female as a sex value")
  }
  
  calories_sustain_weight <- BMR * pal
  calories_lose_weight <- (weight - target_weight) * (1100 / number_of_days)
  
  calories_per_day <- calories_sustain_weight - calories_lose_weight
  
  if (return_graph == FALSE) {
    return (calories_per_day)
  } else {
    df <- data.frame(Days = seq(number_of_days), 
                     Weight = seq(weight, target_weight, length.out = number_of_days))
    fig <- plotly::plot_ly(data = df, 
                    x=~Days, 
                    y=~Weight, 
                    type="scatter",
                    mode="lines",
                    text="Projected Weight Loss") |>
      layout(title="Projected Weight Loss", yaxis = list(range=c(target_weight - 5, weight + 5)))
    return (fig)
    }
}
