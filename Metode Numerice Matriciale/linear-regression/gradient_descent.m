function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  Theta = zeros(n, 1);
  for i = 1 : iter
    aux = FeatureMatrix * Theta;
    err = aux - Y;
    Theta = Theta - alpha * (1 / m) * (FeatureMatrix' * err);
  endfor
  Theta = [0; Theta];
endfunction
