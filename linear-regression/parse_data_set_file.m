function [Y, InitialMatrix] = parse_data_set_file(file_path)
  in = fopen(file_path, "r");
  
  %citim dimensiunile
  sz = fscanf(in,"%d%d",[1 2]);
  m = sz(1);
  n = sz(2);
  fclose(in);

  %citim fisierul
  s = fileread(file_path);

  %impartim pe linii
  c = cell(m,1);
  c = strsplit(s,'\n');
  %eliminam antetul
  c = c(1, 2:m+1);
  
  %impartim in coloane
  A = cell(m,n+1);
  for i=1:m
    A(i, 1:n+1) = strsplit(c{1,i},' ');
  endfor

  %extragem Y
  Y = zeros(m, 1);
  for j=1:m
    Y(j) = str2num(A{j,1});
  endfor

  %convertim tringuri cu numere in numere
  B = cell(m,n);
  for i=1:n+1
    if(all(isstrprop(A{1,i},'digit')) == 1)
      for j=1:m
        B(j,i) = str2num(A{j,i});
      endfor
    else
      B(:,i) = A(:,i);
    endif
  endfor

  %extragem InitialMatrix
  InitialMatrix = B(:,2:n+1);
endfunction