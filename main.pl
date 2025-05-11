% this finds the coordinates of the starting position of the maze
get_starting_coordinates(Maze, coord(R, C)) :-
    nth0(R, Maze, Row),
    nth0(C, Row, s).

% gets the cell information at a coordinate
get_cell_information(Maze, coord(R, C), Cell) :-
    nth0(R, Maze, Row),
    nth0(C, Row, Cell).

% this makes sure a given coordinate is within the bounds of the maze and therefore valid
validate_coordinates(Maze, coord(R, C)) :-
    is_list(Maze),
    length(Maze, Rows),
    R >= 0,
    R < Rows,
    nth0(R, Maze, Row),
    length(Row, Cols),
    C >= 0,
    C < Cols.