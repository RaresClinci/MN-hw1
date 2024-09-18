function [Link] = get_link_matrix(Labyrinth)

    [m n] = size(Labyrinth);

    %formare matrice
    Link = get_adjacency_matrix(Labyrinth);
    for i = 1:m*n + 2
      s = sum(Link(i,:));
      if (s ~= 0)
        Link(i,:) = Link(i,:)/s;
      endif
    endfor

  endfunction
