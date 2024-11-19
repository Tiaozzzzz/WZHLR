
<!-- README.md is generated from README.Rmd. Please edit that file -->

# WZHLR

<!-- badges: start -->

[![R-CMD-check](https://github.com/Tiaozzzzz/WZHLR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Tiaozzzzz/WZHLR/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/Tiaozzzzz/WZHLR/branch/main/graph/badge.svg?token=TOKEN)](https://app.codecov.io/gh/Tiaozzzzz/WZHLR)
<!-- badges: end -->

The goal of WZHLR is to fit linear regression model with intercept
assuming the LINE(Linearity, Independence, Normality, Equal Variance)
Assumptions are satisfied. The observations with missingness will be
removed. The function will return parameter estimates, standard errors,
estimated residual variance, t-values, f-value, r-squared and adjusted
r-squared.

## Installation

You can install the development version of WZHLR from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Tiaozzzzz/WZHLR")
```

## Example

This is a basic example which shows you how to use the function
fit_linear_regression:

``` r
library(WZHLR)
library(MASS)

## basic example 1
Y = c(2,4,6,8)
X = c(0.5,0.7,1.6,2.2)
fit_linear_regression(Y,X)
#> $coefficients
#>               [,1]
#> Intercept 1.031746
#>           3.174603
#> 
#> $sigma2
#> [1] 0.4761905
#> 
#> $std_errors
#> Intercept           
#> 0.7160472 0.5019488 
#> 
#> $t_values
#>               [,1]
#> Intercept 1.440891
#>           6.324555
#> 
#> $f_value
#> [1] 40
#> 
#> $r_squared
#> [1] 0.952381
#> 
#> $adjusted_r_squared
#> [1] 0.9285714

## basic example 2

testdata = MASS::Cars93
fit_linear_regression(testdata$Price,testdata[,c("Horsepower","Luggage.room")])
#> $coefficients
#>                    [,1]
#> Intercept    -5.8165895
#> Horsepower    0.1468293
#> Luggage.room  0.3195321
#> 
#> $sigma2
#> [1] 37.85014
#> 
#> $std_errors
#>    Intercept   Horsepower Luggage.room 
#>   3.33389230   0.01434673   0.24432313 
#> 
#> $t_values
#>                   [,1]
#> Intercept    -1.744684
#> Horsepower   10.234340
#> Luggage.room  1.307826
#> 
#> $f_value
#> [1] 66.63209
#> 
#> $r_squared
#> [1] 0.6278223
#> 
#> $adjusted_r_squared
#> [1] 0.6184
```
