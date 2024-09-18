function [path] = heuristic_greedy(start_position, probabilities, Adj)
    [n n] = size(Adj);

    %initializare path
    path = zeros(1, n-2);
    path = [start_position];
    len = 1;
    %bordare probabilitati cu WIN si LOOSE
    probabilities = [probabilities', [1 0]]';

    %initializare vector de visitati
    visited = zeros(1, n);
    visited(start_position) = 1;

    while (len != 0)
      pos = path(len);
      %s-a ajuns la starea de castig
      if (Adj(path(len), n-1) == 1)
        path = [path n-1];
        path = path';
        return;
      endif

      %vector cu vecinii celulei curente
      neigh = nonzeros(Adj(pos, :) .* [1:n]);
      if (prod(visited(neigh)) != 0)
        %tori vecinii au fost vizitai
        pos = 0;
        len = len-1;
      else
        %determinarea vecinului cu probabilitate maxima de castig
        s = length(neigh);
        max = 0;
        for i=1:s
          if (visited(neigh(i)) == 0)
            if (max < probabilities(neigh(i)))
              max = probabilities(neigh(i));
              p = neigh(i);
            endif
          endif
        endfor

        %adaugare vecin la path
        visited(p) = 1;
        path = [path, p];
        len = len+1;
      endif
    endwhile
    path = path';
    return;
endfunction
