function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function
  sum = 0;
  Error = linear_regression_cost_function(Theta, Y, FeatureMatrix);
  for i = 2:length(Theta)
    sum = sum + Theta(i)^2;
  endfor
  Error = Error + lambda * sum;

endfunction