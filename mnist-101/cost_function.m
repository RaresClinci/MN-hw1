 function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)
  [n m] = size(X);

  % formarea matricilor theta
  [Th1 Th2] = parse_theta(params, input_layer_size, hidden_layer_size, output_layer_size);

  %expansiune y
  Y = expand(y);

  %calcularea forward propagation
  a1 = [ones(n, 1) X]';
  z2 = Th1 * a1;
  a2 = sigmoid(z2);
  a2 = [ones(n,1) a2']';
  z3 = Th2 * a2;
  a3 = sigmoid(z3);

  %initializare delta
  delta1= zeros(size(Th1));
  delta2= zeros(size(Th2));

  %calculare backward propagation
  d3 = a3 - Y;
  delta2 = delta2 + d3 * a2';
  %eliminam linia de bias
  Prod = Th2' * d3;
  Prod = Prod(2:hidden_layer_size+1, :);
  d2 = Prod .* sigmoid_deriv(z2);
  delta1 = delta1 + d2 * a1';

  %gradientii
  Grad1 = 1/n * delta1;
  Grad1(:, 2:end) += lambda/n * Th1(:, 2:end);
  Grad2 = 1/n * delta2;
  Grad2(:, 2:end) += lambda/n * Th2(:, 2:end);

  %formare gradient
  grad = Grad1(:)';
  grad = [grad Grad2(:)'];

  %eliminam bias-ul din theta
  Th1 = Th1(:, 2:end);
  Th2 = Th2(:, 2:end);

  %vectorizam matricile din functia de cost pentru optimizare
  Y = Y(:);
  a3 = a3(:);
  Th1 = Th1(:);
  Th2 = Th2(:);

  %functia de cost
  J = (1/n) * (-Y' * log(a3) - (1 - Y)' * log(1 - a3))...
      + lambda/(2*n) * (Th1' * Th1 + Th2' * Th2);
  grad = grad';
  endfunction
