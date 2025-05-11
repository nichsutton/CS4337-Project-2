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
