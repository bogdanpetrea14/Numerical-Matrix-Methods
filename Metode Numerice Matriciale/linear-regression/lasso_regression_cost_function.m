function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  [n, m] = size(FeatureMatrix);
  Theta = Theta(2 : end, 1);
  aux = Y - FeatureMatrix * Theta;
  Error = (1 / n) * sum(aux.^2) + lambda * sum(abs(Theta));
endfunction