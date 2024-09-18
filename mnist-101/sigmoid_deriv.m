function y=sigmoid_deriv(x)
  s = sigmoid(x);
  y = s .* (1 - s);
endfunction
