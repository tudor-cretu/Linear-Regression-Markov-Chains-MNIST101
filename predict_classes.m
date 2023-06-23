function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter
  
  % Extracting the weights for the layers
  W1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
  W2 = reshape(weights((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));

  m = size(X, 1);
  a1 = [ones(m, 1) X];
  z2 = a1 * W1';
  a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
  z3 = a2 * W2';
  a3 = sigmoid(z3);

  [~, classes] = max(a3, [], 2);

endfunction
