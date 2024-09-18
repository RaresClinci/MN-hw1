function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m n] = size(InitialMatrix);
  aux = zeros(m, 2);

  %initializare FeatureMatrix
  FeatureMatrix = zeros(m,1);
  k = 1;

  for i=1:n
      if (iscellstr(InitialMatrix(1,i)) == 1)
        if (strncmp(InitialMatrix{1,i},"yes",3) == 1 || strncmp(InitialMatrix{1,i},"no",2) == 1)
          %yes or no
          aux(:,1) = strncmp(InitialMatrix(:,i), "yes",3);
          FeatureMatrix = [FeatureMatrix aux(:,1)];
        else
          if (strncmp(InitialMatrix(1,i), "semi-furnished",14) == 1 || strncmp(InitialMatrix(1,i), "unfurnished",11) == 1
                || strncmp(InitialMatrix(1,i), "furnished",9) == 1)
            %furnished
            aux(:,1) = strncmp(InitialMatrix(:,i), "semi-furnished",14);
            aux(:,2) = strncmp(InitialMatrix(:,i), "unfurnished",11);
            FeatureMatrix = [FeatureMatrix aux];
            k++;
          else
            %numere reale
            double = str2double(InitialMatrix(:,i));
            FeatureMatrix = [FeatureMatrix double];
          endif
        endif
       else
        %numere naturale
        num = cell2mat(InitialMatrix(:,i));
        FeatureMatrix = [FeatureMatrix num];
       endif
       k++;
  endfor

  %eliminare coloana de 0
  FeatureMatrix = FeatureMatrix(:,2:k);

endfunction
