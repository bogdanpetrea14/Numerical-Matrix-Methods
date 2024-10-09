function [path] = heuristic_greedy(start_position, probabilities, Adj)
    % start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
    path = start_position;
	visited = zeros(1, length(probabilities));
	visited(path) = 1;
    while (1)
        neighbors = find(Adj(path(end),:));
        if isempty(neighbors)
            return;
        endif
        [trash, index] = max(probabilities(neighbors));
        next_position = neighbors(index);
		visited(neighbors(index)) = 1;
        path = [path next_position];
        if probabilities(next_position) == 1 || probabilities(next_position) == 0
            return;
        endif
		if all(visited == 1)
			return;
		endif
    endwhile
endfunction
