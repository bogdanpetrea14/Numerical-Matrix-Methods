function [decoded_path] = decode_path (path, lines, cols)
  	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  	%                 corresponding to path states
  	% hint: decoded_path does not contain indices for the WIN state
  
  how = length(path) - 1; %length(path) - 1 -> the WIN state it is not included
  decoded_path = zeros(how, 2);
  for i = 1 : how
	auli = floor(path(i) / (cols + 1)) + 1; % auli = aux for line
	auco = mod(path(i), cols); % auc0 = aux for columns
	if auco == 0
		auco = cols;
	endif
	decoded_path(i, 1) = auli;
	decoded_path(i, 2) = auco;
  endfor
endfunction