# The real Apollo guidance system fails, Buzz suggests wiring in his **kid’s Talking Electronics TEC-1** as a desperate backup...

https://github.com/SteveJustin1963/tec-BOOKS/blob/master/TE/Mag/talking_electronics_10.pdf

 
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

---

## 🧭 **ASCII Flowchart — TEC-1 “LUNALANDER”**

```
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
```

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


---

## 🚀 **TEC-1 LUNALANDER — Game Display & Logic Flow**

```
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

```

---

### 🧩 How It All Fits Together

```
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
```

---





---

# **TEC-1 Forth-Controlled 3D Lunar Lander Simulator on a Physical 3D Moon**

**Concept Summary:**
A fully functional *physical* lunar landing simulator that merges the classic 1980s **TEC-1 Z80 single-board computer**, the iconic *Lunar Lander* algorithm from *Talking Electronics Issue 10 (p. 74)*, and a Forth-driven robotics control system.
The project recreates the experience of piloting a lunar module in a **real-world 3D environment**, complete with motion, telemetry, cockpit visuals, and mission-style radio chatter — a blend of retro computing, robotics, and simulation art.

---

## **Overview**

This project will use a **TEC-1 running a custom Forth interpreter** to control a **physical 3D scale model** of a lunar module (LM).
The LM will descend over a **rotating, cratered 3D moon surface**, simulating gravity, thrust, and fuel depletion according to the original game physics from the 1980s Z80 *LUNALANDER* program.

The system merges *retro software emulation* with *physical motion mechanics* and *visual feedback instrumentation*, reproducing the drama of the Apollo descent phase — in miniature.

---

## **System Architecture**

### **1. Core Control: TEC-1 + Forth Engine**

* **Base Computer:** TEC-1 (Z80 @ 3.25 MHz)
* **Language:** MINT-style Forth or tecForth interpreter
* **Algorithm:** Converted from *Talking Electronics Issue 10 – Lunar Lander (p. 74)*
* **Memory Map:**

  * Altitude, Velocity, and Fuel tracked as 3 BCD registers
  * Display buffer linked to tecAPUS or tecLINDAR visual interfaces

**Tasks:**

* Convert Z80 Lunar Lander ASM to Forth words (e.g., `ALT`, `VEL`, `FUEL`, `THRUST`, `UPDATE`, `DISPLAY`)
* Implement discrete thrust/gravity update cycles in real-time (1 Hz tick)
* Display telemetry on 7-segment LEDs or OLED HUD
* Transmit data over serial to robotic control system

---

### **2. Physical Lander Module**

* **Scale:** ~40 cm model (1:16 scale)
* **Structure:** lightweight aluminum or 3D-printed frame
* **Control System:** 2-axis gimbal or suspended arm system
* **Motion Mechanism:**

  * *Vertical descent* simulated via servo or stepper control
  * *Attitude tilt* for orientation adjustment
  * *LED engine flare* for thrust indication
* **Sensors:** limit switches for touchdown, IMU for attitude feedback
* **Optional:** magnetic suspension or cable-pulley lift for precision descent

---

### **3. 3D Moon Surface**

* **Base:** rotating textured model (60 cm–1 m diameter)
* **Surface Detail:** plaster, resin, or 3D-printed craters
* **Rotation:** slow geared DC motor (~1 RPM)
* **Lighting:** overhead directional lamp mimicking solar illumination
* **Landing Zones:** painted craters with IR or Hall sensors for touchdown detection

---

### **4. Visual & Audio Systems**

* **CCD Cockpit Camera:** mounted on LM model for pilot’s-eye view
* **Output:** live feed to a monitor or LCD “window” inside a desktop control panel
* **Instruments:**

  * Altitude, Velocity, Fuel, and Attitude indicators per NASA-LM layout
  * Optionally driven by Arduino or I²C telemetry display module
* **Sound:**

  * Simulated engine rumble, warning tones, and landing callouts
  * **Radio Dialogue:** pre-recorded or text-to-speech simulated conversation with *Mission Control*

    * e.g. “Eagle, you’re go for descent.”
    * “Fuel remaining: 10 litres.”
    * “Contact light. Engine stop.”

---

### **5. Robotic & Peripheral Control**

* **Interface Modules:**

  * *tecAPUS* (for analog pulse/speed output)
  * *tecLINDAR* (for servo, stepper, and sensor interfacing)
* **Controller Link:**

  * TTL serial between TEC-1 and robotic controller
  * PWM output mapped from Forth numeric state words
* **Optional:**

  * External microcontroller (PIC, AVR, or STM32) as motion interface
  * Feedback loop for altitude-position matching (PID-style Forth control)

---

## **Simulation Procedure**

1. **Initialization**

   * Power up TEC-1 and robotics system
   * Run diagnostic and safety checks on lander and control arm
   * Ensure moon rotation and telemetry links are active

2. **Program Launch**

   * Execute `LUNALANDER` Forth word
   * Display `ALT`, `VEL`, `FUEL` on 7-segment displays
   * Lander hovers at simulated altitude 50 m

3. **Descent Phase**

   * Gravity (−1 m/s² simulated) pulls descent rate
   * Thrust controlled by pilot via `+` key
   * Each key press burns 1 litre of fuel, increases upward thrust by +2 units
   * Lander physically descends as motors move the gimbal or arm

4. **Touchdown**

   * If `ALT` reaches zero and velocity < safe threshold → *soft landing*
   * Else crash detected → lander jolts, “crash” sound triggered
   * “LUNAWIN” or “LUNALOSE” melody plays via onboard piezo or DAC

5. **Reset / Replay**

   * System waits for key input
   * All variables reset
   * Moon rotation continues for next descent attempt

---

## **Educational and Technical Objectives**

* Demonstrate the **integration of retro computing** with modern robotic control
* Visualize real-time simulation of **thrust, gravity, and momentum**
* Apply **Forth control logic** to physical movement and sensor feedback
* Encourage **STEM learning** in embedded systems, analog control, and digital simulation
* Explore the **human-machine interface** of 1970s spaceflight through 1980s hobby computing

---

## **References & Inspirations**

* *Talking Electronics Issue 10*, “Lunar Lander” (p. 74) — Z80 Source Code
* Wikipedia: [Lunar Lander (video game genre)](https://en.wikipedia.org/wiki/Lunar_Lander_%28video_game_genre%29)
* *Deliver Us the Moon* — PlayStation sci-fi thriller inspired by Apollo 11
* [NASA Apollo Lunar Module Blueprints](http://mattias.malmer.nu/lunar-module-blueprints/)
* *Technologizer:* [History of Lunar Lander Games](https://technologizer.com/2009/07/19/lunar-lander/index.html)
* [PhET Interactive Simulations – Lunar Lander](https://phet.colorado.edu/sims/lunar-lander/lunar-lander_en.html)

---

## **Summary**

The **Forth-Controlled TEC-1 Lunar Lander Simulator** is not just a retro-tech homage — it’s a living, functional *Apollo descent trainer in miniature form*.
By merging a **real Z80 computer**, **Forth logic**, and a **physical robotic moon environment**, the project transforms an educational electronics kit into a true hands-on mission control experience — where software, mechanics, and imagination all meet on the surface of the Moon.

---








---

## 🛰️ **System Architecture – ASCII Block Diagram**

 **comprehensive ASCII schematic** of the **TEC-1 Forth-Controlled 3D Lunar Lander Simulator**, showing every subsystem, data path, and control flow from your TEC-1 computer through to the physical 3D Moon and its feedback loop.


### *TEC-1 Forth-Controlled 3D Lunar Lander Simulator on 3D Moon*

```
┌────────────────────────────────────────────────────────────┐
│                     PILOT CONTROL STATION                  │
├────────────────────────────────────────────────────────────┤
│ [ TEC-1 SBC (Z80) ]                                        │
│  ├─ MINT-style Forth interpreter                            │
│  ├─ "LUNALANDER" program (converted from TE Issue 10)       │
│  ├─ Variables: ALT, VEL, FUEL (BCD registers)               │
│  ├─ I/O Ports:                                              │
│  │   - Display (7-segment / OLED)                           │
│  │   - Keyboard (+ key = thrust)                            │
│  │   - Serial (to robot controller)                         │
│  └─ Extensions: tecAPUS / tecLINDAR interface cards         │
└────────────────────────────────────────────────────────────┘
                     │
                     │ Telemetry / Control Bus (TTL Serial / PWM)
                     ▼
┌────────────────────────────────────────────────────────────┐
│           ROBOTIC INTERFACE CONTROLLER (teclink MCU)       │
├────────────────────────────────────────────────────────────┤
│  - Converts TEC-1 numeric output into servo / motor drive  │
│  - Receives position & limit feedback sensors              │
│  - Provides PID-style smoothing for altitude movement      │
│  - Optional MCU (PIC / ATmega / STM32) for expansion       │
│  - Channels:                                               │
│      A. Vertical Descent Motor                             │
│      B. Pitch / Yaw Servo Control                          │
│      C. Thrust LED / Engine Flare Output                   │
│      D. CCD Camera Feed Trigger                            │
│      E. Feedback (touchdown sensors / IMU)                 │
└────────────────────────────────────────────────────────────┘
                     │
                     │ Motor / Servo Signal Cables
                     ▼
┌────────────────────────────────────────────────────────────┐
│                  3D LUNAR LANDER MODEL (1:16)              │
├────────────────────────────────────────────────────────────┤
│  - 40 cm model of Lunar Module                             │
│  - Mounted on robotic gimbal arm or suspension rig          │
│  - LED "thruster" under base                               │
│  - Internal CCD cockpit camera                             │
│  - Sensors:                                                │
│     * Limit switch for touchdown detection                 │
│     * Accelerometer / Gyro (optional)                      │
│     * Engine temperature / light sensor (for realism)      │
└────────────────────────────────────────────────────────────┘
                     │
                     │ Visual & Physical Output
                     ▼
┌────────────────────────────────────────────────────────────┐
│                  ROTATING 3D MOON SURFACE                 │
├────────────────────────────────────────────────────────────┤
│  - Diameter: 60–100 cm (textured terrain / craters)        │
│  - Slow rotation via geared DC motor (~1 RPM)              │
│  - Landing zones with magnetic / IR sensors                │
│  - Directional spotlight for simulated sunlight            │
│  - Optional surface vibration motor for crash effect       │
└────────────────────────────────────────────────────────────┘
                     ▲
                     │ Sensor feedback (touchdown / alignment)
                     │
┌────────────────────────────────────────────────────────────┐
│                   FEEDBACK & INSTRUMENTATION              │
├────────────────────────────────────────────────────────────┤
│  - TEC-1 receives landing sensor signals                   │
│  - Updates display: ALT, FUEL, VEL                         │
│  - Plays win/lose tune (LUNAWIN / LUNALOSE)                │
│  - Serial telemetry to secondary HUD display or LCD panel  │
│  - Optional data logging via serial terminal / PC link     │
└────────────────────────────────────────────────────────────┘
                     │
                     ▼
┌────────────────────────────────────────────────────────────┐
│               AUDIO & MISSION COMMUNICATION                │
├────────────────────────────────────────────────────────────┤
│  - "Mission Control" simulated radio loop (scripted voices)│
│  - Engine rumble, callouts, and alarm tones via DAC/piezo   │
│  - Audio synchronized with descent events                   │
│  - Example phrases:                                         │
│       “Eagle, you’re go for descent.”                       │
│       “Fuel remaining: 10 litres.”                          │
│       “Contact light. Engine stop.”                         │
└────────────────────────────────────────────────────────────┘
```

---

## 🔁 **Data & Control Flow Summary**

```
┌────────────┐
│  Keyboard  │  (Pilot input: + key → thrust)
└──────┬─────┘
       │
       ▼
┌────────────────────────┐
│  TEC-1 LUNALANDER Forth│
│   (ALT, FUEL, VEL loop)│
└──────┬─────────────────┘
       │
       │ Forth updates → PWM/Serial
       ▼
┌────────────────────────┐
│  Robotic Interface MCU │
│  (tecAPUS / tecLINDAR) │
└──────┬─────────────────┘
       │
       │ Motor & Servo control signals
       ▼
┌────────────────────────┐
│  Lander Motion System  │
│  (Altitude, pitch, LED)│
└──────┬─────────────────┘
       │
       │ Touchdown feedback sensors
       ▼
┌────────────────────────┐
│ TEC-1 Inputs (Sensors) │
│  - Detect landing state│
│  - Trigger LUNAWIN/LOSE│
└──────┬─────────────────┘
       │
       ▼
┌────────────────────────┐
│ Display & Audio Output │
│ (LED digits / tune)    │
└────────────────────────┘
```

---

## ⚙️ **Extended Optional Modules**

```
┌─────────────────────────────┐
│ Optional PC Telemetry Link  │
│  - Serial logging via RS-232 │
│  - Graph altitude/fuel vs. time │
│  - Video overlay from cockpit cam │
└─────────────────────────────┘

┌─────────────────────────────┐
│ Augmented Reality Mode      │
│  - Combine live feed from CCD│
│  - Overlay HUD via PC        │
│  - Simulate Apollo HUD style │
└─────────────────────────────┘
```

---

## 🧩 **Subsystem Breakdown (by Responsibility)**

| Subsystem              | Function                                      | Hardware              |
| ---------------------- | --------------------------------------------- | --------------------- |
| **TEC-1**              | Core logic, Forth interpreter, display, input | TEC-1 + I/O cards     |
| **Robotic Controller** | Converts logic signals to servo/motor motion  | PIC / AVR / STM32     |
| **Lunar Lander Model** | Visual and motion element                     | 40 cm scale model     |
| **Moon Surface**       | Visual terrain, rotating                      | DC geared motor       |
| **Feedback System**    | Landing sensors, IMU                          | Limit/Hall/gyro       |
| **Audio/Comms**        | Sound + mission radio                         | DAC/piezo + playback  |
| **Visuals**            | Cockpit CCD, HUD monitor                      | Mini camera + display |

---








---

## 🧠 **TEC-1 Forth + Hardware Memory / I-O Map**

 **TEC-1 Lunar Lander Memory and I/O Map**, expanded into a detailed ASCII layout showing how the Forth environment, Z80 registers, and physical hardware (motors, sensors, display, and audio) integrate in your hybrid **“Forth-controlled lunar descent simulator”** system.


### *(for the 3D Lunar Lander Simulator)*

```
┌──────────────────────────────────────────────────────────────┐
│                      TEC-1 SYSTEM MEMORY MAP                 │
├─────────────┬───────────────────────────────────────────────┤
│ Address     │ Description                                   │
├─────────────┼───────────────────────────────────────────────┤
│ 0000-0FFFh  │ TEC-1 Monitor ROM                             │
│              │  – SCANDISP, WRITEHEX, PLAYTUNE, GETKEY       │
│              │  – Bootloader / Debug / I/O Services           │
│              │  – Used by both ASM and Forth environments     │
│--------------┼-----------------------------------------------│
│ 1000-17FFh  │ Forth Dictionary & Runtime                     │
│              │  – Core words: DUP, SWAP, +, -, IF, LOOP, etc. │
│              │  – I/O words: OUT, IN, PEEK, POKE              │
│              │  – Extended: THRUST, GRAV, UPDATE, HUD         │
│--------------┼-----------------------------------------------│
│ 1800-1FFFh  │ User Forth Code & Variables                    │
│              │  – "LUNALANDER" program                       │
│              │  – Variables: ALT, VEL, FUEL, STATE            │
│--------------┼-----------------------------------------------│
│ 2000-23FFh  │ Display Buffer (MIRROR of 0F1Fh)               │
│              │  – 6 bytes for LED digits (ALT,FUEL,VEL)       │
│--------------┼-----------------------------------------------│
│ 2400-27FFh  │ Serial Comm Buffer (for tecAPUS / tecLINDAR)   │
│              │  – Data exchange with MCU control interface    │
│--------------┼-----------------------------------------------│
│ 2800-2FFFh  │ Telemetry Log / Debug Space                    │
│              │  – Optional use for serial dump to PC          │
│--------------┼-----------------------------------------------│
│ 3000-37FFh  │ Audio Buffer (tone tables)                     │
│              │  – LUNAWIN, LUNALOSE, ENGINE hums             │
│--------------┼-----------------------------------------------│
│ 3800-3FFFh  │ Scratch / Stack                                │
│              │  – Forth Data & Return stacks                 │
│--------------┼-----------------------------------------------│
│ 4000-47FFh  │ Free RAM (available for expansion)             │
│--------------┼-----------------------------------------------│
│ 4800-48FFh  │ Working Variables (mirrors IY offsets)         │
│              │  +00 = ALTITUDE                               │
│              │  +01 = FUEL                                   │
│              │  +02 = VELOCITY                               │
│              │  +03 = TEMP                                   │
│--------------┼-----------------------------------------------│
│ 4900-4FFFh  │ LUNALANDER Main Program (Z80 ASM)              │
│              │  – Original code from TE-10                   │
│              │  – Used as reference / disassembly for Forth   │
│--------------┼-----------------------------------------------│
│ 5000-57FFh  │ Robot Control I/O Space                        │
│              │  – PWM signals, servo control, feedback regs   │
│--------------┼-----------------------------------------------│
│ 5800-5FFFh  │ Expansion ROM / tecLINDAR driver code          │
│--------------┼-----------------------------------------------│
│ 6000-FFFFh  │ Reserved / External Bus                        │
│              │  – Optionally mapped to PC telemetry link      │
└─────────────┴───────────────────────────────────────────────┘
```

---

## ⚡ **Hardware I/O Port Map (Z80 I/O Space)**

```
┌──────────────────────────────────────────────────────────────┐
│ Port | Direction | Symbol | Function                         │
├──────┼────────────┼────────┼──────────────────────────────────┤
│ 00h  │  OUT       │ DISP   │ Write to 7-Segment Display       │
│ 01h  │  IN        │ KEYBD  │ Read keypad (SCANDISP routine)   │
│ 02h  │  OUT       │ BUZZ   │ Piezo speaker / tone gen         │
│ 03h  │  OUT       │ SERIAL │ TTL serial out to tecLINDAR      │
│ 04h  │  IN        │ SENSOR │ Landing / altitude feedback      │
│ 05h  │  OUT       │ MOTOR  │ PWM for descent servo            │
│ 06h  │  OUT       │ LED    │ Thruster light intensity         │
│ 07h  │  IN        │ IMU    │ Optional accelerometer/tilt      │
│ 08h  │  OUT       │ CAMTRG │ Trigger cockpit CCD capture      │
│ 09h  │  IN        │ LIMIT  │ Touchdown / surface contact      │
│ 0Ah  │  OUT       │ AUDIO  │ DAC waveform (engine noise)      │
│ 0Bh  │  OUT       │ RADIO  │ Transmit mission audio/dialogue  │
│ 0Ch  │  OUT       │ PCLOG  │ Serial telemetry to computer     │
│ 0Dh  │  IN        │ STATUS │ MCU status flags (ready/error)   │
│ 0Eh  │  OUT       │ RESET  │ Resets robot controller          │
│ 0Fh  │  OUT       │ LEDS   │ Debug indicators                 │
└──────┴────────────┴────────┴──────────────────────────────────┘
```

---

## 🧩 **Forth Variable and Word Mapping**

```
┌──────────────────────────────────────────────────────────────┐
│ Forth Variable │ Address │ Function / Description            │
├────────────────┼─────────┼───────────────────────────────────┤
│ ALT            │ 4800h   │ Altitude (BCD, starts at 50)      │
│ FUEL           │ 4801h   │ Fuel (BCD, starts at 20)          │
│ VEL            │ 4802h   │ Velocity (BCD, starts at 00)      │
│ GRAV           │ CONST 1 │ Gravitational pull per tick       │
│ THRUST         │ CONST 2 │ Thrust increment when key pressed │
│ STATE          │ 4803h   │ 0=Flying, 1=Win, 2=Crash          │
│ TIMER          │ 4804h   │ Countdown frame loop              │
│ SENSOR         │ 4805h   │ Touchdown flag                    │
└────────────────┴─────────┴───────────────────────────────────┘
```

### **Core Forth Words**

| Word        | Operation                            | Description             |
| ----------- | ------------------------------------ | ----------------------- |
| `INIT`      | Resets all variables, clears display | Startup                 |
| `DISPLAY`   | Writes ALT, FUEL, VEL to 7-segment   | Telemetry output        |
| `+KEY?`     | Polls keypad                         | Detects `+` thrust key  |
| `THRUST`    | Adds +2 velocity, burns 1 fuel       | Retro rocket            |
| `GRAVITY`   | Subtracts 1 velocity per cycle       | Simulated lunar gravity |
| `UPDATE`    | ALT += VEL; checks bounds            | Integrates motion       |
| `CHECK`     | Evaluates win/lose conditions        | Triggers audio          |
| `PLAYWIN`   | Sends LUNAWIN melody to speaker      | Soft landing            |
| `PLAYCRASH` | Sends LUNALOSE tone                  | Crash event             |
| `RUN`       | Main loop combining all              | Continuous simulation   |

---

## 🔄 **Runtime Flow (Memory + I/O Interaction)**

```
Forth: RUN
│
├─ INIT (4800h..4803h cleared)
│
├─ LOOP:
│   │
│   ├─ DISPLAY → OUT (00h)
│   │
│   ├─ +KEY? → IN (01h)
│   │     └─ If pressed → THRUST → OUT (05h,06h)
│   │
│   ├─ GRAVITY → Update VEL (-1)
│   │
│   ├─ UPDATE → ALT += VEL
│   │     ├─ OUT (00h) display new ALT
│   │     └─ OUT (03h) serial telemetry
│   │
│   ├─ SENSOR? → IN (09h)
│   │     ├─ If ALT=00 → STATE=1 (PLAYWIN)
│   │     └─ If ALT<60h → STATE=2 (PLAYCRASH)
│   │
│   └─ OUT (02h,0Ah) for sound feedback
│
└─ UNTIL RESET or key restart
```

---

## 🪛 **Example Memory Snapshot (Live Descent)**

| Variable       | Address  | Value              | Meaning          |
| -------------- | -------- | ------------------ | ---------------- |
| ALT            | 4800h    | 24h                | Altitude = 24    |
| FUEL           | 4801h    | 12h                | Fuel = 12 L      |
| VEL            | 4802h    | 03h                | Velocity = 3 m/s |
| STATE          | 4803h    | 00h                | Active flight    |
| SENSOR         | 4805h    | 00h                | No touchdown yet |
| Display Buffer | 0F1Fh    | [2][4][1][2][0][3] | ALT/FUEL/VEL     |
| PWM Out        | Port 05h | 40h                | Mid-thrust       |
| Thruster LED   | Port 06h | 80h                | Active           |
| Audio          | Port 0Ah | Tone 3             | Engine hum       |

---

## 🔧 **Hardware Expansion Slots (TEC-1)**

```
┌──────────────┬────────────────────────────────────┐
│ SLOT / CARD  │ FUNCTION                            │
├──────────────┼────────────────────────────────────┤
│ tecAPUS      │ Analog PWM / DAC control            │
│ tecLINDAR    │ Motor, servo, sensor I/O expander   │
│ tecSERIAL    │ Serial to PC telemetry interface     │
│ tecCAM       │ CCD camera trigger / video stream   │
│ tecAUDIO     │ Sound synthesizer / playback unit   │
│ tecLEDX      │ Expanded LED/HUD display control     │
└──────────────┴────────────────────────────────────┘
```

---

### 💡 **Conceptual Summary**

The **TEC-1** becomes the “Lunar Module Guidance Computer,”
running a **Forth interpreter** that manipulates:

* Memory cells for physics variables
* I/O ports for servo/LED/sound output
* Sensor inputs for landing detection

In this system, *every tick of the simulation loop* updates both the **digital** (on-screen) and **physical** (robotic) environment — a perfect fusion of *retro code, Forth control, and tangible motion*.

---



---

## ⚙️ **TEC-1 Lunar Lander — Hardware Wiring & Signal Map**

 detailed **ASCII hardware wiring schematic** showing how your **TEC-1 Forth-controlled Lunar Lander system** could be physically wired to its peripherals, using classic Z80 support ICs (8255 PIO, 74LS595 shift registers, LS7366 counters, etc.) integrated with the robotic interface.


```
┌────────────────────────────────────────────────────────────┐
│                    TEC-1 MAINBOARD (Z80 CPU)               │
│────────────────────────────────────────────────────────────│
│ Z80 @ 3.25 MHz                                             │
│   A0–A7  → Address Bus → ROM, RAM, I/O                     │
│   D0–D7  → Data Bus (8-bit shared bus)                     │
│   /RD,/WR,/IORQ,/MREQ,/RESET control lines                 │
│   CLK → system timing (3.25 MHz)                           │
│                                                            │
│ ROM: 0000–0FFF  (Monitor ROM)                              │
│ RAM: 1000–3FFF  (Forth & Game Variables)                   │
│ I/O  : 00–0F ports (8255 PIO & expansions)                 │
└────────────────────────────────────────────────────────────┘
                     │
                     │ 8-bit I/O bus + control lines
                     ▼
┌────────────────────────────────────────────────────────────┐
│                 8255 PIO INTERFACE CHIP                    │
│  Ports A,B,C mapped to Z80 I/O 00h–03h                    │
│────────────────────────────────────────────────────────────│
│ PORT A → DISPLAY / LED DATA OUT                           │
│   – Connected to 74LS595 shift registers                   │
│   – Drives 6× 7-segment digits via transistor drivers      │
│   – Displays ALT,FUEL,VEL in BCD                          │
│ PORT B → KEYBOARD SCAN IN                                 │
│   – Matrix input from TEC-1 hex keypad                    │
│   – Used by SCANDISP routine                              │
│ PORT C → CONTROL MISC SIGNALS                             │
│   – C0 = Speaker (Piezo Buzzer)                           │
│   – C1 = Serial TX to Robot MCU                           │
│   – C2 = Motor PWM Enable                                 │
│   – C3 = Thruster LED On/Off                              │
│   – C4 = Camera Trigger                                   │
│   – C5 = Sensor Input (landing switch)                    │
│   – C6 = IMU Data line                                    │
│   – C7 = Spare / Debug LED                                │
└────────────────────────────────────────────────────────────┘
                     │
                     │ 74LS595 serial display drivers
                     ▼
┌────────────────────────────────────────────────────────────┐
│          74LS595 SHIFT REGISTERS (×3 for 6 digits)         │
│  SERIAL DATA ← 8255 PORT A                                 │
│  LATCH CLK ← 8255 C0                                       │
│  OUTPUTS → 7-segment LED anodes via resistor array         │
│  Used for telemetry display (ALT,FUEL,VEL)                 │
└────────────────────────────────────────────────────────────┘

                     │
                     │ Serial line (0–5 V TTL)
                     ▼
┌────────────────────────────────────────────────────────────┐
│             ROBOT INTERFACE MCU (teclink controller)        │
│────────────────────────────────────────────────────────────│
│  – Receives telemetry from TEC-1 (FUEL, VEL, ALT)          │
│  – Outputs PWM to servo/stepper drivers                    │
│  – Provides feedback via digital I/O to TEC-1              │
│                                                            │
│ MCU pins → mapped as follows:                              │
│   TX/RX → TEC-1 C1 Serial line                             │
│   PWM1 → Vertical motor driver (Descent axis)              │
│   PWM2 → Pitch servo                                       │
│   PWM3 → Yaw servo                                         │
│   ADC1 → Fuel meter simulation (analog pot input)          │
│   DIO0 → Touchdown switch                                  │
│   DIO1 → Crash sensor (optional accelerometer flag)        │
│   DIO2 → IMU serial data                                   │
└────────────────────────────────────────────────────────────┘

                     │
                     │ PWM lines & motor drivers
                     ▼
┌────────────────────────────────────────────────────────────┐
│                MOTOR & SERVO CONTROL BLOCK                 │
│────────────────────────────────────────────────────────────│
│  L298N dual H-bridge driver or ULN2003 transistor array    │
│  Inputs : PWM1 (Pulse)  DIR1 (forward/reverse)             │
│  Outputs: DC motor for vertical descent control             │
│                                                            │
│  Servo1 (Pitch)  → controls lander tilt                    │
│  Servo2 (Yaw)    → simulates attitude adjustment           │
│  LED driver → Thruster LED intensity mapped to thrust PWM  │
└────────────────────────────────────────────────────────────┘

                     │
                     ▼
┌────────────────────────────────────────────────────────────┐
│                   LUNAR LANDER MODEL (40 cm)               │
│────────────────────────────────────────────────────────────│
│  Suspension Rig: Vertical Axis + Gimbal for Pitch/Yaw      │
│  Thruster LED underneath (base white/blue light)            │
│  CCD camera inside cockpit (fed to monitor)                 │
│  Limit switch touchdown sensor → MCU DIO0                   │
│  Optional IMU → MCU serial feedback                         │
│  “Contact Light” indicator on TEC-1 panel (C5 input)        │
└────────────────────────────────────────────────────────────┘

                     │
                     ▼
┌────────────────────────────────────────────────────────────┐
│                  ROTATING 3D MOON SURFACE                  │
│────────────────────────────────────────────────────────────│
│  DC gear motor (1 RPM) → powered by MOSFET from MCU        │
│  IR or Hall landing zone sensors wired to MCU              │
│  Directional lamp = Sun simulation (12 V halogen or LED)   │
│  Crater impact zone activates crash sound event            │
└────────────────────────────────────────────────────────────┘

                     │
                     ▼
┌────────────────────────────────────────────────────────────┐
│                 AUDIO & RADIO COMM SUBSYSTEM                │
│────────────────────────────────────────────────────────────│
│  Piezo speaker (C0) → Tone generation (LUNAWIN/LOSE)       │
│  DAC module via PWM → Engine rumble sound output           │
│  AUX output → Mini radio transmitter (Mission Control)     │
│  Playback of pre-recorded dialog triggered by events        │
│  (e.g. ALT=00 → “Contact light!”)                           │
└────────────────────────────────────────────────────────────┘
```

---

### 🔌 **Signal Overview**

| Signal        | Source      | Destination      | Purpose                 |
| ------------- | ----------- | ---------------- | ----------------------- |
| A0–A7, D0–D7  | Z80         | Memory / I/O bus | Data/address transfer   |
| /RD,/WR,/IORQ | Z80         | 8255 PIO         | Read/write control      |
| PA0–PA7       | 8255 PORT A | 74LS595          | Display data            |
| PB0–PB7       | 8255 PORT B | Keypad matrix    | Input scan              |
| PC0           | 8255 PORT C | Buzzer           | Audio tone              |
| PC1           | 8255 PORT C | Serial TX to MCU | Telemetry out           |
| PC2           | 8255 PORT C | PWM Enable       | Motor control gate      |
| PC3           | 8255 PORT C | LED Thrust       | Visual engine flare     |
| PC4           | 8255 PORT C | CAM Trigger      | CCD frame capture       |
| PC5           | 8255 PORT C | Sensor Input     | Touchdown signal        |
| PC6           | 8255 PORT C | IMU Serial line  | Orientation data        |
| PC7           | 8255 PORT C | Debug LED        | System status indicator |

---

### 🧩 **Peripheral ICs Summary**

| IC                     | Function                                 | Connection                          |
| ---------------------- | ---------------------------------------- | ----------------------------------- |
| **8255 PIO**           | Programmable I/O (TEC-1 expansion)       | Ports A–C to display, keyboard, MCU |
| **74LS595 (×3)**       | Serial-to-parallel shift registers       | Drive 6× 7-segment displays         |
| **ULN2003 / L298N**    | Motor & LED driver                       | Amplifies PWM from MCU              |
| **LS7366R (optional)** | Quadrature counter for position feedback | SPI to MCU                          |
| **LM386 / PWM DAC**    | Audio amplifier for engine noise         | Controlled by TEC-1                 |
| **RTC (DS1302)**       | Optional timing reference                | For mission log events              |

---

### 🛰️ **Summary**

This layout mirrors how Apollo’s *AGC* would interact with descent engines — but scaled down for a hobbyist lab:

* **Z80 (TEC-1)** → brain (Forth logic & state machine)
* **8255 PIO + 74LS595** → I/O expansion and display telemetry
* **MCU Interface (teclink)** → translates logic to PWM and sensor feedback
* **Motor Drivers + LEDs** → simulate engine motion and thrust
* **Audio/Comms** → recreate radio traffic and mission events

---




---

## 🕒 **Control Timing & Signal Waveform – 1 Hz Main Loop**

the **ASCII timing diagram and control cycle** for the **TEC-1 Forth-Controlled Lunar Lander Simulator**, showing how signals flow through each subsystem per frame (roughly 1 Hz loop rate, matching lunar descent timing).

This diagram visualizes the precise **hardware and software synchronization** that happens every control tick — from keyboard input to motor PWM output and feedback sensors.




```
Time →  ─────────────────────────────────────────────────────────────────────────►
Cycle   [t₀]           [t₁]           [t₂]           [t₃]           [t₄]           [t₅]
Event   └─Read Keys─────┘  └─Calc/Display──┘  └─Thrust/Gravity──┘  └─Update Alt───┘  └─Send Telemetry/Audio──┘
Frame   |<───── Input ─────>|<──── Physics Update ────>|<──── Display/Output ───>|<── Feedback & Audio ──>|

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ Z80 CPU BUS (IOREQ, RD, WR)                                                                 │
│    ┌────┐             ┌────┐             ┌────┐             ┌────┐                          │
│ IOREQ──┘    ┌─────────┘    └─────────────┘    └─────────────┘    └─────→ next cycle         │
│ RD──────────┐                   ┌────────────────────────────┐                              │
│ WR───────────────┐        ┌───────────────┐        ┌──────────┐                             │
│ Address Bus: KEY=01h, DISP=00h, MOTOR=05h, SERIAL=03h, AUDIO=02h                            │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ 8255 PIO PORT A/B/C                                                                           │
│                                                                                               │
│ PORT B (KEY IN):    ════╬═Key Scan═╬═══════════════════════════════════════════════════════   │
│ PORT A (DISPLAY):   ═══════════════╬══Display Update══╬═══════════════════════════════════    │
│ PORT C (CONTROL):   ──┬──Buzzer Off──┬──PWM Enable─────┬──LED Pulse──────┬──Sensor Read────   │
│                       │               │                 │                 │                  │
│ Bit C0 (BUZZ)         ────────────────█────────────────────────────────────────────────────   │
│ Bit C1 (SERIAL TX)    ────────────────┬─────────────►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►        │
│ Bit C2 (PWM EN)       ────────────────█████████████████████████████████████████████████████   │
│ Bit C3 (THRUST LED)   ────────────────███████───────███████────────────────────────────────    │
│ Bit C5 (SENSOR IN)    ──────────────────────────────────────╬═Landing detect═╬─────────────    │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ THRUST COMMAND SEQUENCE                                                                      │
│                                                                                              │
│ + Key Press Detected (t₀):       +++++++++++++++++++++++++++++++++++++                      │
│ Forth Word THRUST:               ↓ Reads FUEL → dec 1, VEL += 2                              │
│ Port 05h (MOTOR PWM):            ────────────────████████████████──────────────               │
│ Port 06h (THRUST LED):           ────────────────███████───────────────────────               │
│ FUEL Display (Port 00h):         Updated → [19]                                              │
│ Velocity Display (Port 00h):     Updated → [02]                                              │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ GRAVITY / PHYSICS UPDATE                                                                     │
│                                                                                              │
│ Each tick (1 Hz):                                                                            │
│   - GRAVITY subtracts 1 from VEL (Port 00h update)                                           │
│   - ALT += VEL (BCD arithmetic)                                                              │
│   - DAA adjusts BCD digits before display                                                    │
│                                                                                              │
│ VEL (memory 4802h):        03 → 02 → 01 → 00 → -01 → crash if too large                      │
│ ALT (memory 4800h):        50 → 48 → 44 → 40 → 35 → 30 → ...                                 │
│ FUEL (memory 4801h):       20 → 19 → 18 → ...                                                │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ ROBOT CONTROLLER (teclink MCU)                                                              │
│                                                                                              │
│ Serial TX from TEC-1 (Port 03h):   [ALT,FUEL,VEL][THRUST_FLAG][STATE] packet stream          │
│ PWM Outputs:                        ───████───────────────████───────→ servo driver          │
│ LED (thruster):                     Follows PWM duty cycle                                  │
│ Feedback DIO (touchdown):           Low → High when lander base switch pressed               │
│ Returns SENSOR flag via Port 04h to TEC-1                                                    │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ AUDIO AND MISSION COMMS                                                                      │
│                                                                                              │
│ Port 02h (AUDIO):     ──Engine hum (low duty PWM)───────────────────────────                 │
│ Port 0Ah (RADIO):     ─────────────┬──Voice event──┬──────────────┬──Crash tone──────┬──     │
│                                    │                │              │                  │        │
│ Events Triggered:                  │“Go for descent”│“Contact”     │“Engine stop”     │        │
│ Play via piezo/DAC amplifier.      │                │              │                  │        │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ SENSOR FEEDBACK (Landing Detection)                                                          │
│                                                                                              │
│ Landing switch closes → MCU sets DIO0 = HIGH → TEC-1 reads Port 09h = 1                      │
│                                                                                              │
│ t₄: SENSOR=1 → ALT=00h detected                                                              │
│       ├── STATE := WIN                                 (Memory 4803h = 01h)                  │
│       ├── Output LUNAWIN tune (Port 02h)                                                    │
│       └── Display “00 00 00” + blink LEDs                                                   │
│                                                                                              │
│ t₅: Key pressed → RESET → RUN again                                                         │
└──────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 🧩 **Signal Timing Summary Table**

| Signal / Port             | Type    | Triggered At   | Duration   | Function            |
| ------------------------- | ------- | -------------- | ---------- | ------------------- |
| **IOREQ**                 | Control | Every subcycle | 2–3 µs     | Bus access          |
| **PORT 01h (KEYIN)**      | Read    | Start of frame | ~50 µs     | Key scan            |
| **PORT 00h (DISPLAY)**    | Write   | Mid-frame      | 200 µs     | Update display      |
| **PORT 05h (MOTOR)**      | PWM     | t₁→t₃          | 100–400 ms | Engine control      |
| **PORT 06h (THRUST LED)** | PWM     | t₁→t₃          | 100–200 ms | Flame flicker       |
| **PORT 02h (AUDIO)**      | PWM     | Continuous     | –          | Engine hum / tunes  |
| **PORT 03h (SERIAL)**     | UART TX | End of frame   | 5 ms burst | Send telemetry      |
| **PORT 09h (SENSOR)**     | Read    | Each frame     | 10 µs      | Touchdown detection |
| **PC0–C7 (PIO)**          | Mixed   | Continuous     | Varies     | Display + control   |

---

## 🧠 **Cycle Breakdown (per Second)**

| Phase       | Duration  | Operation                  | Hardware     |
| ----------- | --------- | -------------------------- | ------------ |
| Input Phase | 0–0.1 s   | Read keypad / thrust key   | PIO PORT B   |
| Physics     | 0.1–0.4 s | Update velocity, altitude  | CPU + memory |
| Output      | 0.4–0.7 s | Write to display, PWM, LED | PIO A/C      |
| Telemetry   | 0.7–0.9 s | Serial TX to MCU           | Port 03h     |
| Feedback    | 0.9–1.0 s | Sensor check, audio event  | Port 04h/02h |

Repeat at ~1 Hz for smooth visible simulation and servo response.

---

## 🎛️ **Visualizing the Control Loop**

```
   +---------+
   | Keyboard|  (+ pressed)
   +----┬----+
        │
        ▼
 ┌──────────────┐     ┌───────────────┐
 │  Forth Loop  │────►│  Update Vars  │
 │ (THRUST/GRAV)│     │  ALT,V,F,FUEL │
 └──────────────┘     └──────┬────────┘
                             │
               ┌─────────────▼─────────────┐
               │ Write Display + Send Data │
               └─────────────┬─────────────┘
                             │
                             ▼
                ┌────────────────────────┐
                │  Robot Controller MCU  │
                │  (PWM, LED, Sensors)   │
                └────────────┬───────────┘
                             │ Feedback
                             ▼
                    ┌────────────────────┐
                    │ TEC-1 reads Sensor │
                    │ Plays Tune + Reset │
                    └────────────────────┘
```

---

## 🛰️ **Summary**

* The **TEC-1** executes one control cycle per second: read → compute → output → verify.
* Each tick updates the physical **lander descent rate** and **LED display**.
* The **MCU interface** runs in real time (~50 Hz PWM loop) to translate TEC-1 commands to motion.
* A feedback signal completes the loop — emulating Apollo’s landing dynamics through discrete retro logic.

---


---

## ⚙️ **PWM Thrust Control Timing Diagram**

 **micro-timing layer**, showing how the **TEC-1 Forth “THRUST” command** translates into a real physical PWM pulse train that drives the descent motor and the thruster LED through the **teclink MCU interface**.

This is essentially the “heartbeat” of your simulated rocket engine.


### *Zoomed-in View: TEC-1 → MCU → Motor / LED Response*

```
Time Scale:  0ms        50ms       100ms      150ms      200ms      250ms
Loop Rate:   ~50 Hz PWM carrier within 1 Hz main control tick
```

```
┌────────────────────────────────────────────────────────────────────────────┐
│ EVENT SEQUENCE                                                            │
│ 1. Pilot presses “+” key on TEC-1 keypad                                  │
│ 2. Forth word THRUST executes (VEL+=2, FUEL–1)                            │
│ 3. TEC-1 outputs a digital thrust command over serial (Port 03h)          │
│ 4. MCU converts this value into PWM duty cycle (0–100 %)                  │
│ 5. PWM drives:                                                            │
│      – Motor driver (vertical descent servo / DC)                         │
│      – LED driver (thruster brightness)                                   │
│ 6. Feedback sensor monitored for landing                                  │
└────────────────────────────────────────────────────────────────────────────┘
```

---

### 🕒 **Waveform View (1 Pulse Packet = 20 ms period)**

```
Voltage (5 V logic) ─────────────────────────────────────────────────────────► Time
             0ms        5        10       15       20       25       30  ... 200 ms

TEC-1 Serial TX (Port 03h):
─────┐┌──────────────────────────────────────────────────────────────────────
     ││ “T” “H” “2” “0” <CR>     (ASCII command string at 9600 bps)
─────┘└──────────────────────────────────────────────────────────────────────

MCU Decode (THRUST = 2 units = 40 % duty) → PWM output
Motor PWM (5 V logic):
█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░
██████ = 8 ms ON   ░░░░░░ = 12 ms OFF     → 40 % duty cycle, 50 Hz frequency

Thruster LED PWM (Port 06h mirror):
█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░█░░░░
Brightness proportional to duty (soft flare effect)
```

---

### 📶 **Duty-Cycle Mapping Table**

| Forth `THRUST` Level | Velocity Δ | PWM Duty (%) | Motor Effect  | LED Brightness |
| -------------------- | ---------- | ------------ | ------------- | -------------- |
| 0 (idle)             | 0          | 0 %          | engine off    | off            |
| 1                    | +1         | 20 %         | gentle burn   | dim            |
| 2                    | +2         | 40 %         | normal thrust | medium         |
| 3                    | +3         | 60 %         | strong burn   | bright         |
| 4                    | +4         | 80 %         | max thrust    | white-hot      |
| 5 (overburn)         | +5         | 100 %        | full throttle | saturated      |

---

### 🔁 **Micro-Timing within the 1 Hz Control Frame**

```
Main Control Loop (1 Hz)
│
├─ t₀ (0 ms):   TEC-1 reads key → THRUST executed
├─ t₁ (5 ms):   Serial packet sent → MCU receives “THRUST=2”
├─ t₂ (10 ms):  MCU sets PWM duty = 40 %
│                │
│                ├─ PWM high 8 ms  → motor current rises
│                ├─ PWM low 12 ms  → motor coast
│                └─ Repeats @ 50 Hz until next frame
│
├─ t₃ (500 ms): TEC-1 applies GRAVITY update (–1 velocity)
│
└─ t₄ (1000 ms): MCU maintains last PWM until new command
```

---

### 🔧 **Electrical Characteristics**

| Parameter         | Symbol          | Typical                |
| ----------------- | --------------- | ---------------------- |
| PWM Frequency     | f<sub>PWM</sub> | 50 Hz (servo standard) |
| PWM Voltage       | V<sub>H</sub>   | 5 V TTL logic          |
| Motor Current     | I<sub>M</sub>   | 0.2–0.5 A peak         |
| LED Current       | I<sub>LED</sub> | 20–60 mA via driver    |
| TEC-1 Serial Rate |                 | 9600 bps (TTL)         |
| Command Latency   |                 | ~6 ms (end-to-end)     |

---

### 🔄 **Feedback Loop Integration**

```
PWM Output  ──► Motor / LED
   │
   ▼
Position Sensor (limit switch / encoder)
   │
   ▼
MCU DIO feedback ──► TEC-1 Port 09h
   │
   └─► If HIGH + ALT=00h → play LUNAWIN tune
```

---

### 🧩 **Summary**

* **Digital Command → Analog Motion:**
  The Z80 sends a 1-byte “thrust magnitude” each frame. The MCU converts it to a proportional PWM duty cycle that directly controls both **motor lift** and **LED engine glow**.

* **Continuous Feedback:**
  The PWM continues at 50 Hz between 1 Hz frame updates, giving smooth mechanical motion despite the slow TEC-1 loop.

* **Realistic Thrust Behavior:**
  Higher duty cycles lift the lander faster but drain more fuel (each thrust event decrements FUEL by one unit per second).

* **Synchronous Audio Cue:**
  PWM duty modulates engine hum frequency on Port 02h, tying sound intensity to thrust level.

---



---

## 🎧 **Dual-Channel Waveform: Motor PWM vs Audio PWM**

 **dual-channel ASCII oscilloscope view** showing how the **motor PWM** (Port 05h) and **audio PWM** (Port 02h) run in synchrony during a thrust event — producing both physical lift and audible engine sound.




```
Time Scale:  0 ms     5     10     15     20     25     30     35     40     45     50
PWM Rate:    50 Hz  (20 ms period)      Audio Rate: 500 Hz  (2 ms period)

Channel 1 – Port 05h  (MOTOR PWM)
5 V ─█──────█──────█──────█──────█──────█──────█──────█──────█──────█──────█──────█──
0V  ─┘      └──────┘      └──────┘      └──────┘      └──────┘      └──────┘      └──
Duty ≈ 40 %  → moderate lift

Channel 2 – Port 02h  (AUDIO PWM / Engine Hum)
5 V ▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄
0V ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Amplitude modulated with motor PWM envelope → audible rumble synced to thrust
```

---

### 📊 **Synchronization Envelope**

| Parameter  | Motor PWM                         | Audio PWM                                |
| ---------- | --------------------------------- | ---------------------------------------- |
| Frequency  | 50 Hz                             | 500 Hz                                   |
| Duty Cycle | 40 % → 60 % → 20 %                | 100 %, amplitude-modulated by motor duty |
| Function   | Servo / Motor lift                | Engine sound intensity                   |
| Modulation | Duty cycle proportional to thrust | Envelope follows motor PWM duty          |
| Output     | L298N or ULN2003 driver           | Piezo / DAC amplifier                    |

---

### 🔁 **How the Two Channels Interact**

1. **Pilot presses “+” key**

   * Forth `THRUST` executes → sets `THRUST=2`
   * TEC-1 sends duty value (≈ 40 %) via Port 03h → MCU

2. **MCU generates**

   * **Motor PWM (50 Hz)** → drives lift actuator
   * **Audio PWM (500 Hz)** → sine-like pulse via piezo
   * Motor duty = envelope for audio amplitude

3. **Perceived Effect**

   * As thrust increases, LED and motor brightness rise
   * Engine sound grows louder and lower in pitch
   * At cutoff (0 % duty), both channels drop to 0 V

---

### 🧩 **Simplified Envelope Relationship**

```
Motor Duty %   │      0      20     40     60     80    100
Audio Volume % │      0      25     50     75     90    100
Audio Pitch Hz │    300     350    400    450    480    500
```

---

### 🔄 **Timing in the 1 Hz Frame**

```
0 ms  : THRUST command issued (TEC-1 Port 03h)
5 ms  : MCU begins PWM envelope (Motor + Audio)
10-900 ms : Continuous synchronized PWM
950 ms : Fade-out ramp
1000 ms: Next control frame / gravity update
```

---

### ⚙️ **Practical Implementation**

* **Motor PWM (Port 05h)** drives L298N input → 12 V descent motor
* **Audio PWM (Port 02h)** feeds low-pass RC filter → LM386 amplifier → speaker
* Shared timing base (Timer 1 @ 20 ms period) ensures phase-lock
* Optional: add random ±2 % duty jitter to simulate flame turbulence

---

### 🚀 **Result**

A single keypress on the TEC-1 now produces:

* A **pulse of thrust** that physically lifts the model,
* A **flickering LED flame**, and
* A **synchronized growl** of the lunar engine —
  all driven from the same digital envelope and timed by the 1 Hz control loop.

---






---

## ⚡ **Triple-Trace Oscilloscope — TEC-1 Thrust Event Synchronization**

 **full triple-trace ASCII oscilloscope view** of your Lunar Lander’s synchronized systems:
**motor PWM**, **audio PWM**, and **thruster LED brightness**, all driven from the same TEC-1 control pulse.


### *(Motor + Audio + LED Channels in Sync)*

```
Time →   0ms     5      10     15     20     25     30     35     40     45     50
Frame:   Pilot presses “+” —> Forth THRUST executes —> PWM envelope active
```

```
Channel 1 — MOTOR PWM (Port 05h → L298N driver)
Voltage  ─█──────█──────█──────█──────█──────█──────█──────█──────█──────█──────█──────█─
0V        └──────┘      └──────┘      └──────┘      └──────┘      └──────┘      └──────┘
Frequency ≈ 50 Hz   Duty = 40 % (normal thrust)

Channel 2 — AUDIO PWM (Port 02h → LM386 amplifier)
Voltage  ▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄█▄
0V       ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Frequency ≈ 500 Hz   Amplitude envelope follows motor PWM duty → “engine rumble”

Channel 3 — THRUSTER LED (Port 06h → ULN2003 transistor array)
Current   ███░░░░███░░░░███░░░░███░░░░███░░░░███░░░░███░░░░███░░░░███░░░░███░░░░███░░░░
Light ↑   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
PWM = 40 % brightness → soft orange flame with realistic flicker
```

---

### 🧩 **Synchronization Relationships**

| Channel       | Source Port | Frequency            | Role                   | Signal Relationship                                 |
| ------------- | ----------- | -------------------- | ---------------------- | --------------------------------------------------- |
| **Motor PWM** | 05h         | 50 Hz                | Controls descent speed | Base envelope signal                                |
| **Audio PWM** | 02h         | 500 Hz               | Engine sound (LM386)   | Amplitude modulated by Motor PWM duty               |
| **LED PWM**   | 06h         | 50 Hz (phase-locked) | Visual flame           | Same duty % as motor, phase-shifted 90° for flicker |

---

### 🔄 **Phase & Modulation**

```
Motor PWM        ███░░░░███░░░░███░░░░███░░░░
Audio PWM Env    ████████████████████████████ (nested fast pulses)
LED PWM (flicker)  ░███░░███░░███░░███░░███░░   (slight phase lag)
```

* **Motor PWM** → base envelope (defines thrust magnitude)
* **Audio PWM** → modulated at 500 Hz with motor duty envelope
* **LED PWM** → uses same duty but slight 90° phase lag for “flicker realism”

---

### 🔧 **Implementation Notes**

| Component              | Function                                    | Notes                                     |
| ---------------------- | ------------------------------------------- | ----------------------------------------- |
| **L298N Motor Driver** | Drives 12 V descent actuator                | Uses PWM from MCU’s Timer 1 (Port 05h)    |
| **ULN2003**            | Switches LED current                        | Driven by MCU Timer 2 (Port 06h)          |
| **LM386 Amplifier**    | Converts audio PWM into analog engine sound | Low-pass RC filter removes 500 Hz carrier |
| **PWM Sync Timer**     | Keeps 05h = 06h duty cycles matched         | Internal MCU interrupt @ 20 ms period     |

---

### 🔁 **Dynamic Duty Changes Over 1 Hz Frame**

```
t₀ – 100 ms : Pilot taps “+” → 40 % duty
t₁ – 200 ms : Sustained hold → 60 % duty (engine roar grows)
t₂ – 800 ms : Release → gravity decay → 20 % duty fade
t₃ – 1000 ms: Cycle end → sound fades, LED glows out
```

---

### 📊 **Output Envelope vs Perception**

| Duty % | Motor Lift       | LED Brightness  | Audio Volume        | Perceived Thrust      |
| ------ | ---------------- | --------------- | ------------------- | --------------------- |
| 0      | None             | Off             | Silent              | Idle                  |
| 20     | Gentle drift     | Dim orange      | Low hum             | Hover                 |
| 40     | Stable descent   | Warm glow       | Steady rumble       | Controlled fall       |
| 60     | Lift gain        | Bright white    | Strong roar         | Recovery burn         |
| 80     | Aggressive climb | Brilliant white | Intense roar        | Abort thrust          |
| 100    | Max              | Saturated       | Clipping distortion | Full emergency thrust |

---

### 🛰️ **Temporal Integration (within 1 Hz frame)**

```
0 ms     100 ms     500 ms     900 ms     1000 ms
│         │           │           │           │
│  TEC-1 sends THRUST │ MCU maintains PWM    │ TEC-1 updates GRAV
│  via Port 03h        │ (Motor + LED + Audio)│ and redraws display
└───────────────────────┴───────────────────────┴─────────────────────►
       Visual, mechanical, and acoustic effects remain phase-locked
```

---

### 🧠 **Result**

* The **Z80 Forth “THRUST” word** drives all three outputs via one synchronized digital envelope.
* Each channel expresses a different sensory dimension:

  * **Motor PWM** → force,
  * **Audio PWM** → sound,
  * **LED PWM** → light.
* Together they produce a *realistic, analog-feeling rocket response* from a purely digital control source.

---





---

## 🚀 **TEC-1 LUNAR LANDER — COCKPIT-VIEW TIMELINE**

 **ASCII “cockpit-view schematic”**, showing what a pilot (or an observer watching your 3D lunar lander model) experiences when the TEC-1 executes a thrust pulse.
It merges **LED brightness**, **audio volume**, and **motion/altitude** into a unified sensory timeline — like looking through the window of the lander during descent.


### *(LED flare • Engine sound • Lander motion vs altitude)*

```
TIME →    0s        0.2s       0.4s       0.6s       0.8s       1.0s
Event →   + Key pressed             Engine burns              Gravity resumes
```

```
┌──────────────────────────────────────────────────────────────────────────┐
│ LED FLARE (Port 06h) – Thruster brightness                               │
│                                                                          │
│   ███░░░░███░░░░██████░░███████░░████░░░░██░░░░                         │
│   Glow: ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓         │
│   Color shift: → amber → yellow → white → fade amber → off              │
│   (PWM duty 20→60→40→0 %)                                               │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│ AUDIO HUM (Port 02h) – Engine roar intensity (LM386 output)              │
│                                                                          │
│   ▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄▄█▄        │
│   Amplitude envelope follows LED PWM; low-frequency tremor rises         │
│   as thrust increases; fades when key released.                          │
│   Speaker tone ≈ 300→450 Hz with 10 Hz rumble modulation.                │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│ ALTITUDE (Memory 4800h → Display) – Descent profile                      │
│                                                                          │
│   Altitude digits on 7-seg: 50 → 46 → 42 → 39 → 37 → 35 → ...            │
│   LED display scrolls downward as the model physically lowers.           │
│   Motion:                                                                │
│       ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░               │
│       ↓  Gentle drift → hover → slow drop → contact                     │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│ CABIN VIEW (Cockpit CCD feed)                                            │
│                                                                          │
│   • Lunar horizon rising slowly in the window.                           │
│   • LED glow reflects off panel edges.                                   │
│   • Instrument display shows:                                            │
│        ALT: 37   FUEL: 18   VEL: 02                                      │
│   • Audio mix: deep rumble + comm static (“Eagle, you’re go for descent”)│
│   • When altitude < 05 →  “Contact light!” + tone from Port 02h          │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│ MOTION FEEDBACK (Robot Arm / Servo)                                      │
│                                                                          │
│   ↑ (pre-burn)      = idle                                                │
│   ↓ (thrust pulse)  = slowed descent                                      │
│   ▽ (engine off)    = gravity resumes                                     │
│                                                                          │
│   Servo PWM: 20→60→40→0 %  mapped to 1 cm per second physical movement.  │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│ FINAL TOUCHDOWN                                                          │
│                                                                          │
│   • Altitude display hits “00”.                                          │
│   • LED flickers one last white pulse.                                   │
│   • Audio tone changes to “LUNAWIN” melody (Port 02h).                   │
│   • Servo stops; lander base switch sends HIGH to Port 09h.              │
│   • Message: “CONTACT LIGHT — ENGINE STOP.”                              │
└──────────────────────────────────────────────────────────────────────────┘
```

---

### 🧠 **Perceptual Synchrony Table**

| Moment    | LED Color     | Audio Pitch           | Motor Duty | Perceived Motion   | Altitude Display |
| --------- | ------------- | --------------------- | ---------- | ------------------ | ---------------- |
| t = 0 s   | off           | silence               | 0 %        | free-fall          | 50               |
| t = 0.2 s | amber glow    | 350 Hz hum            | 20 %       | slowing            | 46               |
| t = 0.4 s | bright yellow | 420 Hz roar           | 60 %       | hover / lift       | 42               |
| t = 0.6 s | steady white  | 400 Hz                | 40 %       | controlled descent | 39               |
| t = 0.8 s | fading orange | 300 Hz fade           | 20 %       | drift to surface   | 35               |
| t = 1.0 s | off flash     | 0 Hz + “contact” beep | 0 %        | landed             | 00               |

---

### 🎛️ **Hardware Chain at a Glance**

```
TEC-1 (Z80 / Forth)
     │  Ports 02h, 05h, 06h
     ▼
teclink MCU  →  L298N  →  Servo Motor  (motion)
              →  ULN2003 → Thruster LED (light)
              →  LM386  → Speaker       (sound)
     ▲                              │
     └────── Sensor feedback (Port 09h “contact light”) ──────┘
```

---

### 🌕 **Pilot’s Impression**

> *“Thrust looks good.  LEDs are glowing steady… hear that hum?
> We’re slowing at 35 metres… contact light—engine stop!”*

The **LED flicker**, **audio rumble**, and **servo motion** are all bound to the same digital timing source, producing an immersive illusion of real lunar descent — powered entirely by the tiny **TEC-1 computer**.

---


---

## 🛰️ **MISSION CONTROL CONSOLE — “HOUSTON” TELEMETRY DISPLAY**

 **Mission Control Console View** for your *TEC-1 Lunar Lander Project*.
It shows how “Houston” receives real-time telemetry from the TEC-1 (via serial), decodes it into instruments, and displays GO/NO-GO indicators for altitude, fuel, and descent velocity.


### *(TEC-1 serial feed → telemetry visualization → control status)*

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                     ██████  HOUSTON MISSION CONTROL  ██████                  │
│                    TEC-1  LUNAR DESCENT  SIMULATION LINK                     │
│                     (Serial Channel 9600 bps TTL)                            │
├──────────────────────────────────────────────────────────────────────────────┤
│  LIVE TELEMETRY STREAM (decoded from TEC-1 Port 03h serial output):          │
│                                                                              │
│   [ALT: 42] [VEL: 02] [FUEL: 18] [STATE: DESCENT] [THRUST: 40%]             │
│   [ALT: 38] [VEL: 03] [FUEL: 17] [STATE: STABLE]   [THRUST: 20%]            │
│   [ALT: 34] [VEL: 01] [FUEL: 17] [STATE: CONTACT]  [THRUST:  0%]            │
│                                                                              │
│  Incoming ASCII packet (example):                                            │
│     “TLM,ALT=42,FUEL=18,VEL=02,THR=40,STAT=RUN<CR>”                         │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

### 🖥️ **CONSOLE DASHBOARD PANEL**

```
┌────────────────────────────────────────────────────────────────────────────┐
│                            TELEMETRY PANEL                                 │
│────────────────────────────────────────────────────────────────────────────│
│  ALTITUDE     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  042 m                                 │
│  VELOCITY     ▓▓▓▓▓▓▓▓                02 m/s                               │
│  FUEL         ▓▓▓▓▓▓▓▓▓▓▓             18 L                                 │
│────────────────────────────────────────────────────────────────────────────│
│  ENGINE THRUST:  ████░░░░░░  40 %                                          │
│  STATUS:          [DESCENT PHASE ACTIVE]                                   │
│  IMU:             Pitch +1.3°, Roll –0.7°, Rate 0.4 deg/s                  │
│  CONTACT LIGHT:   OFF                                                      │
│────────────────────────────────────────────────────────────────────────────│
│  SERIAL LINK:     CONNECTED  (9600 bps)                                    │
│  SIGNAL INTEGRITY: 99.4 %                                                  │
└────────────────────────────────────────────────────────────────────────────┘
```

---

### 🧮 **DATA PIPELINE OVERVIEW**

```
[TEC-1 Z80/Forth Core]
  │
  │  Serial TX (Port 03h)
  ▼
[UART-TTL interface / tecLINDAR MCU]
  │
  │  → ASCII Telemetry Packets
  ▼
[Mission Control Terminal / PC or Second TEC-1]
  │
  │  Parses lines via UART
  ▼
[Display Module]
  ├── ALT bargraph
  ├── FUEL bargraph
  ├── VEL numeric gauge
  ├── THRUST indicator LEDs
  └── STATUS lights: GO / NO-GO / CONTACT
```

---

### 🧭 **GO/NO-GO LOGIC TABLE**

| Parameter          | Nominal Range | Status Logic     | Display             |
| ------------------ | ------------- | ---------------- | ------------------- |
| **Altitude (ALT)** | > 05 m        | Green = GO       | GO until landing    |
|                    | ≤ 05 m        | Amber = Stand-by | Prepare for contact |
|                    | = 00 m        | Blue = CONTACT   | “Engine stop”       |
| **Fuel (FUEL)**    | > 05 L        | Green            | Safe                |
|                    | ≤ 05 L        | Red = CRITICAL   | Flashing LED        |
| **Velocity (VEL)** | < 05 m/s      | Green = Safe     |                     |
|                    | 05–10 m/s     | Yellow = Fast    | Warn tone           |
|                    | > 10 m/s      | Red = Danger     | Alarm tone          |
| **Comms (SERIAL)** | Linked        | Green            |                     |
|                    | Lost          | Red              | “Signal Lost”       |
| **System State**   | DESCENT       | Blue             | Active              |
|                    | CONTACT       | White            | Landed              |
|                    | CRASH         | Red              | Mission failed      |

---

### 🔊 **AUDIO / ANNUNCIATOR OUTPUTS**

| Condition        | Sound Event                    | Source (Port 02h) |
| ---------------- | ------------------------------ | ----------------- |
| THRUST > 0       | Engine rumble (PWM envelope)   | LM386 amp         |
| FUEL < 5 L       | “Low fuel” tone                | Piezo             |
| ALT = 0 m        | “Contact light!” + Win melody  | LUNAWIN table     |
| STATE = CRASH    | Alarm buzzer + LUNALOSE melody | 0x0484 sequence   |
| SERIAL link lost | 1 Hz beep                      | SCANDISP service  |

---

### 🧠 **Operator Workflow (Houston)**

```
     ┌───────────────┐
     │  TEC-1 Unit   │  — running LUNALANDER Forth loop
     └──────┬────────┘
            │  Serial telemetry 9600 bps
            ▼
     ┌───────────────┐
     │ Mission Ctrl  │  — parses ASCII, updates bargraphs
     └──────┬────────┘
            │  Thresholds trigger alarms
            ▼
     ┌───────────────┐
     │  Audio Panel  │  — mixes engine rumble + voice
     └───────────────┘
```

---

### 🧩 **Mission Log Snapshot (example)**

```
TIME     ALT  FUEL  VEL  STATE     NOTES
------------------------------------------------
T+00.0   50   20    00   INIT      All systems nominal
T+02.5   42   18    02   DESCENT   Engine burn stable
T+04.7   36   17    03   DESCENT   Hover correction
T+05.8   29   15    02   FINAL     Preparing contact
T+06.1   00   14    00   CONTACT   Engine stop
------------------------------------------------
Mission Result:  SUCCESSFUL LANDING
```

---

### 🎛️ **Hardware for the Control Console**

| Module                          | Function                    | Example                          |
| ------------------------------- | --------------------------- | -------------------------------- |
| **Second TEC-1 or PC Terminal** | Telemetry receiver & parser | Serial monitor / Python terminal |
| **LED Matrix Panel**            | Displays bargraphs          | 8×32 WS2812 or discrete LEDs     |
| **7-segment display**           | Mirrors lander readings     | ALT/FUEL/VEL digits              |
| **Piezo speaker**               | Alarms                      | Port 02h input                   |
| **Toggle switches**             | Manual GO/ABORT             | 5 V logic inputs                 |
| **CRT or OLED**                 | Cockpit video feed          | Camera HDMI / composite input    |

---

### 🌍 **Mission Control Scene Visualization**

```
┌─────────────────────────────────────────────────────────────┐
│  ░░░░░░░░░░░░  MISSION CONTROL  ░░░░░░░░░░░░                 │
│                                                             │
│  [🖥️ ALT: 037m] [VEL: 02 m/s] [FUEL: 17 L]                  │
│  [THRUST: ████░░░░░░ 40 %]  [CONTACT LIGHT: OFF]            │
│                                                             │
│  Operator: “Eagle, telemetry stable… altitude holding…       │
│  Houston copy: you’re GO for final descent.”                 │
│                                                             │
│  → LED bar drops slowly as altitude decreases                │
│  → Audio rumble synced with motor PWM                        │
│  → Final tone plays upon touchdown                           │
└─────────────────────────────────────────────────────────────┘
```

---

### 🧩 **End-to-End Control Chain Summary**

```
[ TEC-1 Z80 / Forth ]
   │
   │ Serial packets (TLM: ALT,FUEL,VEL,THR,STATE)
   ▼
[ tecLINDAR MCU ]
   │
   │ Motor + LED + Audio PWM  ⇄  Sensor feedback
   ▼
[ Lander Model ]     → CCD camera → monitor
   │
   │ Telemetry echo
   ▼
[ Houston Console ]
   │
   ├── Displays: bargraphs / numeric
   ├── Sounds: status tones
   └── Logs: mission report / CSV dump
```

---

### 🚀 **Final Impression**

> **Houston:** “Eagle, telemetry stable—fuel at seventeen, descent rate good.”
> **Buzz:** “Copy, Houston. Contact light! Engine stop.”
> **Houston:** “Roger, Eagle. We copy you on the surface.”
> *(LUNAWIN tune plays on Port 02h speaker)*

---





---

## 🔄 **Two-Way Telemetry & Command Architecture**


 **two-way data-link architecture** for your **TEC-1 ↔ Mission Control bidirectional telemetry system**, showing exactly how Houston can both **receive data** from and **send commands** to the TEC-1 during a simulated lunar descent.
This extends your previous cockpit and console schematics into a complete *closed-loop communication and control network.*




### *TEC-1 ⇄ tecLINDAR MCU ⇄ Mission Control Console*

```
┌───────────────────────────────────────────────────────────────────────────────┐
│                           TWO-WAY DATA FLOW DIAGRAM                            │
└───────────────────────────────────────────────────────────────────────────────┘

      ↑                 ▲
      │  Sensor Data    │  Command Acks / Telemetry Frames
      │                 │
      │   (1 Hz frame rate)
      │
┌──────────────┐        TX: Port 03h (TEC-1 → Houston)        RX: Port 04h (Houston → TEC-1)
│   TEC-1 SBC  │───────────────────────────────────────────────────────────────────────────────┐
│ (Z80 + Forth)│        ASCII serial @ 9600 bps TTL                                              │
│──────────────│                                                                                │
│  I/O PORTS:  │                                                                                │
│  00h – Display digits (ALT,FUEL,VEL)                                                          │
│  02h – Audio PWM output                                                                       │
│  03h – Serial TX → Mission Control (teclink interface)                                        │
│  04h – Serial RX ← Mission Control                                                            │
│  05h – Motor PWM output                                                                       │
│  06h – Thruster LED PWM                                                                       │
│  09h – Touchdown Sensor input                                                                 │
└──────────────┘                                                                                │
      │                                                                                         │
      ▼                                                                                         │
┌────────────────────┐    TX/RX via TTL (USB/UART bridge or tecLINDAR MCU)                      │
│ tecLINDAR MCU HUB  │──────────────────────────────────────────────────────────────────────────┘
│────────────────────│
│  UART0 ↔ TEC-1  (TX/RX pair)                                                                  │
│  UART1 ↔ PC Console (USB Virtual COM)                                                         │
│  GPIO ↔ Motors, LEDs, Sensors                                                                 │
│  Logic:  relays commands, verifies checksums, and buffers TX/RX streams                       │
│                                                                                               │
│  ▸ Handles "Houston → TEC-1" control packets:                                                 │
│     e.g., {CMD: 'ABORT'} {CMD: 'RESET'} {CMD: 'PLAYTUNE 1'}                                  │
│  ▸ Converts ASCII control strings → Z80 I/O pulses on Port 04h                                │
│  ▸ Echoes TEC-1 telemetry upstream for Mission Control display                                │
└────────────────────┘
      │
      ▼
┌───────────────────────────────────────────────────────────────────────────────┐
│                        HOUSTON MISSION CONSOLE / PC                           │
│───────────────────────────────────────────────────────────────────────────────│
│  ▸ Receives telemetry via UART (from MCU)                                     │
│     e.g., “ALT=042,FUEL=18,VEL=02,STATE=DESCENT,THR=40”                       │
│  ▸ Parses and updates dashboard (bars, gauges, tones)                         │
│  ▸ Sends operator commands on keypress (downlink)                             │
│     → ABORT, REBOOT, RESTART, PLAYTUNE, FUELBOOST, etc.                       │
│  ▸ Command format: “CMD,ABORT<CR>”                                            │
└───────────────────────────────────────────────────────────────────────────────┘
```

---

## 🛰️ **SERIAL FRAME STRUCTURE**

| Direction                      | Type      | Frame Format                                             | Example                         |
| ------------------------------ | --------- | -------------------------------------------------------- | ------------------------------- |
| **Uplink (TEC-1 → Houston)**   | Telemetry | `TLM,ALT=42,FUEL=18,VEL=02,THR=40,STAT=RUN<CR>`          | → updates display               |
| **Downlink (Houston → TEC-1)** | Command   | `CMD,ABORT<CR>` / `CMD,PLAYTUNE 1<CR>` / `CMD,RESET<CR>` | → triggers TEC-1 word execution |

---

## 🔐 **HANDSHAKE SEQUENCE**

```
1. TEC-1  sends telemetry  →  “TLM,...<CR>”
2. Houston receives, parses, displays data
3. Houston sends optional command packet:
       “CMD,RESET<CR>”
4. MCU buffers and forwards packet to TEC-1 Port 04h (RX)
5. TEC-1 Forth parser executes matching word:
       :RESET  CLEAR  INIT  ;
6. TEC-1 replies with confirmation:
       “ACK,RESET,OK<CR>”
7. Houston logs response → “Command acknowledged”
```

---

## 📡 **ASCII WAVEFORM: TX/RX INTERLEAVE**

```
Time → 0ms   100   200   300   400   500   600   700   800   900   1000ms
Channel 1 (TEC-1 TX → Houston RX)
─────┐┌───────────────────────────────────────────┐┌────────────────────────
     ││ “TLM,ALT=042,FUEL=18,VEL=02…”             ││ “TLM,ALT=038,…”
─────┘└───────────────────────────────────────────┘└────────────────────────

Channel 2 (Houston TX → TEC-1 RX)
──────────────────────────┐────────────┐──────────────────────────────
                          │ “CMD,RESET”│
──────────────────────────┘────────────┘──────────────────────────────
         (TEC-1 Port 04h reads packet at next input phase)
```

---

## 🧩 **Forth-Side Command Hooks**

Example: receive ASCII from Port 04h and branch by prefix

```forth
: RXBYTE ( -- c )  04 IN ;          \ read incoming UART byte
: WAITCR ( -- )    BEGIN RXBYTE DUP 13 = UNTIL ;  \ wait for <CR>

: CMD? ( -- flag )
  RXBYTE DUP 'C' = IF DROP RXBYTE 'M' = ELSE 0 THEN ;

: EXEC-CMD ( -- )
  CMD? IF
    \ simple parser for known command patterns
    RXBYTE DUP 'R' = IF RESET THEN
    RXBYTE DUP 'A' = IF ABORT THEN
    RXBYTE DUP 'P' = IF PLAYTUNE THEN
  THEN ;
```

---

## 🔧 **CONTROL COMMAND REFERENCE (Houston → TEC-1)**

| Command          | Action                     | Description                                 |
| ---------------- | -------------------------- | ------------------------------------------- |
| `CMD,RESET`      | `:RESET`                   | Resets variables, reinitializes loop        |
| `CMD,ABORT`      | `:ABORT`                   | Immediately stops descent, sets motor PWM=0 |
| `CMD,REBOOT`     | Hard reset via /RESET line |                                             |
| `CMD,PLAYTUNE n` | `:PLAYTUNE`                | Plays indexed tune from table               |
| `CMD,MANUAL`     | `:MANUAL`                  | Switches to manual throttle override        |
| `CMD,AUTO`       | `:AUTO`                    | Returns to autopilot                        |
| `CMD,DIAG`       | `:DIAG`                    | Prints memory map and status                |
| `CMD,DUMP`       | `:DUMP`                    | Dumps telemetry buffer to serial log        |

---

## 🧭 **LINK STATUS & ERROR HANDLING**

| Status Byte | Meaning              | Action                     |
| ----------- | -------------------- | -------------------------- |
| `ACK`       | Successful command   | Flash green LED            |
| `NAK`       | Invalid command      | Blink red LED + error tone |
| `ERR`       | Serial framing error | Retry next cycle           |
| `BUSY`      | TEC-1 executing      | Ignore command until ready |

---

## ⚙️ **ELECTRICAL LINES**

```
TEC-1 Port 03h  → MCU RX (Telemetry)
TEC-1 Port 04h  ← MCU TX (Commands)
MCU RX/TX ↔ USB/Serial adapter ↔ PC console
Common ground (GND)
Optional RTS/CTS handshakes:
  RTS (MCU) → TEC-1 READY input
  CTS (TEC-1) → MCU buffer status
Baud rate: 9600–19200 bps, 8-N-1
```

---

## 🧠 **MISSION CONTROL OPERATOR VIEW**

```
┌───────────────────────────────────────────────────────────────┐
│  [ GO / NO-GO STATUS PANEL ]                                  │
│   ALT  038 m   FUEL 17 L   VEL 02 m/s                         │
│   THRUST 40 %  STATE: DESCENT                                 │
│                                                               │
│  [ COMMAND LINE ] > CMD,ABORT                                 │
│   → “ABORT” sent  → TEC-1 reply: “ACK,ABORT,OK”               │
│                                                               │
│  [ LOG ]                                                      │
│   T+05.7s   Telemetry update OK                               │
│   T+05.8s   ABORT confirmed – ENGINE STOP                     │
│   T+06.1s   CONTACT LIGHT ON – LANDER SAFE                    │
└───────────────────────────────────────────────────────────────┘
```

---

## 🔄 **FULL CLOSED-LOOP TIMING**

```
t₀  TEC-1 sends telemetry frame → Houston updates console
t₁  Houston operator sends CMD,ABORT
t₂  MCU forwards packet → TEC-1 Port 04h
t₃  TEC-1 executes Forth word :ABORT  (VEL=0, FUEL=FUEL, STATE=ABORT)
t₄  TEC-1 sends “ACK,ABORT,OK” back
t₅  Console plays “Abort confirmed” tone
```

---

## 🚀 **Conceptual Summary**

| Subsystem               | Direction      | Function                             |
| ----------------------- | -------------- | ------------------------------------ |
| **TEC-1 SBC**           | Bidirectional  | Physics engine, simulation logic     |
| **MCU Hub (tecLINDAR)** | Bridge         | Buffers and relays serial packets    |
| **Mission Control PC**  | Bidirectional  | Displays telemetry, sends commands   |
| **Hardware Control**    | Unidirectional | Executes thrust, LED, audio output   |
| **Feedback Loop**       | Closed         | Realistic mission control simulation |

---

**Result:**
The TEC-1 is now both the *lunar module guidance computer* **and** a *networked spacecraft subsystem* — capable of receiving Houston’s orders, broadcasting telemetry, and performing fully synchronized light, sound, and motion outputs.

---







---

# 🧵 Wiring Harness — TEC-1 ⇄ tecLINDAR MCU ⇄ PC (USB-UART)

 **back-panel wiring harness** for a clean, reliable **TEC-1 ⇄ MCU ⇄ Mission Control PC** link, including exact RX/TX paths, grounds, optional RTS/CTS, power, and level-shifting. I’ve also added pin tables, color coding, and bring-up tests.



## 1) Big-Picture ASCII

```
 ┌────────────────┐        TTL 5V UART        ┌──────────────────────┐     USB (CDC)
 │    TEC-1 SBC   │ TXD ───────────────► RX0  │ tecLINDAR MCU Board  │ ┌───────────────┐
 │ (Z80 + Forth)  │ RXD ◄─────────────── TX0  │ (bridge + motor PWM) │ │   PC / HOST   │
 │                │ GND ──────────────── GND  │                      │ │ Mission Ctrl  │
 │  Port 03h → TX │ RTS ──────────────── CTS  │  UART1 ◄────────────► │  USB-UART (COM)│
 │  Port 04h ← RX │ CTS ◄─────────────── RTS  │  (3V3/5V tolerant)    └───────────────┘
 └────────────────┘                           └──────────────────────┘
         ▲                                           ▲
         │                                           │
   (to I/O, PIO,                               (to L298N, LEDs,
    display, etc.)                               sensors, etc.)
```

> **Signal direction reminder:** data flows **TX → RX**. Never TX→TX or RX→RX.

---

## 2) Back-Panel “Harness” View (labels + strain relief)

```
[ PANEL CUTOUT ]
┌──────────────────────────────────────────────────────────┐
│  J1: TEC-1 UART 5V TTL  (Dupont 1x6)                     │
│   [1] GND  [2] +5V  [3] TXD_out  [4] RXD_in  [5] RTS  [6] CTS
│                                                          │
│  J2: MCU UART0 5V TTL  (Dupont 1x6)                      │
│   [1] GND  [2] +5V  [3] RX0_in  [4] TX0_out  [5] CTS  [6] RTS
│                                                          │
│  J3: USB-UART to PC  (USB-B / Micro-B)                   │
│   Shielded cable to host PC (COMx)                       │
└──────────────────────────────────────────────────────────┘

Cable Loom:
 ──────────────────────────────────────────────────────────
  Color   From (J1 TEC-1)        To (J2 MCU)         Notes
  ────    ─────────────────────   ─────────────────   ───────────────────────────
  Black   [1] GND  ─────────────► [1] GND            Common ground
  Red     [2] +5V  ─────────────► [2] +5V            Power (if shared)*
  Yellow  [3] TXD ───────────────► [3] RX0           TEC-1 → MCU data
  Green   [4] RXD ◄─────────────── [4] TX0           MCU  → TEC-1 data
  Blue    [5] RTS ───────────────► [6] RTS→MCU?**    Optional hardware flow ctrl
  Violet  [6] CTS ◄─────────────── [5] CTS←MCU?**    Optional hardware flow ctrl
 ──────────────────────────────────────────────────────────
* If each board has its own regulator, do **not** tie +5V rails; connect only GND and signals.  
** MCU pin naming varies; confirm which pin is **RTS output** vs **CTS input** on your MCU.

Strain relief:
- Lacing cord / zip ties every 10–15 cm
- Heat-shrink labels on both ends (J1-3/GND/TX/RX/RTS/CTS)
```

---

## 3) Pin Tables (reference)

### TEC-1 UART header (example mapping)

| Pin | Label   | Dir (wrt TEC-1) | Notes                               |
| --- | ------- | --------------- | ----------------------------------- |
| 1   | GND     | —               | Common ground                       |
| 2   | +5V OUT | Out             | 5 V rail (use only if powering MCU) |
| 3   | TXD_out | Out             | Connect to MCU RX0                  |
| 4   | RXD_in  | In              | From MCU TX0                        |
| 5   | RTS_out | Out (optional)  | To MCU CTS                          |
| 6   | CTS_in  | In  (optional)  | From MCU RTS                        |

### tecLINDAR MCU UART0 header

| Pin | Label   | Dir (wrt MCU)  | Notes                 |
| --- | ------- | -------------- | --------------------- |
| 1   | GND     | —              | Common ground         |
| 2   | +5V IN  | In             | If powered from TEC-1 |
| 3   | RX0_in  | In             | From TEC-1 TXD        |
| 4   | TX0_out | Out            | To TEC-1 RXD          |
| 5   | CTS_in  | In (optional)  | From TEC-1 RTS        |
| 6   | RTS_out | Out (optional) | To TEC-1 CTS          |

### USB-UART (PC link on MCU UART1)

* Use a **3V3/5V-tolerant** USB-UART dongle and wire to MCU UART1 pins, or plug MCU’s onboard USB directly.

---

## 4) Level-Shifting & Voltage Notes

* **If MCU is 5 V-tolerant:** Direct wire is fine (5 V TTL).
* **If MCU is 3.3 V-only:**

  * **TEC-1 TX → MCU RX:** put a **voltage divider** (e.g., 10 k : 20 k → 3.3 V) or a unidirectional level shifter.
  * **MCU TX → TEC-1 RX:** 3.3 V usually reads as HIGH on 5 V TTL; if marginal, buffer with a **74HCT14** or single-channel level shifter.
* **Never** connect RS-232 ±12 V directly — only **TTL UART**.

---

## 5) Optional RTS/CTS Handshake

```
[TEC-1 RTS_out] ─────────► [MCU CTS_in]    (TEC-1 says “please stop, I’m busy”)
[TEC-1 CTS_in ] ◄───────── [MCU RTS_out]    (MCU says “I’m ready to receive”)
```

If unused, **leave unconnected** and run 8-N-1 with **XON/XOFF** (software flow control) or no flow control.

---

## 6) Grounding, Shielding, ESD

* Star ground between TEC-1, MCU, motor drivers, and USB-UART.
* Keep **motor power ground** and **logic ground** joined at a **single point** (near MCU power entry).
* Route TX/RX as **twisted pairs** with GND if possible (TX+GND, RX+GND).
* For long runs or noisy motor environments, use **shielded cable**; bond shield at **one end only** (PC side).
* Add **TVS diode** at MCU UART if cables exit enclosure.

---

## 7) Power Strategy

* Preferred: **Separate** 5 V regulators for TEC-1 and MCU/motors.
* Connect **only GND** between boards if supplies are separate.
* If sharing 5 V from TEC-1: ensure regulator has **>500 mA headroom** (MCU + LEDs, **not** motors).
* **Motors** must use their own supply; share **GND** only.

---

## 8) Bring-Up / Loopback Tests (no guesswork)

**A. MCU↔PC sanity**

1. MCU UART1 ↔ PC USB-UART.
2. Open terminal (9600, 8-N-1).
3. Short **MCU TX1 to RX1** → typed chars echo = OK.

**B. TEC-1↔MCU**

1. Connect only **TXD, RXD, GND**.
2. On TEC-1, send a test string from Forth/monitor (e.g., `." HELLO"` style or monitor TX routine).
3. Confirm reception on MCU (blink LED / print to USB console).

**C. Full chain TEC-1 → MCU → PC**

1. TEC-1 emits `TLM,ALT=50,FUEL=20,VEL=00<CR>`.
2. PC terminal shows exact ASCII line.
3. PC sends `CMD,RESET<CR>`.
4. MCU forwards to TEC-1 RX; TEC-1 replies `ACK,RESET,OK<CR>` → shows on PC.

---

## 9) Recommended Cable Colors

* **GND** = Black
* **+5 V** = Red
* **TXD (from source)** = Yellow
* **RXD (to source)** = Green
* **RTS** = Blue
* **CTS** = Violet
* **Shield/Drain** = Grey

---

## 10) Quick Troubleshooting

* **No data PC-side:** swap TX/RX at one end; verify 9600/8-N-1; confirm common GND.
* **Garbled text:** wrong baud or level mismatch; add level shifter.
* **Drops under thrust:** motor noise → improve ground, add ferrites, separate motor PSU, twist pairs.
* **Random resets:** add 100 nF decouplers at UART VCC pins; check brown-out on shared 5 V.

---

## 11) Minimal Schematic (text)

```
TEC-1 TXD (5V) ──┬─► MCU RX0
                 │
                 └─► (to level shifter if MCU=3V3)

MCU TX0 ─────────────► TEC-1 RXD
GND ──────────────────┴─────────────── GND (single-point star)
RTS/CTS (optional) wired cross-over (RTS→CTS, RTS←CTS)
```

---




---

## 🧾 **TEC-1 ⇄ tecLINDAR MCU ⇄ PC Wiring Card**

**one-page printable wiring card** for the TEC-1 ↔ MCU ↔ PC link — suitable to tape inside your project enclosure or attach to the harness bundle for quick reference and maintenance.



### *Field Service Reference — Lunar Lander Comms Harness*

```
═════════════════════════════════════════════════════════════════════
  SIGNAL SUMMARY
─────────────────────────────────────────────────────────────────────
 Color   Function         TEC-1 Pin   MCU Pin     Direction
─────────────────────────────────────────────────────────────────────
 Black   GND              J1-1        J2-1        Common ground
 Red     +5 V (logic)     J1-2        J2-2        Power feed / ref*
 Yellow  TXD_out          J1-3        J2-3 (RX0)  TEC-1 → MCU
 Green   RXD_in           J1-4        J2-4 (TX0)  MCU → TEC-1
 Blue    RTS_out          J1-5        J2-6 (CTS)  Optional flow ctrl
 Violet  CTS_in           J1-6        J2-5 (RTS)  Optional flow ctrl
─────────────────────────────────────────────────────────────────────
 *Use only if sharing 5 V logic supply; keep motor PSU isolated.
═════════════════════════════════════════════════════════════════════

  CONNECTION CHECKLIST  ✓
─────────────────────────────────────────────────────────────────────
 [ ] GND continuity between TEC-1, MCU, PC chassis
 [ ] TXD (Yel) from TEC-1 goes to RX0 on MCU
 [ ] RXD (Grn) from MCU goes to RX input on TEC-1
 [ ] No cross-power of +5 V if each board self-powered
 [ ] Shield grounded one end only (PC side)
 [ ] Twisted pair or shielded lines for TX/GND and RX/GND
 [ ] RTS→CTS lines present or disabled in firmware
 [ ] Baud = 9600 bps  8-N-1  No parity  1 stop
 [ ] Verified echo / loopback test passed
 [ ] Tie-wrap & label all conductors at both ends
─────────────────────────────────────────────────────────────────────

  PINOUT QUICK MAP
─────────────────────────────────────────────────────────────────────
    TEC-1 J1 (Front Panel)         MCU J2 (UART0)
    ┌────┬──────────────┐          ┌────┬──────────────┐
    │1 G │ Ground       │◄────────►│1 G │ Ground       │
    │2 + │ +5 V logic   │◄────────►│2 + │ +5 V logic   │
    │3 Y │ TXD_out      │─────────►│3 R │ RX0_in        │
    │4 G │ RXD_in       │◄────────│4 T │ TX0_out       │
    │5 B │ RTS_out      │─────────►│6 C │ CTS_in        │
    │6 V │ CTS_in       │◄────────│5 R │ RTS_out       │
    └────┴──────────────┘          └────┴──────────────┘
─────────────────────────────────────────────────────────────────────

  LEVEL / LOGIC NOTES
─────────────────────────────────────────────────────────────────────
 • Logic level: 5 V TTL (3 V3 OK on RX if MCU tolerant)
 • For 3 V3 MCU: add 2-res divider 10 kΩ/20 kΩ on TEC-1 TXD
 • No RS-232 ±12 V!  TTL only.
 • Motor and logic grounds join at one point near MCU PSU.

─────────────────────────────────────────────────────────────────────
  BRING-UP TEST STEPS
─────────────────────────────────────────────────────────────────────
 1. MCU ↔ PC loopback — short TX1↔RX1, see echo.
 2. TEC-1 TXD→MCU RX0 — verify “HELLO” prints on MCU console.
 3. PC → TEC-1 path — send “CMD,RESET<CR>”, get “ACK,RESET,OK”.
 4. Wiggle RX/TX lines on scope: 0 V–5 V swing, idle high.
─────────────────────────────────────────────────────────────────────

  FIELD NOTES
─────────────────────────────────────────────────────────────────────
 • Twist each signal with a ground partner.
 • Keep total harness < 30 cm inside box; shield if longer.
 • Add 100 nF decoupler at MCU VCC near UART pins.
 • Label both ends:  GND / 5V / TX / RX / RTS / CTS.
 • Print two copies: one inside lid, one for bench logbook.
═════════════════════════════════════════════════════════════════════
```

---


