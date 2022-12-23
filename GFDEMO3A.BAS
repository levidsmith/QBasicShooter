'2022 Levi D. Smith - levidsmith.com
SCREEN 7 '320x200 resolution

sprTree$ = "S4 C0 BM+15,0 F9 L5 F11 L30 E11 L5 E9 BM+0,20 R5 D10 L10 U10"

keyEsc$ = CHR$(27)

x = 0
y = 0

numFrame = numFrame + 1

DO

  CLS
  PAINT (0, 0), 2

  LOCATE 1, 36
  PRINT STR$(numFrame)
  numFrame = numFrame + 1

  FOR iCol = 0 TO 9
    FOR iRow = 0 TO 5
      x = iCol * 32
      y = iRow * 32
     
      DRAW "BM" + STR$(x) + "," + STR$(y) + " X" + VARPTR$(sprTree$)
      PAINT (x + 15, y + 1), 10, 0
      PAINT (x + 16, y + 21), 6, 0

    NEXT iRow
  NEXT iCol

'  SLEEP
  keyPress$ = INKEY$

  'Clear key buffer
  WHILE INKEY$ <> "": WEND

LOOP UNTIL keyPress$ = keyEsc$

