# tec-LUNAR

Lunar Lander was in TE 10 pg 74

"Key sequence: `AD, 4, 9, 0, GO, GO.`
Set speed control to your level of skill (strength of gravity). When
the game ends, press any key to restart.
You are in a luna module, orbiting some 50 kilometres above the luna
surface. You have 20 litres of astro fuel left and you have to land your
spacecraft without denting either the moon or the craft.
Gravity is constantly pulling you down and you can only slow your
descent by blasting with your retro rockets.
Your height is indicated by the first two digits and this starts at 50.
Watch yourself descend without blasting your retros and as you fall, you
will descend faster and faster - until you HIT!
Press any key to restart (except reset). To blast for a short time, press:
`+`. This may slow you a bit and to slow yourself down more, press `+`
several times. If you over-do this command, you will slow down to zero
velocity and even start going UP! Never move upwards as this is a waste
of fuel.
Every time you blast, your fuel goes down by ONE LITRE. Once your fuel
runs out, you can't fire any more and you start falling towards the luna
surface.
So, use your fuel wisely to survive"


### something newer, Forth controlled physical 3D scale model Lunar Landing on 3D moon. read that heading again! 

The Lunar Lander program will allow the user to control the descent of a model lunar lander onto the surface of the moon. The user will be able to control the thrust of the lander's engines and the orientation of the lander. The program will display a representation of the lander and the surface of the moon. The user will need to use the lander's thrusters to slow the descent and land the lander safely on the surface of the moon.


The following code is a basic example of how to land a lunar lander on the moon:
1. Set up the lander in the correct position for landing.
2. Make sure that all the safety checks are complete and that the lander is ready for landing.
3. Start the engines and begin the descent.
4. Monitor the lander's progress and make any necessary course corrections.
5. Touch down lightly on the surface of the moon.
6. Shut down the engines and complete the landing procedure.


## LUNA LANDER TEC-1 Mintor 1A
from TE 10-74; "Key sequence: AD, 4, 9, 0, GO, GO.
Set speed control to your level of skill (strength of gravity). When
the game ends, press any key to restart.
You are in a luna module, orbiting some 50 kilometres above the luna
surface. You have 20 litres of astro fuel left and you have to land your
spacecraft without denting either the moon or the craft.
Gravity is constantly pulling you down and you can only slow your
descent by blasting with your retro rockets.
Your height is indicated by the first two digits and this starts at 50.
Watch yourself descend without blasting your retros and as you fall, you
will descend faster and faster - until you HIT!
Press any key to restart (except reset). To blast for a short time, press:
+. This may slow you a bit and to slow yourself down more, press +
several times. If you over-do this command, you will slow down to zero
velocity and even start going UP! Never move upwards as this is a waste
of fuel.
Every time you blast, your fuel goes down by ONE LITRE. Once your fuel
runs out, you can't fire any more and you start falling towards the luna
surface.
So, use your fuel wisely to survive!"

## code ```LL.asm```
LUNALANDER is a program written in Z80 assembly language for a computer game in which the player must land a lunar module on the moon. The game is played by using the + key to fire the engine briefly and slow down the descent, while keeping an eye on the altitude and fuel levels. If the player runs out of fuel, the lunar module will crash.

The program starts by setting up some initial values for the game, including the altitude, fuel, and velocity of the lunar module. It then clears the display and enters a loop in which it displays the current fuel and altitude values, checks for user input, and updates the velocity and altitude based on the elapsed time. If the altitude becomes zero or less, the player wins the game, and if the altitude becomes less than 60, the player loses. The program continues to loop until one of these conditions is met.

The LUNALANDER code can be broken down into the following steps:

Initialization: The program initializes several variables and registers, including the display memory location (DISPLAY), the start of the RAM memory (STARTRAM), and the initial values for the altitude (ALTITUDE), fuel (FUEL), and velocity (VELOCITY) of the lunar module.

Clear the display: The program clears the display by writing the value 0x00 to each of the display memory locations.

Main game loop: The program enters a loop that will run 128 times. In each iteration of the loop, it displays the current fuel and altitude values in hexadecimal format, checks for user input, and updates the velocity and altitude based on the elapsed time.

Check for user input: The program checks for user input by calling the SCANDISP function, which checks for any keypresses. If a key has been pressed, the program calls the LUNAKPRESS function to process the input.

Update the velocity and altitude: The program decrements the velocity (VELOCITY) by 1 and adds it to the altitude (ALTITUDE). It then adjusts the result using the DAA (decimal adjust after addition) instruction to ensure that it is stored in BCD (binary-coded decimal) format.

Check for game win or loss: If the altitude (ALTITUDE) becomes zero or less, the player has won the game and the program jumps to the LWIN label. If the altitude (ALTITUDE) becomes less than 60, the player has lost the game and the program jumps to the LLOSE label.

End of loop: If none of the win or loss conditions have been met, the program jumps back to the beginning of the main game loop to continue updating the game state.


## Iterate

## Ref
- https://en.wikipedia.org/wiki/Lunar_Lander_(video_game_genre)
- https://blog.playstation.com/archive/2019/07/16/how-apollo-11s-moon-landing-inspired-upcoming-sci-fi-thriller-deliver-us-the-moon/
- https://store.playstation.com/en-au/product/EP4382-CUSA16761_00-DELIVERUSTHEMOON
- http://mattias.malmer.nu/lunar-module-blueprints/
- 
- 




