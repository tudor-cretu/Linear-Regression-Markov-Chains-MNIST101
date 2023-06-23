function [Link] = get_link_matrix(Labyrinth)
    % This function takes in a matrix representing a labyrinth and computes its
    % link matrix. The link matrix is a matrix representing a graph where each
    % cell in the matrix is considered a node and each connection between cells
    % represents an edge. The matrix is a square matrix of size n*m+2 where n and
    % m are the number of rows and columns of the labyrinth matrix, respectively,
    % and there are two extra nodes that represent the source and sink nodes of
    % the graph. For each node in the graph, the matrix stores the probability of
    % moving from the current node to another node based on the number of
    % available edges.
    Link = get_adjacency_matrix(Labyrinth);
    Link = double(Link);
    [m, n] = size(Link);
    Labyrinth = double(Labyrinth);
    vector = zeros(1, m);
    for i = 1:m
        for j = 1:n
            if Link(i, j) == 1
                vector(1, i) += 1;
            endif
        endfor
    endfor
    for i = 1:m
        for j = 1:n
            if Link(i, j) == 1
                Link(i, j) = 1 / vector(1, i);
            endif
        endfor
    endfor
endfunction
