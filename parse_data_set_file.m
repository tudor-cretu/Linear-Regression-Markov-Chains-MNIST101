function [Y, InitialMatrix] = parse_data_set_file(file_path)

  % Open the file for reading
  fileID = fopen(file_path, 'r');
  
  % Read the matrix size
  size = fscanf(fileID, '%d %d', [1, 2]);
  m = size(1);
  n = size(2);
  Y = zeros(m, 1);
  % Initialize the InitialMatrix cell array
  InitialMatrix = cell(m, n);
  
  % Read the matrix data
  for i = 1:m
    % Read the Y value
    Y(i) = fscanf(fileID, '%f', 1);
    
    % Read the X values and store them in InitialMatrix
    for j = 1:n
      InitialMatrix{i, j} = fscanf(fileID, '%s', 1);
    endfor
  endfor
  
  % Close the file
  fclose(fileID);
  
endfunction