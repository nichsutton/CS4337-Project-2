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

% the different movement actions that we can take
move_coordinate(coord(R, C), left,  coord(R, C2)) :- C2 is C - 1.
move_coordinate(coord(R, C), right, coord(R, C2)) :- C2 is C + 1.
move_coordinate(coord(R, C), up,    coord(R2, C)) :- R2 is R - 1.
move_coordinate(coord(R, C), down,  coord(R2, C)) :- R2 is R + 1.

check_valid_moves(_, Pos, [], Pos).

% makes sure that a provided list of actions is valid, and that we are not running into any walls or invalid cells
check_valid_moves(Maze, Pos, [Action|Rest], FinalPos) :-
    move_coordinate(Pos, Action, NextPos),
    valid_coordinates(Maze, NextPos),
    get_cell_information(Maze, NextPos, Cell),
    Cell \= w,
    check_valid_moves(Maze, NextPos, Rest, FinalPos).