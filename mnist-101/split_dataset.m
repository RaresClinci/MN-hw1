function [x_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  [m n] = size(X);

  %determinarea ordinii elementelor
  new_order = randperm(m);
  Z = X(new_order, :);
  t = y(new_order);

  %calculare pozitie separare
  sep = floor(percent * m);

  %separare
  x_train = Z(1:sep, :);
  y_train = t(1:sep, :);
  X_test = Z(sep+1:m, :);
  y_test = t(sep+1:m, :);
endfunction
