#' Fit a Linear Regression Model
#'
#' This function fits a linear regression model to the given response `Y` and predictors `X`.
#' @param Y : A numeric column obtained from a dataframe representing the response variable.
#' @param X : A few columns obtained from a dataframe representing predictors.
#' @return A list containing the regression coefficients and other model statistics.
#' @export
#' @examples
#' Example 1: Simple linear regression
#' Y = c(2, 4, 6, 8)
#' X = c(0.5, 0.7, 1.6, 2.2)
#' fit_linear_regression(Y, X)
#'
#' # Example 2: Cars93 data
#' testdata = MASS::Cars93
#' fit_linear_regression(testdata$Price,testdata[,c("Horsepower","Luggage.room")])
#'
#' @importFrom stats complete.cases


fit_linear_regression = function(Y, X){

  Y = as.matrix(Y)
  X = as.matrix(X)
  complete_index = intersect(which(complete.cases(Y)),which(complete.cases(X)))
  Y = as.matrix(Y[complete_index,])
  X = as.matrix(X[complete_index,])

  n = dim(X)[1]
  p = dim(X)[2] + 1

  Intercept = rep(1,n)
  X = cbind(Intercept,X)

  unit_vector = rep(1,n)
  y_bar = rep((t(unit_vector) %*% Y)/n,n)
  difference = Y-y_bar
  SSY = as.numeric(t(difference) %*% difference)

  beta = solve(t(X) %*% X) %*% t(X) %*% Y
  residual = Y - X %*% beta

  SSE = as.numeric(t(residual) %*% residual)
  SSR = SSY - SSE


  sigma_square = SSE / (n-p)
  covariance_matrix = solve(t(X) %*% X) * sigma_square
  std_errors = sqrt(diag(covariance_matrix))

  t_values = beta / std_errors
  #beta_p_values = 2 * (1 - pt(abs(t_values), n-p))
  f_value = (SSR/(p-1))/(SSE/(n-p))
  #f_p_value = 1 - pf(f_value, p-1, n-p)

  r_squared = (SSY - SSE)/SSY
  adjusted_r_squared = 1 - (SSE/(n-p))/(SSY/(n-1))

  return(list(
    coefficients = beta,
    sigma2 = sigma_square,
    std_errors = std_errors,
    t_values = t_values,
    #beta_p_values = beta_p_values,
    f_value = f_value,
    #f_p_value = f_p_value,
    r_squared = r_squared,
    adjusted_r_squared = adjusted_r_squared
  ))

}















