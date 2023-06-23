function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset

  % Calculate the number of examples to put in the training dataset
  num_examples = floor(percent * size(X, 1));
  
  % Shuffle the examples
  indices = randperm(size(X, 1));
  X = X(indices, :);
  Y = y(indices, :);
  
  % Split the shuffled examples into training and test sets
  X_train = X(1:num_examples, :);
  y_train = Y(1:num_examples, :);
  X_test = X(num_examples+1:end, :);
  y_test = Y(num_examples+1:end, :);
endfunction
