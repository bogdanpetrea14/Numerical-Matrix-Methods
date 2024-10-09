function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  Y = FeatureMatrix' * Y;
  FeatureMatrix = FeatureMatrix' * FeatureMatrix;
  [~, l] = chol(FeatureMatrix);
  if l != 0
    [m, n] = size(FeatureMatrix);
    Theta = zeros(n + 1, 1);
    return;
  endif
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n, 1);
  r = Y;
  v = r;
  tolsq = tol * tol;
  k = 1;
  while (k <= iter) && (r' * r >= tolsq)
    t = (r' * r) / (v' * FeatureMatrix * v)
    Theta = Theta + t * v
    r_old = r;
    r = r_old - t * FeatureMatrix * v
    s = (r' * r) / (r_old' * r_old)
    v_old = v;
    v = r + s * v_old
    k = k + 1;
  endwhile
  Theta = [0; Theta];
endfunction