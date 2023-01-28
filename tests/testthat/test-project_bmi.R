test_that("function does not return the bmi trajectory correctly", {
  fig <- project_bmi(108, 1.87, 27, 60, return_graph=TRUE)
  expect_true(class(fig)[2] == "htmlwidget")
  expect_false(is.null(fig$x$attrs))
  expect_false(is.null(fig$x$layout))
})

test_that("function does not handle exceptions properly", {
  expect_error(project_bmi(NULL, 1.87, 27, 60, return_graph=TRUE))
  expect_error(project_bmi(108, NULL, 27, 60, return_graph=TRUE))
  expect_error(project_bmi(108, 1.87, NULL, 60, return_graph=TRUE))
  expect_error(project_bmi(108, 1.87, 27, NULL, return_graph=TRUE))
  expect_error(project_bmi(108, 1.87, 27, 60, return_graph=1))
  expect_error(project_bmi(108, 1.87, 27, 60, return_graph=0))
  expect_error(project_bmi())
})

test_that("function does not handle negative or zero inputs properly", {
  expect_error(project_bmi(-108, 1.87, 27, 60, return_graph=TRUE))
  expect_error(project_bmi(108, -1.87, 27, 60, return_graph=TRUE))
  expect_error(project_bmi(108, 1.87, 0, 60, return_graph=TRUE))
  expect_error(project_bmi(108, 1.87, 27, -60, return_graph=TRUE))
})