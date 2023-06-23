function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  
  % Reshape into the Theta1 and Theta2
  Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));

  m = size(X, 1);
  J = 0;
  T1_grad = zeros(size(Theta1));
  T2_grad = zeros(size(Theta2));

  a1 = [ones(m, 1) X];
  z2 = a1 * Theta1';
  a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);

  % Create a binary matrix 'y_vector' where each row corresponds to the label y for each training example
  y_vector = eye(output_layer_size)(y, :);
  % Compute cost
  cost = -y_vector .* log(a3) - (1 - y_vector) .* log(1 - a3);
  J = (1/m) * sum(sum(cost));

  % Regularize cost
  reg = (lambda/(2*m)) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));
  J = J + reg;

  % Backward propagation
  d3 = a3 - y_vector;
  d2 = (d3 * Theta2(:, 2:end)) .* sigmoid(z2) .* (1 - sigmoid(z2));  % <- Fixed the parentheses here

  % Accumulate gradients
  Delta1 = (d2' * a1);
  Delta2 = (d3' * a2);
  
  T1_grad = (1 / m) * Delta1;
  T2_grad = (1 / m) * Delta2;

  % Compute gradients
  T1_grad = (1/m) * Delta1 + (lambda/m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
  T2_grad = (1/m) * Delta2 + (lambda/m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

  % Unroll gradients
  grad = [T1_grad(:); T2_grad(:)];

endfunction
