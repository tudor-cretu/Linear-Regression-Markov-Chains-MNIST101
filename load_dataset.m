function [X, y] = load_dataset(path)
  % load the .mat file
  data = load(path);
  
  % extract the training examples and their corresponding labels
  X = data.X;
  y = data.y;
endfunction
