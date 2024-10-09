function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  [n, m] = size(FeatureMatrix);
  Theta = Theta(2 : end, 1);
  aux = FeatureMatrix * Theta - Y;
  Error = (1 / (2 * n)) * sum(aux.^2) + lambda * sum(Theta.^2);
endfunction