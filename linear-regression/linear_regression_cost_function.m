 function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
   [m n] = size(FeatureMatrix);
   l = length(Theta);

   %functia h, ignoram Theta0 = 0
   h = FeatureMatrix * Theta(2:l);

   %functia de cost
   Error = (h - Y)' * (h - Y)/(2*m);
 endfunction
