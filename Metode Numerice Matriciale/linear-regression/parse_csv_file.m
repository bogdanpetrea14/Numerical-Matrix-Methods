function [Y, InitialMatrix] = parse_csv_file(file_path)
  % file_path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  file = fopen(file_path);
  auxi = strsplit(fgetl(file), ",");
  m = length(auxi);
  Y = zeros(m, 1);
  InitialMatrix = cell(1, m);
  cont = 1;
  while (1)
    line = fgetl(file);
    if line == -1
      break;
    endif
    aux = strsplit(line, ",");
    for i = 1 : m
      if i == 1
        Y(cont, 1) = str2double(aux{1, i});
      else
        InitialMatrix{cont, i} = aux{1, i};
      endif
    endfor
    cont++;
  endwhile
  fclose(file);
endfunction
