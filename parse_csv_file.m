function [Y, InitialMatrix] = parse_csv_file(file_path)
  % Open the specified file for reading
  fid = fopen(file_path, 'r');
  
  % Read the contents of the file into a cell array
  csv = textscan(fid, '%s', 'delimiter', '\n');
  
  % Exclude the first line (headers) from the cell array
  csv = csv{1}(2:end);
  
  % Close the file
  fclose(fid);
  
  % Compute the number of rows and columns in the data matrix
  m = length(csv);
  n = numel(strsplit(csv{1}, ','));
  n = n - 1;
  
  % Initialize the label vector and data matrix
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  % Loop over each line of the file and extract the label and data
  for i = 1:m 
    % Extract the label from the first column and convert it to a double
    Y(i) = str2double(strsplit(csv{i}, ','){1});
    
    % Extract the data from the remaining columns and store in the matrix
    InitialMatrix(i, :) = strsplit(csv{i}, ',')(2:end);
  endfor

endfunction          
