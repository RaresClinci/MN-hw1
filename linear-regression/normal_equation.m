function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  %calculam A si b
  A = FeaturesMatrix' * FeaturesMatrix;
  b = FeaturesMatrix' * Y;
  [n n] = size(A);

  %initializam Theta
  Theta = zeros(n,1);

  %verificam daca A pozitiv definita
  if (all(eig(A)>0))
    %gradientul conjugat
    r = b - A * Theta;
    v = r;
    tolsq = tol * tol;
    k = 1;
    while (k < iter && r' * r > tolsq)
      t = r' * r/(v' * A * v);
      Theta = Theta + t * v;
      rp = r;
      r = r - t * A * v;
      s = r' * r/(rp' * rp);
      v = r + s * v;
      k = k + 1;
    endwhile
  endif

  %adaugam Theta0
  Theta = [0 Theta']';
endfunction
