function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  [m, n] = size(InitialMatrix);
  if isempty(InitialMatrix{1,1})
    for k = 1 : m 
      for l = 1 : n - 1
        InitialMatrix{k, l} = InitialMatrix{k, l + 1};
      endfor
    endfor
    n = n - 1;
  endif
  FeatureMatrix = zeros(m, n + 1);
  for i = 1 : m
    for j = 1 : n
      if strcmp(InitialMatrix{i, j}, "yes") == true
        FeatureMatrix(i, j) = 1;
      elseif strcmp(InitialMatrix{i, j}, "no") == true
        FeatureMatrix(i, j) = 0;
      elseif  strcmp(InitialMatrix{i, j}, "furnished") == true
        if j + 1 == n 
          FeatureMatrix(i, j) = 0;
          FeatureMatrix(i, j + 1) = 0;
          j = j + 2;
          FeatureMatrix(i, j) = str2num(InitialMatrix{i, n});
          break;
        else
          FeatureMatrix(i, j) = 0;
          FeatureMatrix(i, j + 1) = 0;
        endif
      elseif strcmp(InitialMatrix{i, j}, "unfurnished") == true
        if j + 1 == n 
          FeatureMatrix(i, j) = 0;
          FeatureMatrix(i, j + 1) = 1;
          j = j + 2;
          FeatureMatrix(i, j) = str2num(InitialMatrix{i, n});
          break;
        else
          FeatureMatrix(i, j) = 0;
          FeatureMatrix(i, j + 1) = 1;
        endif
      elseif strcmp(InitialMatrix{i, j}, "semi-furnished") == true
        if j + 1 == n 
          FeatureMatrix(i, j) = 1;
          FeatureMatrix(i, j + 1) = 0;
          j = j + 2;
          FeatureMatrix(i, j) = str2num(InitialMatrix{i, n});
          break;
        else
          FeatureMatrix(i, j) = 1;
          FeatureMatrix(i, j + 1) = 0;
        endif
      else 
        FeatureMatrix(i, j) = str2num(InitialMatrix{i, j});
      endif
    endfor
  endfor
endfunction