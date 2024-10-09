function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  file = fopen(file_path);
  a = fscanf(file_path, "%d%d", [1, 2]);
  m = a(1);
  n = a(2);
  trash = fgetl(file);
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);
  for i = 1 : m
    line = fgetl(file);
    aux = strsplit(line, " ");
    Y(i, 1) = str2num(aux{1});
    for j = 1 : n
      InitialMatrix{i, j} = aux{1, j + 1};
    endfor
  endfor
  fclose(file);
endfunction