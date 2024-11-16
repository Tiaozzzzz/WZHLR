
fit_linear_regression = function(Y, X, Intercept = TRUE){
  
  Y = as.matrix(Y)
  X = as.matrix(X)
  complete_index = union(which(complete.cases(Y)),which(complete.cases(X)))
  Y = as.matrix(Y[complete_index,])
  X = as.matrix(X[complete_index,])
  
  n = dim(X)[1]
  p = dim(X)[2]
  
  if(Intercept){
  intercept_col = rep(1,n)
  X = cbind(intercept_col,X)
  p = p + 1
  }
  
  beta = solve(t(X) %*% X) %*% t(X) %*% Y
  residual = Y - X %*% beta
  sigma_square = t(residual) %*% residual / (n-p)
  covariance_matrix = solve(t(X) %*% X) * as.numeric(sigma_square)
  std_errors = sqrt(diag(covariance_matrix))
  t_values = beta / std_errors
  p_values = 2 * (1 - pt(abs(t_values), n-p))
  
  return(list(
    coefficients = beta,
    sigma2 = sigma_square,
    std_errors = std_errors,
    t_values = t_values,
    p_values = p_values
  ))
  
  }












