function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n,1);
  for k = 1:iter
    %calculam h(x)
    h = FeatureMatrix * Theta;

    %calculam eroare
    er = h - Y;

    %calculam gradientul
    dJ = (FeatureMatrix' * er)/m;

    %determinam noul Theta
    Theta = Theta - alpha * dJ;
  endfor

  %introducem Theta 0
  Theta = [0 Theta']';
endfunction