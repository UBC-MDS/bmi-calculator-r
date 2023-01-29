test_that("exercise_plan calculates the plan correctly", {
  expect_equal(exercise_plan(weight=68, height=1.83, sex=2, age=27, target_weight=65, number_of_days=30)[['General running']], 45)
  expect_equal(exercise_plan(weight=80, height=1.83, sex=2, age=27, target_weight=65, number_of_days=30)[['General running']], 74)
  expect_equal(exercise_plan(weight=120, height=1.83, sex=2, age=27, target_weight=65, number_of_days=30)[['General running']], 170)
})

test_that("exercise_plan should return a graph when return_graph is TRUE", {
  graph <- exercise_plan(weight=68, height=1.83, sex=2, age=27, target_weight=65, number_of_days=30, return_graph=TRUE)
  expect_s3_class(graph, "plotly")
  expect_false(is.null(graph$x$attrs))
  expect_false(is.null(graph$x$layout))
})

test_that("exercise_plan raises error when mandatory fields are not provided", {
  expect_error(exercise_plan(weight=NULL, height=1.83, sex=2, age=27, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=68, height=NULL, sex=2, age=27, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=68, height=1.83, sex=NULL, age=27, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=68, height=1.83, sex=2, age=NULL, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=68, height=1.83, sex=2, age=27, target_weight=NULL, number_of_days=30))
  expect_error(exercise_plan(weight=68, height=1.83, sex=2, age=27, target_weight=65, number_of_days=NULL))
  expect_error(exercise_plan())
})

test_that("exercise_plan raises error when handling negative or zero inputs", {
  expect_error(exercise_plan(weight=80, height=3, sex=1, age=20, target_weight=72, number_of_days=50))
  expect_error(exercise_plan(weight=-2, height=1.83, sex=2, age=27, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=63, height=0, sex=2, age=27, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=63, height=1.83, sex=3, age=27, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=63, height=1.83, sex=2, age=0, target_weight=65, number_of_days=30))
  expect_error(exercise_plan(weight=63, height=1.83, sex=2, age=27, target_weight=-65, number_of_days=30))
  expect_error(exercise_plan(weight=63, height=1.83, sex=2, age=27, target_weight=65, number_of_days=0))
})
