function [Adj] = get_adjacency_matrix(Labyrinth)
    [m n] = size(Labyrinth);

    %determinare numar linkuri
    nr_links = 0;
    for i = 1:m
      for j = 1:n
        nr_links = nr_links + sum(bitget(Labyrinth(i,j),1:4));
      endfor
    endfor

    %alocare matrice adiacenta
    Adj = spalloc(m*n + 2, m*n +2, nr_links + 2);

    %formare matrice adiacenta
    for i = 1:m
      for j = 1:n
        bin = bitget(Labyrinth(i,j),1:4);

        %nord
        if (bin(4) == 0)
          if (i == 1)
            %win
            Adj(j + (i-1)*n, m*n + 1) = 1;
          else
            Adj(j + (i-1)*n, j + (i-2)*n) = 1;
          endif
        endif

        %sud
        if (bin(3) == 0)
          if (i == m)
            %win
            Adj(j + (i-1)*n, m*n + 1) = 1;
          else
            Adj(j + (i-1)*n, j + i*n) = 1;
          endif
        endif

        %est
        if (bin(2) == 0)
          if (j == n)
            %lose
            Adj(j + (i-1)*n, m*n + 2) = 1;
          else
            Adj(j + (i-1)*n, (j+1) + (i-1)*n) = 1;
          endif
        endif

        %vest
        if (bin(1) == 0)
          if (j == 1)
            %lose
            Adj(j + (i-1)*n, m*n + 2) = 1;
          else
            Adj(j + (i-1)*n, (j-1) + (i-1)*n) = 1;
          endif
        endif

      endfor
    endfor

    %win-win si lose-lose
    Adj(m*n + 1, m*n + 1) = 1;
    Adj(m*n + 2, m*n + 2) = 1;

endfunction
