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
exercise_plan <- function(weight, height, sex, age, target_weight, number_of_days, return_graph = FALSE) {
  # Compute daily calorie loss, assume the lowest activity level
  calorie_loss_projection <- project_calories(weight, height, sex, age, 1.2, target_weight, number_of_days, return_graph = FALSE)

  # Use target consumption to calculate the daily activity level
  target_calorie_consumption <- 2200 # heuristic
  calorie_consumption_each_day <- target_calorie_consumption - calorie_loss_projection
  if (calorie_consumption_each_day < 0) {
    stop("Calorie consumption out of range, please verify your numbers")
  }

  # Selected activities simplified and computed from here, it is on per minute:
  # https://www.nutristrategy.com/activitylist4.htm
  activities <- c(
    "Leisure cycling or walking" = 330 / 60,
    "Moderate rope-jumping" = 800 / 60,
    "General running" = 630 / 60,
    "Leisure swimming" = 450 / 60
  )

  # Calculate daily activity needed, on an "or" manner
  activity_time <- round(calorie_consumption_each_day / activities)
  names(activity_time) <- names(activities)

  if (return_graph) {
    df <- data.frame(
      "Activity" = names(activity_time),
      "Time" = activity_time
    )
    fig <- plotly::plot_ly(
      data = df,
      x = ~Time,
      y = ~Activity,
      type = "bar"
    )
    fig <- fig |>
      plotly::layout(
        title = "Recommended Daily Activities",
        xaxis = list(title = "Activity"),
        yaxis = list(title = "Time, in Minutes")
      )
    fig
  } else {
    activity_time
  }
}
