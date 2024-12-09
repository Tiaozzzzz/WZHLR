test_that("fit_linear_regression works", {
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$coefficients[1],4), 0.7559)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$coefficients[2],4), 3.4646)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$r_squared,4), 0.9528)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$adjusted_r_squared,4), 0.9291)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$f_value,2), 40.33)
  expect_equal(round(as.numeric(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$std_errors[1]),4), 0.7515)
  expect_equal(round(as.numeric(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$std_errors[2]),4), 0.5455)
  expect_equal(round(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$sigma2,4), 0.4724)
  expect_equal(round(as.numeric(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$t_values[1]),3), 1.006)
  expect_equal(round(as.numeric(fit_linear_regression(c(2,4,6,8), c(0.5,0.9,1.3,2.2))$t_values[2]),3), 6.351)
})
