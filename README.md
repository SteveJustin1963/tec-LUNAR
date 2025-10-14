# The real Apollo guidance system fails in orbit...Buzz suggests wiring in his **kid’s Talking Electronics TEC-1** as a desperate backup...

 
<img width="666" height="666" alt="image" src="https://github.com/user-attachments/assets/aa19ef2d-b5d0-4b40-907b-581872b7f82c" />



---

# **Title: “Luna Descent — The TEC-1 Mission”**

### **CAST**

* **Neil Armstrong** – Commander
* **Buzz Aldrin** – Lunar Module Pilot
* **Houston** – Mission Control (voice)
* **TEC-1** – The improvised onboard computer (a Talking Electronics Z80 kit)

---

### **SCENE 1 — IN LUNAR ORBIT**

*The lunar module drifts silently. Buzz is bent over a panel full of warning lights. A faint beeping fills the cabin.*

**Buzz:**
Uh, Neil... guidance computer just threw another fault code. She’s gone dead.

**Neil:**
(leans closer)
You’ve gotta be kidding me. That’s the *primary controller*. We’re fifty kilometres above the surface, Buzz!

**Houston (radio crackle):**
Eagle, confirm. Are you saying the flight computer’s offline?

**Neil:**
Affirmative, Houston. We’ve got a full control failure. No guidance, no descent computer, nothing.

*(There’s a tense silence.)*

**Buzz (hesitant):**
I might... have an idea.
Look, it’s crazy — but I brought my kid’s **TEC-1** up here. He built it from a Talking Electronics magazine kit. Said it could “run games or rockets.”

**Neil (deadpan):**
You brought a bloody *hobby board* to the Moon?

**Buzz:**
Hey, it’s small, reliable, and it survived my suitcase better than NASA’s gear.
If we can wire it into the throttle relay bus, maybe we can improvise manual descent control.

**Neil:**
Jesus, Buzz... that’s not in the checklist.

**Buzz:**
Neither is dying in orbit, Neil.

*(Buzz starts unpacking the tiny TEC-1. Wires dangle like spaghetti. Neil stares in disbelief.)*

**Neil:**
Houston, this is Eagle. Requesting permission to interface... uh, an *Australian microcomputer* with our engine control circuit.

**Houston (after a long pause):**
Say again, Eagle? Did you say... “Australian microcomputer”?

**Buzz:**
Affirmative. Talking Electronics, issue 10, page 74. Runs on a Z80.
We can map the throttle control into the input port matrix.

**Houston (after a crackle):**
...Stand by.
(*beat*)
Approved. If it works, it works. You have go for improvised descent control.
And Buzz — tell your kid he’s now part of the Apollo program.

**Neil (grumbling):**
Bloody unbelievable.

---

<img width="666" height="666" alt="image" src="https://github.com/user-attachments/assets/6fc376a4-a88e-4bdf-b1b2-fc5511258b75" />



### **SCENE 2 — PATCHED CONTROL**

*(Buzz solders the last wire. The small board glows faintly; red digits blink to life.)*

**Buzz:**
Alright, we’re online.
Ready to initiate manual sequence.

**Neil:**
This is insane.
(*he mutters a profanity under his breath*)
Alright, entering sequence... `A D, 4, 9, 0, GO, GO.`

*(The display flashes: “LUNA LANDER — READY.”)*

**Buzz:**
Look at that. Talking Electronics saves NASA.

**Neil:**
If this works, I’m buying your kid a lifetime supply of 9-volt batteries.

---

### **SCENE 3 — DESCENT BEGINS**

*The module hums. The TEC-1 shows: `ALT 50  FUEL 20  VEL 00`.*

**Neil:**
Now setting descent rate — one-point-six-two lunar G.
If this thing goes haywire, I’m going to haunt whoever approved it.

**Buzz:**
She’s responding! We’ve got thrust control.
Try a short burn — press “+.”

*(Neil hits the key. The craft vibrates.)*

**Neil:**
Fuel down one.
Descent steady.
Bloody hell — it’s actually flying the ship.

**Buzz:**
Told you. Never underestimate Australian electronics.

---

### **SCENE 4 — LOW FUEL**

**Houston (radio):**
Eagle, fuel status?

**Neil:**
Reading one-zero litres. Altitude three-five and dropping.
I can’t believe this — we’re landing on the Moon using something from a *mail-order magazine*.

**Buzz:**
Relax. She’s holding.
Press “+” again, gently.

*(Neil taps the key. The engine rumbles softly.)*

---

### **SCENE 5 — CONTACT LIGHT**

**Buzz:**
Contact light!

**Neil:**
Engine stop.
(*he exhales in disbelief*)
We’re down.
We just landed the first lunar module... with a bloody TEC-1.

**Houston (ecstatic):**
Copy that, Eagle. Outstanding work. Australia just joined the space race.

**Buzz:**
Guess my kid’s homework just saved our lives.

**Neil (laughing):**
Next time, let’s just bring two of them.

---

### **SCENE 6 — GAME OVER / RESTART**

*(The TEC-1 beeps cheerfully.)*
**TEC-1:** “LUNA WIN — PRESS ANY KEY TO RESTART.”

**Buzz:**
Heh. Even gives us a restart option. Nice touch.

**Neil:**
No way. I’m not tempting fate twice.

*(He presses a key anyway. The screen resets, blinking softly in the cabin glow.)*

**Narrator (voice-over):**
And so, with twenty litres of astro fuel, a handful of keys, and a hobby computer from *Talking Electronics*, humankind made it to the Moon — one keystroke at a time.

*Fade to black. The red LEDs shimmer faintly: `LUNALANDER READY`.*

---





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

``LL.c`` Note that this is just a rough conversion and there may be some differences in the behavior of the code compared to the original LUNALANDER program. For example, the original program used BCD arithmetic and the C code uses standard integer arithmetic, which may result in slightly different values for the altitude and fuel. Additionally, the original program used a specific function (SCANDISP) to check for user input, while the C code uses the standard getchar function.

## Convert to forth
This code defines variables for the display, start of RAM, and game variables, as well as functions for clearing the display, displaying the current values of fuel and altitude, getting input from the user, processing the input, updating the velocity and altitude, and checking for a win or loss. The MAIN function contains the main game loop, which continues until the player wins or loses. ```LL.F```



## Iterate
## something newer, Forth controlled physical 3D scale model Lunar Landing on 3D moon. read that heading again! 

The Lunar Lander program will allow the user to control the descent of a model lunar lander onto the surface of the moon. The user will be able to control the thrust of the lander's engines and the orientation of the lander. The program will display a representation of the lander and the surface of the moon. The user will need to use the lander's thrusters to slow the descent and land the lander safely on the surface of the moon.


The following code is a basic example of how to land a lunar lander on the moon:
1. Set up the lander in the correct position for landing.
2. Make sure that all the safety checks are complete and that the lander is ready for landing.
3. Start the engines and begin the descent.
4. Monitor the lander's progress and make any necessary course corrections.
5. Touch down lightly on the surface of the moon.
6. Shut down the engines and complete the landing procedure.


## Ref
- https://en.wikipedia.org/wiki/Lunar_Lander_(video_game_genre)
- https://blog.playstation.com/archive/2019/07/16/how-apollo-11s-moon-landing-inspired-upcoming-sci-fi-thriller-deliver-us-the-moon/
- https://store.playstation.com/en-au/product/EP4382-CUSA16761_00-DELIVERUSTHEMOON
- http://mattias.malmer.nu/lunar-module-blueprints/
- https://technologizer.com/2009/07/19/lunar-lander/index.html
- https://phet.colorado.edu/sims/lunar-lander/lunar-lander_en.html





