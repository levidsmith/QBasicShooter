'2022 Levi D. Smith - levidsmith.com
SCREEN 13

keyEsc$ = CHR$(27)

DO
  keyPress$ = INKEY$

  'Clear key buffer
  WHILE INKEY$ <> "": WEND

  FOR i% = 0 TO 320
    FOR j% = 0 TO 5
      PSET (i%, j%), i%
    NEXT j%
  NEXT i%

LOOP UNTIL keyPress$ = keyEsc$

