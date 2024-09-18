function [matrix] = initialize_weights(L_prev, L_next)
  %calculare epsilon
  epsilon = sqrt(6) / sqrt(L_prev + L_next);

  %creare matrice cu elemente random
  matrix = rand(L_next, L_prev + 1) * 2 * epsilon - epsilon;
endfunction
