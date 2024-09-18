function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size);
  [n m] = size(X);

  % formarea matricilor theta
  [Th1 Th2] = parse_theta(weights, input_layer_size, hidden_layer_size, output_layer_size);

  %calcularea forward propagation
  a1 = [ones(n, 1) X]';
  z2 = Th1 * a1;
  a2 = sigmoid(z2);
  a2 = [ones(n,1) a2']';
  z3 = Th2 * a2;
  a3 = sigmoid(z3);

  %calculam classes
  [predict classes] = max(a3);
  classes = classes';
endfunction
