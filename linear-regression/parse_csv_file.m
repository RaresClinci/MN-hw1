function [Y, InitialMatrix] = parse_csv_file(file_path)
  %citim fisierul
  s = fileread(file_path);

  %impartim pe linii
  c = strsplit(s,'\n');
  %eliminam antetul
  c = c(1, 2:end);
  m = length(c);

  %impartim in coloane
  A = cell(m,13);
  for i=1:m
    A(i, 1:end) = strsplit(c{1,i},',');
  endfor

  %extragem Y
  Y = zeros(m,1);
  for j=1:m
    Y(j) = str2num(A{j,1});
  endfor

  %convertim tringuri cu numere in numere
  B = cell(m,13);
  for i=1:13
    if(all(isstrprop(A{1,i},'digit')) == 1)
      for j=1:m
        B(j,i) = str2num(A{j,i});
      endfor
    else
      B(:,i) = A(:,i);
    endif
  endfor

  %extragem InitialMatrix
  InitialMatrix = B(:,2:end);
endfunction