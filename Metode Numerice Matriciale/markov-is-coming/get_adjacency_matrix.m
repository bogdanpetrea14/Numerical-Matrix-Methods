function [Adj] = get_adjacency_matrix (Labyrinth)
  % Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  [m, n] = size(Labyrinth);
  Adj = zeros(m * n + 2, m * n + 2);
  for i = 1 : m
    for j = 1 : n
      aux = dec2bin(Labyrinth(i,j), 4);
      if aux(1) == '0'
        if i == 1
          Adj(j, m * n + 1) = 1;
        else
          Adj((i - 1) * n + j, (i - 2) * n + j) = 1;
          Adj((i - 2) * n + j, (i - 1) * n + j) = 1;
        endif
      endif
      if aux(2) == '0'
        if i == m
          Adj((m - 1) * n + j, m * n + 1) = 1;
        else
          Adj((i - 1) * n + j, i * n + j) = 1;
          Adj(i * n + j, (i - 1) * n + j) = 1;
        endif
      endif
      if aux(3) == '0'
        if j == n
          Adj((i - 1) * n + j, m * n + 2) = 1;
        else
          Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
          Adj((i - 1) * n + j + 1, (i - 1) * n + j) = 1;
        endif
      endif
      if aux(4) == '0'
        if j == 1
          Adj((i - 1) * n + j, m * n + 2) = 1;
        else
          Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1;
          Adj((i - 1) * n + j - 1, (i - 1) * n + j) = 1;
        endif
      endif
      Adj(m * n + 2, m * n + 2) = 1;
      Adj(m * n + 1, m * n + 1) = 1;
    endfor
  endfor
endfunction
