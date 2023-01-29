test_that("function calculates the correct caloric intake", {
  expect_equal(round(project_calories(weight=68, height=1.83, sex=2, age=27, pal=1.6, target_weight=65, number_of_days=30), digits = 2), 2334.29)
  expect_equal(round(project_calories(weight=90, height=1.90, sex=1, age=30, pal=1.2, target_weight=25, number_of_days=40), digits = 2), 674.77)
  expect_equal(round(project_calories(weight=55, height=1.23, sex=2, age=19, pal=1.4, target_weight=45, number_of_days=25), digits = 2), 1421.68)
})

test_that("function returns the correct weight loss trajectory", {
  fig <- project_calories(weight=68, height=1.83, sex=2, age=27, pal=1.6, target_weight=65, number_of_days=30, return_graph=TRUE)
  expect_true(class(fig)[2] == "htmlwidget")
  expect_false(is.null(fig$x$attrs))
  expect_false(is.null(fig$x$layout))
})

test_that("function handles exceptions properly", {
  expect_error(project_calories(weight=None, height=1.83, sex=2, age=27, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=68, height=None, sex=2, age=27, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=68, height=1.83, sex=None, age=27, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=68, height=1.83, sex=2, age=None, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=68, height=1.83, sex=2, age=27, pal=None, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=68, height=1.83, sex=2, age=27, pal=1.6, target_weight=None, number_of_days=30))
  expect_error(project_bmi())
})

test_that("function handles negative or zero inputs properly", {
  expect_error(project_calories(weight=-2, height=1.83, sex=2, age=27, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=63, height=0, sex=2, age=27, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=63, height=1.83, sex=3, age=27, pal=1.6, target_weight=65, number_of_days=30))
  expect_error(project_calories(weight=63, height=1.83, sex=2, age=0, pal=1.6, target_weight=65, number_of_days=30))
})