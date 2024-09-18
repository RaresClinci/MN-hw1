function [Th1, Th2] = parse_theta(params, input_layer_size, hidden_layer_size, output_layer_size)
  %lungimi
  l = length(params');
  s1 = hidden_layer_size * (input_layer_size + 1);

  %parsarea efectiva
  Th1 = reshape(params(1:s1), hidden_layer_size, input_layer_size + 1);
  Th2 = reshape(params(s1+1:l), output_layer_size, hidden_layer_size + 1);
endfunction
