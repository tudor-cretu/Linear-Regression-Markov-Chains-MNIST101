function [Adj] = get_adjacency_matrix(Labyrinth)
    [m n] = size(Labyrinth);
    Labyrinth = double(Labyrinth);
    sparse = nnz(Labyrinth) / prod(size(Labyrinth));
    Adj = spalloc(n * m + 2, n * m + 2, sparse);
    Adj(n * m  + 1, n * m + 1) = 1;
    Adj(n * m + 2, n * m + 2) = 1;
    for i = 1:m
        for j = 1:n
            if bitget(Labyrinth(i,j),4) == 0
                % cell has a passage to the north
                if i == 1
                    Adj((i - 1) * n + j, m * n + 1) = 1; % connect to source node
                else
                    % connect to cell above
                    Adj((i - 1) * n + j, (i - 1) * n + j - n) = 1; 
                endif
            endif
            
            if bitget(Labyrinth(i,j),3) == 0
                % cell has a passage to the south
                if i == m
                    Adj((i - 1) * n + j, m * n + 1) = 1; % connect to sink node
                else
                    % connect to cell below
                    Adj((i - 1) * n + j, (i - 1) * n + j + n) = 1; 
                endif
            endif
            
            if bitget(Labyrinth(i,j),2) == 0
                % cell has a passage to the east
                if j == n
                    Adj((i - 1) * n + j, m * n + 2) = 1; % connect to sink node
                else
                    % connect to cell on the right
                    Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
                endif
            endif

            if bitget(Labyrinth(i,j),1) == 0
                % cell has a passage to the west
                if j == 1
                    Adj((i - 1) * n + j, m * n + 2) = 1; % connect to source node
                else
                    % connect to cell on the left
                    Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1; 
                endif
            endif
            
        endfor
    endfor
endfunction
