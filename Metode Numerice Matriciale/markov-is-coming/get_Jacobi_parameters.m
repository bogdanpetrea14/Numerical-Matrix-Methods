function [G, c] = get_Jacobi_parameters (Link)
  % Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
  
  [m, n] = size(Link);
  m = m - 2;
  n = n - 2;
  G = Link(1 : m, 1 : n);
  c = Link(1 : m, n + 1);
endfunction
