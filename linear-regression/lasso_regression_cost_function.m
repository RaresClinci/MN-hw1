function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  [m n] = size(FeMatrix);
  len = length(Theta);

  %functia h, ignoram Theta0 = 0
  h = FeMatrix * Theta(2:len);

  %functia de cost
  Error = 1/m * (Y - h)' * (Y - h) + lambda * norm(Theta, 1);
endfunction
