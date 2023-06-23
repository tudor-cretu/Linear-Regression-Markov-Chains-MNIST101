function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  
    % Get the number of rows and columns in the initial matrix
    [m n] = size(InitialMatrix);
    
    % Initialize the feature matrix with an extra column for the bias term
    FeatureMatrix = zeros(m, n+1);
    
    % Loop over each row of the initial matrix
    for i = 1:m
        % Initialize the column index for the feature matrix
        cols_featmat = 1;
        % Loop over each column of the initial matrix
        for j = 1:n  
            % Check the value of the current element and encode it as a feature
            if strcmp(InitialMatrix(i,j), 'furnished')
                FeatureMatrix(i,cols_featmat) = 0;
                cols_featmat = cols_featmat + 1;
                FeatureMatrix(i, cols_featmat) = 0;

            elseif strcmp(InitialMatrix(i,j), 'semi-furnished')
                FeatureMatrix(i,cols_featmat) = 1;
                cols_featmat = cols_featmat + 1;
                FeatureMatrix(i, cols_featmat) = 0;

            elseif strcmp(InitialMatrix(i,j), 'unfurnished')
                FeatureMatrix(i,cols_featmat) = 0;
                cols_featmat = cols_featmat + 1;
                FeatureMatrix(i, cols_featmat) = 1;

            elseif strcmp(InitialMatrix(i, j), 'yes')
                FeatureMatrix(i,cols_featmat) = 1;

            elseif strcmp(InitialMatrix(i, j), 'no')
                FeatureMatrix(i,cols_featmat) = 0;
                
            else
                FeatureMatrix(i,cols_featmat) = str2double(InitialMatrix(i,j)); 
            endif
            
            % Move to the next column of the feature matrix
            cols_featmat = cols_featmat + 1;
        endfor
    endfor
endfunction      
