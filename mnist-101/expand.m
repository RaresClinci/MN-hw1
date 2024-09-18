function Y = expand(y)
  %functie de expandare a lui y
  len = length(y');
  Y = zeros(10, len);
  for i=1:len
    Y(y(i,1), i) = 1;
  endfor
endfunction
