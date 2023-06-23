function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
    % initialize path with start position
    path = start_position;
    
    % initialize visited array
    visited = zeros(size(probabilities));
    visited(start_position) = 1;
    
    % iterate until path is empty
    while ~isempty(path)
        % get current position
        position = path(end);
        
        % check if position is the WIN state
        if probabilities(position) == 1
            return;
        endif
        
        % check if position has unvisited neighbors
        adjacent = find(Adj(position,:));
        unvisited_adjacent = adjacent(~visited(adjacent));
        
        if isempty(unvisited_adjacent)
            % backtrack to the previous position
            path(end) = [];
        else
            % select unvisited neighbor with highest probability
            [~, idx] = max(probabilities(unvisited_adjacent));
            next = unvisited_adjacent(idx);
            
            % add next to the path and mark it as visited
            path = [path, next];
            visited(next) = 1;
        endif
    endwhile
    
    % no path found
    path = [];
endfunction

