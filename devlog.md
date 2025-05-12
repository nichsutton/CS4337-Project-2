# April 10th, 2025 5:54PM - Session Start
For this session I will plan to finish a large portion of this project.

These are the tasks I will try to accomplish:
- Write the predicate find_exit/2 and make sure it will functino when passed a maze parameter and a list of actions
- Verify that the predicate can successfully navigate the maze from the start space to any exit space
- The preciate should work even when called with an unbound variable as a second parameter
- The predicate should fail if the maze is invalid, the actions do not lead to an exit space, or the actions lead the agent to moving off the maze or onto a wall

The first predicate I need to define is something that can locate the coordinates of the starting position. This will be used to help navigate the maze using a coordinate system. I have decided to use the built in nth0/3 predicate for ease of use and cleaner code.

- This above predicate is called "get_starting_coordinates"

The second predicate I need should get the information / value at a cell's coordinates. this will be useful later on for finding the end cell or any potential wall cells.

- This above predicate is called "get_cell_information"

I also need to check whether or not a given coordinate is within the bounds on the maze. If so, we should not be able to move to that location. This requires a predicate that can validate this.

- This above predicate is called "validate_coordinates"

# April 10th, 2025 11:42PM - Session End
This session was productive in my opinion. I did not accomplish all of my planned goals, but the things I did accomplish provide a solid backbone to the rest of the project.

For the next few sessions I plan to do the following:
- Begin defining the movement, so that the program can start navigating the maze.
- Implement a path finding algorithm such as dfs to find a path to the end location.
- Verify that the program has reached the end location, then print out the nessecary information as to how it got there.

# April 11th, 2025 5:19PM - Session Start
This session I plan to implement the following tasks:

- Defining the steps needed to navigate
- Apply the navigation to different sections of the maze
- Make sure that the navigation is valid 

I needed to add a list of actions that can represent the possible movements we can take via a coordinate system.

- these are the predicates called "move_coordinates"

I also needed to validate a list of actions to make sure no actions runs into a wall or enters an invalid cell.

- this predicate is called "check_valid_moves"

# April 11th, 2025 6:58PM - Session End
I have accomplished all of the goal that I had defined at the start. The next steps should be relatively simply. All I need to do it check if the cell is the end goal, and apply a dfs search to find a valid path. this can use the previous predicates I have defined to make the job easier.

# April 11th, 2025 7:59PM - Session Start
This session I plan the finish the remainder of the project. these tasks include implementing a navigation algorithm to actually navigate the maze based on the previously defined predicates.

I also plan to implement checks and predicates to successfully identify the exit cells.

First, I need to validate a path when a list of actions is already provided to the find_exit predicate. It will work by getting the starting coordinates, then validating the actions needed to get there, then it checks if the ending cell is the end or goal cell.

Second, I need to create an algorithm to find the actual path to the end cell without a provided list on actions.

- This predicate is called find_exit and is the predicate for the project

the find exit predicate works with both a list of actions or undefined actions.

in the case the actions are undefined, we created a helper predicate called navigate_maze, when finds a valid path to reach the exit cell. this predicate is recursively called until we reach this cell.

# April 11th, 2025 10:22PM - Session End
This session, I have completely all the tasks I set out to do. I have defined an algorithm that can find a path to a exit cell whilst making sure the movements are valid with the use of helper predicates. we have also defined predicates to identify exit cells and applying the steps to reach them.