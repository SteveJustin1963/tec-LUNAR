: DISPLAY  0xF121 
: STARTRAM 0x0800

VARIABLE ix
VARIABLE iy
VARIABLE altitude
VARIABLE fuel
VARIABLE velocity

: CLEAR-DISPLAY ( -- )
   0 6 DO
      ix I + C!
   LOOP
;

: DISPLAY-VALUES ( -- )
   fuel HEX
   altitude HEX
   TYPE
   CR
;

: GET-INPUT ( -- key )
   KEY
;

: PROCESS-INPUT ( key -- )
   \ Your code here
;

: UPDATE-VALUES ( -- )
   velocity 1- TO velocity
   altitude velocity + TO altitude
;

: CHECK-WIN-LOSS ( -- )
   altitude 0 <= IF
      EXIT
   THEN
   altitude 0x60 < IF
      EXIT
   THEN
;

: MAIN ( -- )
   CLEAR-DISPLAY
   BEGIN
      DISPLAY-VALUES
      GET-INPUT
      KEY EOF = NOT IF
         PROCESS-INPUT
      THEN
      UPDATE-VALUES
      CHECK-WIN-LOSS
   AGAIN
;
