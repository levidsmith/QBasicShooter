'2022 Levi D. Smith - levidsmith.com
SCREEN 7, 0, 0, 1 '320x200 resolution, using active/visual pages

CLS
DIM imgTree%(32 * 32) '32x32 pixels
sprTree$ = "S4 C0 BM+15,0 F9 L5 F11 L30 E11 L5 E9 BM+0,20 R5 D10 L10 U10"
LINE (0, 0)-(31, 31), 2, BF
DRAW "BM0,0"
DRAW "X" + VARPTR$(sprTree$)
PAINT (15, 1), 10, 0
PAINT (16, 21), 6, 0
GET (0, 0)-(31, 31), imgTree%
PCOPY 0, 1
SLEEP

keyEsc$ = CHR$(27)

x = 0
y = 0

numFrame = 0

DO
  CLS
  PAINT (0, 0), 2

  FOR iCol = 0 TO 9
    FOR iRow = 0 TO 5
      x = iCol * 32
      y = iRow * 32
      PUT (x, y), imgTree%, PSET

    NEXT iRow
  NEXT iCol

  LOCATE 1, 36
  PRINT STR$(numFrame)
  numFrame = numFrame + 1

  PCOPY 0, 1
  'SLEEP
  keyPress$ = INKEY$

  'Clear the input buffer
  WHILE INKEY$ <> ""
  WEND

LOOP UNTIL keyPress$ = keyEsc$

