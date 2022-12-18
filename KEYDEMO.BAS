'2022 Levi D. Smith - levidsmith.com
SCREEN 13

'Standard keys - uses character ASCII integer value (less than 128)
keyEsc$ = CHR$(27)
key1$ = CHR$(49)
keyAUpper$ = CHR$(65)
keyALower$ = CHR$(97)
keyTab$ = CHR$(9)

'Extended keys - null character followed by keyboard scan code
keyLeft$ = CHR$(0) + CHR$(75)
keyUp$ = CHR$(0) + CHR$(72)
keyDown$ = CHR$(0) + CHR$(80)
keyRight$ = CHR$(0) + CHR$(77)
keyF1$ = CHR$(0) + CHR$(59)
keyHome$ = CHR$(0) + CHR$(71)
keyPageUp$ = CHR$(0) + CHR$(73)


keyLast$ = ""

DO
  IF keyPress$ <> "" THEN
    keyLast$ = keyPress$
  END IF

  CLS
  LOCATE 1, 1

  IF keyPress$ = CHR$(65) THEN
    PRINT "You pressed A        "
  END IF

  IF keyPress$ = CHR$(97) THEN
    PRINT "You pressed a        "
  END IF

  IF keyPress$ = CHR$(49) THEN
    PRINT "You pressed 1        "
  END IF
 
  IF keyPress$ = CHR$(32) THEN
    PRINT "You pressed Space        "
  END IF

  IF keyPress$ = CHR$(9) THEN
    PRINT "You pressed Tab        "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(75) THEN
    PRINT "You pressed Left Arrow        "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(77) THEN
    PRINT "You pressed Right Arrow        "
  END IF
 
  IF keyPress$ = CHR$(0) + CHR$(72) THEN
    PRINT "You pressed Up Arrow        "
  END IF
 
  IF keyPress$ = CHR$(0) + CHR$(80) THEN
    PRINT "You pressed Down Arrow        "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(59) THEN
    PRINT "You pressed F1          "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(60) THEN
    PRINT "You pressed F2          "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(71) THEN
    PRINT "You pressed HOME        "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(73) THEN
    PRINT "You pressed Page Up        "
  END IF

  IF keyPress$ = CHR$(0) + CHR$(31) THEN
    PRINT "You pressed S, but keyboard scan codes don't work for standard keys"
  END IF

  IF keyPress$ = CHR$(0) + CHR$(29) THEN
    PRINT "Ctrl doesn't work"
  END IF

'  PRINT "Last key pressed " + keyLast$ + "    "
  PRINT "INKEY$ value:"
  PRINT "  BYTE 1: " + MID$(keyLast$, 1, 1)
  IF LEN(keyLast$) > 1 THEN
    PRINT "  BYTE 2: " + MID$(keyLast$, 2, 1)
  END IF

  PRINT "  BYTE 1 int value: " + STR$(PEEK(SADD(keyLast$)))
  IF LEN(keyLast$) > 1 THEN
    PRINT "  BYTE 2 int value: " + STR$(PEEK(SADD(keyLast$) + 1))
  END IF

  SLEEP
  keyPress$ = INKEY$
 
  'Clear the input buffer
  DO
    keyExtra$ = INKEY$
  LOOP UNTIL LEN(keyExtra$) = 0

LOOP UNTIL keyPress$ = keyEsc$

SUB Drawpixel (x%, y%, col%)

END SUB

