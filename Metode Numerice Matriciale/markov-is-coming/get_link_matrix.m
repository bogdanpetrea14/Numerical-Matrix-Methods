function [Link] = get_link_matrix (Labyrinth)
  % Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  [m, n] = size(Labyrinth);
  Link = zeros(m * n + 2, m * n + 2);
  for i = 1 : m
    for j = 1 : n
      aux = dec2bin(Labyrinth(i,j), 4);
      z = sum(aux == '0');
      if aux(1) == '0'
        if i == 1
          Link(j, m * n + 1) = 1 / z;
        else
          Link((i - 1) * n + j, (i - 2) * n + j) = 1 / z;
        endif
      endif
      if aux(2) == '0'
        if i == m
          Link((m - 1) * n + j, m * n + 1) = 1 / z;
        else
          Link((i - 1) * n + j, i * n + j) = 1 / z;
        endif
      endif
      if aux(3) == '0'
        if j == n
          Link((i - 1) * n + j, m * n + 2) = 1 / z;
        else
          Link((i - 1) * n + j, (i - 1) * n + j + 1) = 1 / z;
        endif
      endif
      if aux(4) == '0'
        if j == 1
          Link((i - 1) * n + j, m * n + 2) = 1 / z;
        else
          Link((i - 1) * n + j, (i - 1) * n + j - 1) = 1 / z;
        endif
      endif
      Link(m * n + 2, m * n + 2) = 1;
      Link(m * n + 1, m * n + 1) = 1;
    endfor
  endfor
endfunction
