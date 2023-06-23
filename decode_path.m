function [decoded_path] = decode_path(path, lines, cols)
    % Initialize the decoded_path matrix with zeros
    decoded_path = zeros(length(path), 2);
    
    % Decode each state in the path
    for i = 1:length(path)
        % Compute the row and column indices of the state
        row = ceil(path(i) / cols);
        col = mod(path(i) - 1, cols) + 1;
        
        % Store the row and column indices in decoded_path
        decoded_path(i, :) = [row, col];
    end
    
    % Remove the last state (WIN state) from decoded_path
    decoded_path = decoded_path(1:end-1, :);
endfunction
 