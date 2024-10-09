function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  % TODO: initialize_weights implementation
  aux = L_prev + L_next;
  epsilon = sqrt(6) / sqrt(aux);
  matrix = (rand(L_next, L_prev + 1) * 2 - 1) * epsilon;
endfunction
