test_that("Testing if function calculates the bmi correctly", {
  expect_equal(calculate_bmi(weight=108, height=1.88), 30.56)
  expect_equal(calculate_bmi(weight=50, height=1.65), 18.37)
  expect_equal(calculate_bmi(weight=250, height=1.65), 91.83)
})

test_that("Testing if function returns the bmi graph correctly", {
  fig <- calculate_bmi(weight=108, height=1.88, TRUE)
  expect_s3_class(fig, "htmlwidget")
  expect_false(is.null(fig$x$attrs))
  expect_false(is.null(fig$x$layout))
})

test_that("Testing if function handles exceptions properly", {
  expect_error(calculate_bmi(weight=NULL, height=1.65))
  expect_error(calculate_bmi(weight=100, height=NULL))
  expect_error(calculate_bmi(weight=100, height=1.65, return_graph=1))
  expect_error(calculate_bmi(weight=100, height=1.65, return_graph=0))
  expect_error(calculate_bmi())
})

test_that("Testing if function handles negative or zero inputs properly", {
  expect_error(calculate_bmi(weight=-100, height=1.65))
  expect_error(calculate_bmi(weight=100, height=-1.65))
  expect_error(calculate_bmi(weight=0, height=1.65))
  expect_error(calculate_bmi(weight=100, height=0))
})
