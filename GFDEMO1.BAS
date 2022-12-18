SCREEN 13

DIM SHARED buffer%(32001)
buffer%(0) = 320 * 8
buffer%(1) = 200

keyEsc$ = CHR$(27)

DO
  keyPress$ = INKEY$

  FOR i% = 0 TO 320
    FOR j% = 0 TO 5
      PSET (i%, j%), i%
    NEXT j%
  NEXT i%
  SLEEP 1

LOOP UNTIL keyPress$ = keyEsc$

SUB Drawpixel (x%, y%, col%)

END SUB

