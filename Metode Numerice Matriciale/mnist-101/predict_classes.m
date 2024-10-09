function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter
  
  % TODO: predict_classes implementation
  s1 = input_layer_size;
  s2 = hidden_layer_size;
  s3 = output_layer_size;
  Theta1 = reshape(weights(1 : (s2 * (s1 + 1))), s2, s1 + 1);
  Theta2 = reshape(weights((1 + s2 * (s1 + 1) : end)), s3, s2 + 1);
  [m, n] = size(X);
  X = [ones(m, 1) X];

  z2 = Theta1 * X';
  a2 = sigmoid(z2);
  a2 = [ones(1, m); a2];

  z3 = Theta2 * a2;
  a3 = sigmoid(z3);
  [~, classes] = max(a3, [], 1);
  classes = classes';
endfunction
