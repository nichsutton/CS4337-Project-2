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
    validate_coordinates(Maze, NextPos),
    get_cell_information(Maze, NextPos, Cell),
    Cell \= w,
    check_valid_moves(Maze, NextPos, Rest, FinalPos).

% this predicate verifies that the provided list of actions is valid and is able to reach the end of the maze
find_exit(Maze, Actions) :-
    nonvar(Actions),
    get_starting_coordinates(Maze, Start),
    check_valid_moves(Maze, Start, Actions, End),
    get_cell_information(Maze, End, e).

% same as above but without an input list of actions
find_exit(Maze, Actions) :-
    var(Actions),
    get_starting_coordinates(Maze, Start),
    navigate_maze(Maze, Start, [], Actions).

% stops the recursion if current cell is exit
navigate_maze(Maze, Pos, Visited, []) :-
    get_cell_information(Maze, Pos, e).

% explores the next position based on the actions whilst making sure it is still valid and not a wall
% adds to visited, then recursivly goes to the next position
navigate_maze(Maze, Pos, Visited, [Action|Actions]) :-
    move_coordinate(Pos, Action, NextPos),
    validate_coordinates(Maze, NextPos),
    get_cell_information(Maze, NextPos, Cell),
    Cell \= w,
    \+ member(NextPos, Visited),
    navigate_maze(Maze, NextPos, [Pos|Visited], Actions).

