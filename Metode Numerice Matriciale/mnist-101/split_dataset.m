function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  idx = randperm(size(X, 1));
  X = X(idx, :);
  y = y(idx, :);
  aux = floor(size(X, 1) * percent);
  X_train = X(1 : aux, :);
  y_train = y(1 : aux, :);
  X_test = X(aux + 1 : end, :);
  y_test = y(aux + 1 : end, :);
end
