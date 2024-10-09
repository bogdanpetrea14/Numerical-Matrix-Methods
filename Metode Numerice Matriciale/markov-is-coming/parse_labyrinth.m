function [Labyrinth] = parse_labyrinth(file_path)
  % file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  file = fopen(file_path, "r");
  line = fgetl(file);
  line = str2num(line);
  cont = 1;
  m = line(1, 1);
  n = line(1, 2);
  Labyrinth = zeros(m, n);
  for i = 1 : m
    line = fgetl(file);
    line = str2num(line);
    for j = 1 : n
      Labyrinth(i, j) = line(1, j);
    endfor
  endfor
  fclose(file);
endfunction
