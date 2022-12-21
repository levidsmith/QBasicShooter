'2022 Levi D. Smith - levidsmith.com
DECLARE FUNCTION checkCollision! ()
DECLARE SUB pShoot ()
DECLARE SUB Init ()
DECLARE SUB Update ()
DECLARE SUB DrawScreen ()
keyEsc = 1
SCREEN 7, 0, 0, 1
RANDOMIZE TIMER

TYPE Player
  x AS INTEGER
  y AS INTEGER
  w AS INTEGER
  h AS INTEGER
  velX AS INTEGER
  velY AS INTEGER


END TYPE

TYPE Bullet
  x AS INTEGER
  y AS INTEGER
  w AS INTEGER
  h AS INTEGER
  velX AS INTEGER
  velY AS INTEGER
  isAlive AS INTEGER

END TYPE

TYPE Enemy
  x AS INTEGER
  y AS INTEGER
  w AS INTEGER
  h AS INTEGER
  velX AS INTEGER
  velY AS INTEGER
  isAlive AS INTEGER
  speed AS INTEGER
  respawnDelay AS INTEGER
END TYPE


DIM SHARED p AS Player
DIM SHARED e AS Enemy
DIM SHARED b AS Bullet
DIM SHARED c AS INTEGER

DIM SHARED yBounds AS INTEGER
DIM SHARED score AS INTEGER
DIM SHARED timelimit AS INTEGER
DIM SHARED isGameOver AS INTEGER

Init
DO
  c = INP(&H60)

  Update
  DrawScreen


LOOP WHILE c <> keyEsc

FUNCTION checkCollision

  IF b.isAlive = 1 AND e.isAlive = 1 THEN
    IF b.x + b.h < e.x OR b.x > e.x + e.w OR b.y + b.h < e.y OR b.y > e.y + e.h THEN
      checkCollision = 0
    ELSE
      checkCollision = 1
    END IF
  END IF

END FUNCTION

SUB DrawScreen
CLS

LOCATE 1, 1
PRINT "key scan code" + STR$(c)

LOCATE 1, 30
PRINT "score " + STR$(score)

LOCATE 2, 30
PRINT "time " + STR$(INT(timelimit / 20))

IF isGameOver = 1 THEN
  LOCATE 10, 15
  PRINT "Game Over"
END IF

'IF (c = 30) THEN
'  PRINT "You pressed A"
'END IF

'Draw Player
LINE (p.x, p.y)-(p.x + p.w, p.y + p.h), 11, BF

'Draw Enemy
IF e.isAlive = 1 THEN
  LINE (e.x, e.y)-(e.x + e.w, e.y + e.h), 10, BF
END IF

'Draw Bullet
IF b.isAlive = 1 THEN
  LINE (b.x, b.y)-(b.x + b.w, b.y + b.h), 12, BF
END IF

'Draw divder
LINE (0, yBounds)-(320, yBounds), 1

PCOPY 0, 1

END SUB

SUB Init

'Setup player
  p.w = 16
  p.h = 16
  p.x = (320 - p.w) / 2
  p.y = 200 - 32

'Setup enemy
  e.w = 16
  e.h = 16
  e.x = (320 - p.w) / 2
  e.y = 64
  e.speed = 2
  e.velX = e.speed
  e.isAlive = 1

'Setup bullet
  b.isAlive = 0
  b.w = 8
  b.h = 8

'Other
yBounds = 140
score = 0
timelimit = 1200
isGameOver = 0

END SUB

SUB pShoot

  IF b.isAlive = 0 THEN
    b.x = p.x + (b.w / 2)
    b.y = p.y
    b.velX = 0
    b.velY = -5
    b.isAlive = 1
    soundShoot$ = "O8C"
   
    PLAY "L16O4C"
  END IF
END SUB

SUB Update

keyLeftPressed = 75
keyRightPressed = 77
keyUpPressed = 72
keyDownPressed = 80

keyLeftReleased = 203
keyRightReleased = 205
keyUpReleased = 200
keyDownReleased = 208

IF isGameOver = 0 THEN

  'Check input
  IF (c = keyUpPressed) THEN
    p.velY = -4
  ELSEIF (c = keyDownPressed) THEN
    p.velY = 4
  ELSEIF (c = keyLeftPressed) THEN
    p.velX = -4
  ELSEIF (c = keyRightPressed) THEN
    p.velX = 4
  ELSEIF (c = 57) THEN
   pShoot
  END IF

  IF (c = keyLeftReleased AND p.velX < 0) THEN
    p.velX = 0
  ELSEIF (c = keyRightReleased AND p.velX > 0) THEN
    p.velX = 0
  ELSEIF (c = keyUpReleased AND p.velY < 0) THEN
    p.velY = 0
  ELSEIF (c = keyDownReleased AND p.velY > 0) THEN
    p.velY = 0
  END IF

  'Update player
  p.x = p.x + p.velX
  p.y = p.y + p.velY
 
  'Check bounds
  IF (p.y < yBounds) THEN
     p.y = yBounds
  ELSEIF (p.y + p.h > 200) THEN
    p.y = 200 - p.h
  END IF
  IF (p.x < 0) THEN
    p.x = 0
  ELSEIF (p.x + p.w > 320) THEN
    p.x = 320 - p.w

  END IF

  'Update enemy
  IF (e.isAlive = 1) THEN
    e.x = e.x + e.velX
    e.y = e.y + e.velY
    IF (e.x + e.w >= 320) OR (e.x <= 0) THEN
      e.velX = e.velX * -1
    END IF
  ELSE
    IF e.respawnDelay > 0 THEN
      e.respawnDelay = e.respawnDelay - 1
      IF e.respawnDelay <= 0 THEN
        e.x = INT(RND * (320 - e.w))
        e.y = INT(RND * (yBounds - e.h))
        e.speed = e.speed + 2
        IF (e.speed > 20) THEN
          e.speed = 20
        END IF
        e.velX = e.speed
        e.isAlive = 1

      END IF
    END IF

  END IF

  'Update the bullet
  IF (b.isAlive = 1) THEN
    b.x = b.x + b.velX
    b.y = b.y + b.velY
    IF (b.y + b.h < 0) THEN
      b.isAlive = 0
    END IF

    IF checkCollision = 1 THEN
      e.isAlive = 0
      b.isAlive = 0
      e.respawnDelay = 60
      score = score + 100
      PLAY "L16O1C"
    END IF
  END IF

  'Update time limit
  timelimit = timelimit - 1
  IF (timelimit <= 0) THEN
    isGameOver = 1
  END IF

END IF
END SUB

