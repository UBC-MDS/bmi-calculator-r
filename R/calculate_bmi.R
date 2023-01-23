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
calculate_bmi <- function(weight, height, return_graph=FALSE) {
  bmi <- weight / (height^2)
  if (return_graph == FALSE) {
    return(bmi)
  } else {
    fig <- plot_ly(
      type = "indicator",
      mode = "gauge+number+delta",
      value = bmi,
      title = list(text = "Body Mass Index", font = list(size = 24)),
      delta = list(reference = 25, increasing = list(color = "Pink")),
      gauge = list(
        axis = list(range = list(NULL, 50), tickwidth = 1, tickcolor = "black"),
        bar = list(color = "red"),
        bgcolor = "white",
        borderwidth = 2,
        bordercolor = "black",
        steps = list(
          list(range = c(0, 18.5), color = "lightblue"),
          list(range = c(18.5, 25), color = "lightgreen"),
          list(range = c(25, 30), color = "lightyellow"),
          list(range = c(30, 35), color = "orange"),
          list(range = c(35, 50), color = "Pink"))))
    fig <- fig %>%
      layout(
        font = list(color = "darkblue", family = "Arial"))
    return(fig)
  }
}