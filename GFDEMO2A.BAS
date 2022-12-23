'Original line draw code from http://www.tedfelix.com/qbasic/sprites.html
'line demo, no double buffering
SCREEN 9

keyEsc$ = CHR$(27)

DO
  keyPress$ = INKEY$

  CLS

  FOR i = 1 TO 50
    x1 = INT(RND * 320)
    y1 = INT(RND * 200)
    x2 = INT(RND * 320)
    y2 = INT(RND * 200)
    c = INT(RND * 16)
    LINE (x1, y1)-(x2, y2), c

  NEXT i
  PCOPY 0, 1


LOOP UNTIL keyPress$ = keyEsc$