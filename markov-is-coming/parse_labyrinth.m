function [Labyrinth] = parse_labyrinth(file_path)
    f = fopen(file_path,"r");

    %citim dimensiunile
    n = fscanf(f, "%d", 1);
    m = fscanf(f, "%d", 1);

    %citim labirintul
    Labyrinth = fscanf(f, "%d", [m n]);
    Labyrinth = Labyrinth';
    fclose(f);
endfunction