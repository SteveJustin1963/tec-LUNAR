# tec-LUNAR
TEC-1 Forth controlled 3D Lunar Lander Simulator on 3D moon.

The Lunar Lander program will allow the user to control the descent of a lunar lander onto the surface of the moon. The user will be able to control the thrust of the lander's engines and the orientation of the lander. The program will display a representation of the lander and the surface of the moon. The user will need to use the lander's thrusters to slow the descent and land the lander safely on the surface of the moon.

- A subroutine to calculate the landing trajectory
- A subroutine to calculate the landing velocity
- A subroutine to calculate the deceleration
- A subroutine to calculate the landing site
- A subroutine to calculate the lunar surface conditions


The following code is a basic example of how to land a lunar lander on the moon:
1. Set up the lander in the correct position for landing.
2. Make sure that all the safety checks are complete and that the lander is ready for landing.
3. Start the engines and begin the descent.
4. Monitor the lander's progress and make any necessary course corrections.
5. Touch down lightly on the surface of the moon.
6. Shut down the engines and complete the landing procedure.


```
program LunarLander;

// constants
const GRAVITY = 1.62; // m/s^2
const MAX_THRUST = 10; // kN
const FUEL_RATE = 0.1; // kg/s

// variables
var thrust : real; // kN
var fuel : real; // kg
var height : real; // m
var velocity : real; // m/s
var orientation : integer; // degrees

// procedure to draw the lander
procedure DrawLander;
begin

end;

// procedure to draw the surface of the moon
procedure DrawSurface;
begin

end;

// procedure to get input from the user
procedure GetInput;
begin

end;

// procedure to update the lander's position and velocity
procedure UpdateLander;
begin

end;

// main program loop
begin
 fuel := 100;
 height := 1000;
 velocity := 0;
 orientation := 0;

 while height > 0 do
 begin
  // draw the lander and the surface
  DrawLander;
  DrawSurface;

  // get input from the user
  GetInput;

  // update the lander's position and velocity
  UpdateLander;
 end;

end.
```
