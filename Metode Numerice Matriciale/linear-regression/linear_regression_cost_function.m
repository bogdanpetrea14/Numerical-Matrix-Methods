function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  [n, m] = size(FeatureMatrix);
  Theta = Theta(2 : end, 1);
  aux = FeatureMatrix * Theta - Y;
  Error = (1 / (2 * n)) * sum(aux.^2);
endfunction