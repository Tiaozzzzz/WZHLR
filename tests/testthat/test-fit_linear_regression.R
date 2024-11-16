test_that("fit_linear_regression works", {
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$coefficients[1],4), -0.7559)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$coefficients[2],4), 3.4646)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$r_squared,4), 0.9528)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$adjusted_r_squared,4), 0.9291)

})
