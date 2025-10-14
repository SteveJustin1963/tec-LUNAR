# The real Apollo guidance system fails, Buzz suggests wiring in his **kid’s Talking Electronics TEC-1** as a desperate backup...

 
<img width="999" height="999" alt="image" src="https://github.com/user-attachments/assets/aa19ef2d-b5d0-4b40-907b-581872b7f82c" />



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


### **SCENE 2 — PATCHED CONTROL**

*(Buzz solders the last wire. The small board glows faintly; red digits blink to life.)*

<img width="974" height="1486" alt="image" src="https://github.com/user-attachments/assets/89232921-8ca8-4aea-82a9-0ba2d551078c" />




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





# LL.asm

```
Yes — I’ve still got your **LUNALANDER Z80 assembly code** in memory.
Let’s turn it into a **detailed ASCII flowchart** that shows every key routine, variable, and decision path.

---

## 🧭 **ASCII Flowchart — TEC-1 “LUNALANDER”**

 
┌────────────────────────────────────────────────────────┐
│                    LUNALANDER (Start)                  │
│      .ORG 0490h   Initialize Game Variables            │
└────────────────────────────────────────────────────────┘
            │
            ▼
┌────────────────────────────────────────────┐
│ Set IX = DISPLAY (0F1Fh)                   │
│ Set IY = STARTRAM (0800h)                  │
│ (ALTITUDE)=50h, (FUEL)=20h, (VELOCITY)=00h │
└────────────────────────────────────────────┘
            │
            ▼
┌───────────────────────────────┐
│ Clear Display (6 digits = 0)  │
└───────────────────────────────┘
            │
            ▼
┌───────────────────────────────┐
│ LUNA15:   D = 80h (Loop Delay)│
└───────────────────────────────┘
            │
            ▼
┌───────────────────────────────────────────┐
│ LUNA20 Loop:                              │
│ Display (FUEL) and (ALTITUDE)             │
│ Call WRITEHEX twice (for FUEL, ALTITUDE)  │
│ Call SCANDISP (scan key + refresh)        │
└───────────────────────────────────────────┘
            │
            ▼
┌───────────────────────────────┐
│ Key Press? (A != 0xFF)        │
│ ───────────────────────────── │
│ No → continue countdown       │
│ Yes → CALL LUNAKPRESS         │
└───────────────────────────────┘
            │
            ▼
┌───────────────────────────────┐
│ DEC D → if not zero, loop back│
│ JP nz, LUNA20                 │
└───────────────────────────────┘
            │
            ▼
┌───────────────────────────────┐
│ Apply Gravity:                │
│ (VELOCITY) = (VELOCITY) - 1   │
│ (BCD Adjust)                  │
└───────────────────────────────┘
            │
            ▼
┌───────────────────────────────┐
│ Update ALTITUDE:              │
│ (ALTITUDE) += (VELOCITY)      │
│ (BCD Adjust)                  │
└───────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────────────┐
│ Compare ALTITUDE                            │
│  = 00 → JP LWIN (soft landing)              │
│  < 60h → JR NC, LLOSE (crash)               │
│  else → continue descent (loop)             │
└─────────────────────────────────────────────┘
            │
            ▼
        ┌───────────────┐
        │ LUNAKPRESS    │
        ├───────────────┤
        │ if (FUEL)=0 → RET       │
        │ else:                   │
        │   (FUEL)--              │
        │   (VELOCITY)+=2         │
        │   DAA both              │
        └───────────────┘
            │
            ▼
       ┌────────────────┐
       │ Return to Loop │
       └────────────────┘
            │
            ▼
┌────────────────────────────┐
│   LWIN:  WINNING SEQUENCE  │
│   Play LUNAWIN tune table  │
│   CALL PLAYTUNE            │
│   WAIT keypress            │
│   JP LUNALANDER (restart)  │
└────────────────────────────┘
            │
            ▼
┌────────────────────────────┐
│  LLOSE: LOSING SEQUENCE    │
│  Play LUNALOSE tune table  │
│  CALL PLAYTUNE             │
│  WAIT keypress             │
│  JP LUNALANDER (restart)   │
└────────────────────────────┘
            │
            ▼
┌──────────────────────────┐
│         END / LOOP       │
│    “Press any key” restarts│
└──────────────────────────┘

---

### 🧮 **Variable Map (IY+offsets)**

| Offset | Symbol   | Description                | Initial |
| ------ | -------- | -------------------------- | ------- |
| (iy+0) | ALTITUDE | Descent height (BCD 00–99) | 50h     |
| (iy+1) | FUEL     | Remaining fuel             | 20h     |
| (iy+2) | VELOCITY | Descent speed              | 00h     |

---

### 🎵 **Tune Tables**

| Label    | Data bytes (hex)           | Meaning        |
| -------- | -------------------------- | -------------- |
| LUNAWIN  | 14,12,14,17,17,12,14,10,1F | Win jingle     |
| LUNALOSE | 01,11,01,11,01,11,1F       | Lose tone loop |

---

### 🧠 **Logic Summary**

* Gravity is simulated by decrementing velocity each cycle.
* Thrust (`+` key) increases velocity upward (counteracting gravity) but costs 1 unit of fuel.
* Landing safely means reaching altitude 0 with a small velocity (BCD zero after DAA).
* Crashing means descending too quickly (altitude < 60h threshold).
* The game loops forever, restarting after win/loss.

---

Here’s a **detailed ASCII dashboard-style flow diagram** showing how the **TEC-1 Lunar Lander game logic** maps to the **display, variables, and controls** — almost like a hardware visualization of the running program.

---

## 🚀 **TEC-1 LUNALANDER — Game Display & Logic Flow**


┌──────────────────────────────────────────────────────────────┐
│             [ TEC-1 FRONT PANEL — GAME STATUS ]              │
├──────────────────────────────────────────────────────────────┤
│ DISPLAY:    [ A1 A2  F1 F2  V1 V2 ]                         │
│             ││  ││  ││                                       │
│             ││  ││  └──── Velocity (BCD) 0–99                │
│             ││  └────── Fuel (BCD) 0–20                      │
│             └────────── Altitude (BCD) 0–50 → 00 (Landing)   │
│                                                              │
│  Example:  [ 0 5  1 3  0 2 ]                                │
│             ALT=05   FUEL=13   VEL=02                        │
│                                                              │
│  Updated continuously by WRITEHEX routine                    │
│  Refreshed by SCANDISP via monitor ROM                       │
└──────────────────────────────────────────────────────────────┘

             │
             ▼
┌──────────────────────────────────────────────────────────────┐
│                    INPUT CONTROL KEYS                        │
├────────────┬─────────────────────────────────────────────────┤
│   Key      │ Function                                        │
├────────────┼─────────────────────────────────────────────────┤
│     +      │ Fire retros (thrust). Calls LUNAKPRESS:         │
│            │   - (FUEL)--                                    │
│            │   - (VELOCITY)+=2 (BCD adjusted)                │
│            │   - Cannot fire if fuel=0                       │
│            │   - Each press = 1 unit fuel                    │
├────────────┼─────────────────────────────────────────────────┤
│  Any Key   │ After WIN/LOSE tune → restart game              │
│  (except   │ Resets variables and starts over                 │
│  RESET)    │                                                  │
└────────────┴─────────────────────────────────────────────────┘

             │
             ▼
┌──────────────────────────────────────────────────────────────┐
│                GAME LOGIC — MAIN LOOP                        │
├──────────────────────────────────────────────────────────────┤
│   Loop counter D = 80h (frame delay)                         │
│   ↓                                                         │
│   Every cycle:                                               │
│      • Show FUEL & ALTITUDE on display                       │
│      • Check for + key press (SCANDISP + CP)                 │
│      • If pressed → CALL LUNAKPRESS                          │
│      • Else continue countdown                               │
│      • When D=0 → apply gravity (VELOCITY–1)                 │
│      • Update ALTITUDE += VELOCITY                           │
│      • If ALT=00 → WIN (soft landing)                        │
│      • If ALT<60h → LOSE (crash)                             │
│      • Else loop to top                                      │
└──────────────────────────────────────────────────────────────┘

             │
             ▼
┌──────────────────────────────────────────────────────────────┐
│               END STATES & SOUNDS                            │
├───────────────┬───────────────────────────────────────────────┤
│  Condition    │  Action                                       │
├───────────────┼───────────────────────────────────────────────┤
│ ALT=00        │ Play LUNAWIN tune via PLAYTUNE (STARTRAM)     │
│               │ Wait key → Restart                            │
├───────────────┼───────────────────────────────────────────────┤
│ ALT<60h       │ Play LUNALOSE tune                            │
│               │ Wait key → Restart                            │
└───────────────┴───────────────────────────────────────────────┘

             │
             ▼
┌──────────────────────────────────────────────────────────────┐
│           MEMORY MAP (simplified)                            │
├────────────┬─────────────────────────────────────────────────┤
│ Address    │ Purpose                                         │
├────────────┼─────────────────────────────────────────────────┤
│ 0x0490     │ Start of LUNALANDER code                        │
│ 0x047B     │ LUNAWIN tune table                              │
│ 0x0484     │ LUNALOSE tune table                             │
│ 0x0F1F     │ DISPLAY buffer (6 digits)                       │
│ 0x0800     │ STARTRAM (variable base: fuel, alt, vel)        │
└────────────┴─────────────────────────────────────────────────┘



---

### 🧩 How It All Fits Together


[ KEYBOARD INPUT ] 
       │
       ▼
[ SCANDISP ROM ROUTINE ]───→ Reads + key or idle
       │
       ├─ “+” pressed → [ LUNAKPRESS ] → modifies FUEL/VELOCITY
       │
       └─ No press → countdown + gravity update
                     ↓
              [ VELOCITY ] ↓
              [ ALTITUDE ] ↓
       ┌──────────────────────────────┐
       │ If ALT=00 → WIN → PLAYTUNE   │
       │ If ALT<60h → LOSE → PLAYTUNE │
       │ Else loop back → LUNA20      │
       └──────────────────────────────┘


---



```





# Convert to forth



# Iterate


# something newer, Forth controlled physical 3D scale model Lunar Landing on 3D moon. read that heading again! 

The Lunar Lander program will allow the user to control the descent of a model lunar lander onto the surface of the moon. The user will be able to control the thrust of the lander's engines and the orientation of the lander. The program will display a representation of the lander and the surface of the moon. The user will need to use the lander's thrusters to slow the descent and land the lander safely on the surface of the moon.


The following code is a basic example of how to land a lunar lander on the moon:
1. Set up the lander in the correct position for landing.
2. Make sure that all the safety checks are complete and that the lander is ready for landing.
3. Start the engines and begin the descent.
4. Monitor the lander's progress and make any necessary course corrections.
5. Touch down lightly on the surface of the moon.
6. Shut down the engines and complete the landing procedure.


# Ref
- https://en.wikipedia.org/wiki/Lunar_Lander_(video_game_genre)
- https://blog.playstation.com/archive/2019/07/16/how-apollo-11s-moon-landing-inspired-upcoming-sci-fi-thriller-deliver-us-the-moon/
- https://store.playstation.com/en-au/product/EP4382-CUSA16761_00-DELIVERUSTHEMOON
- http://mattias.malmer.nu/lunar-module-blueprints/
- https://technologizer.com/2009/07/19/lunar-lander/index.html
- https://phet.colorado.edu/sims/lunar-lander/lunar-lander_en.html





