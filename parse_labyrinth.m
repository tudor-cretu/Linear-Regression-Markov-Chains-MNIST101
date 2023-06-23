function [Labyrinth] = parse_labyrinth(filename)
    fid = fopen(filename, 'r');  % opens the file for reading
    m = fscanf(fid, '%d', 1);  % reads the no. of rows
    n = fscanf(fid, '%d', 1);  % reads the no. of columns
    for i = 1:m
        for j = 1:n 
            Labyrinth(i, j) = fscanf(fid, '%d', 1);  % reads the elements of the matrix
        endfor
    endfor
    fclose(fid);  % closes the file
endfunction

