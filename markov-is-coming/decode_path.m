function [decoded_path] = decode_path(path, lines, cols)
  n = length(path');

  %eliminam starea de win
  path = path(1:n-1, 1);
  n = n-1;

  decoded_path = zeros(2, n);
  decoded_path = zeros(2, n);

  %linia
  decoded_path(1, :) = floor((path - 1 )/ cols) + 1;
  %coloana
  decoded_path(2, :) = mod(path - 1, cols) + 1;

  decoded_path = decoded_path';
endfunction
