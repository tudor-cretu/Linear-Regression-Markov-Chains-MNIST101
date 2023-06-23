function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)

  Error = 0;
  Theta = Theta(2:end);
  % Get number of training examples (m)
  m = size(FeatureMatrix, 1);

  
  % Compute hypothesis (predictions) for all training examples
  for i = 1: m
    H = (FeatureMatrix(i,:) * Theta - Y(i))^2;

    % Compute error (difference between predictions and actual values)
    Error = Error + H;
  endfor
  % Compute cost function using mean squared error
  Error = (1/(2*m)) * Error;

endfunction