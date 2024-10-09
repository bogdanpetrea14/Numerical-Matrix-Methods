function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  
  %get Theta1 and Theta2 from params
  s1 = input_layer_size;
  s2 = hidden_layer_size;
  s3 = output_layer_size;
  Theta1 = reshape(params(1 : (s2 * (s1 + 1))), s2, s1 + 1);
  Theta2 = reshape(params((1 + s2 * (s1 + 1) : end)), s3, s2 + 1);

  %initializing variables
  [m, n] = size(X);
  J = 0;

  %forward propagation
  a1 = [ones(m, 1) X];
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2 = [ones(m, 1), a2];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);
  %compute cost
  y_matrix = zeros(size(y, 1), s3);
  y_matrix = eye(s3)(y,:);
  op1 = sum(sum(y_matrix .* log(a3) + (1-y_matrix) .* log(1-a3)));
  op2 = (sum(sum(Theta1(:, 2 : end) .^ 2)) + sum(sum(Theta2(:, 2 : end) .^ 2)));
  J = (-1/m) * op1  + (lambda/(2*m)) * op2

  %perform backpropagation
  delta3 = a3 - y_matrix;
  oper1 = delta3 * Theta2;
  oper2 = a2 .* (1 - a2);
  delta2 = oper1 .* oper2;

  Delta1 = delta2' * a1;
  Delta1 = Delta1(2 : end, :);
  Delta2 = delta3' * a2;
  Theta1_grd = (1 / m) * Delta1 + (lambda / m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2 : end)];
  Theta2_grd = (1 / m) * Delta2 + (lambda / m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2 : end)];

  %unroll gradients
  grad = [Theta1_grd(:); Theta2_grd(:)];
endfunction
