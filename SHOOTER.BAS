REM 2019 Levi D. Smith

TYPE Player
  X AS INTEGER
  Y AS INTEGER
  Speed AS INTEGER
END TYPE

TYPE Bullet
  X AS INTEGER
  Y AS INTEGER
  Speed AS INTEGER
  IsAlive AS INTEGER
END TYPE

TYPE Enemy
  X AS INTEGER
  Y AS INTEGER
  Speed AS INTEGER
  IsAlive AS INTEGER

END TYPE

DECLARE SUB SpawnBullet (b AS Bullet, xPos AS INTEGER, yPos AS INTEGER)
DECLARE SUB SpawnEnemy (e AS Enemy)

SCREEN 7


DIM p AS Player
p.X = 100
p.Y = 50
p.Speed = 4

DIM bullets(1 TO 5) AS Bullet
iCurrentBullet% = 1

DIM enemies(1 TO 5) AS Enemy
iCurrentEnemy% = 1
iEnemySpawnDelay% = 5

REM enemies(iCurrentEnemy%).IsAlive = 1
REM enemies(iCurrentEnemy%).X = 200
REM enemies(iCurrentEnemy%).Y = 50
REM enemies(iCurrentEnemy%).Speed = -2


keepLooping% = 1

            WHILE keepLooping% = 1
            'Delay game
            FOR a# = 1 TO 100:  NEXT a#



            kbd$ = INKEY$
            SELECT CASE kbd$
             
              REM CASE CHR$(0) + "H": p.Y = p.Y - p.Speed
              REM CASE CHR$(0) + "P": p.Y = p.Y + p.Speed
              REM CASE CHR$(0) + "M": p.X = p.X + p.Speed
              REM CASE CHR$(0) + "K": p.X = p.X - p.Speed
             
              CASE CHR$(0) + CHR$(72): p.Y = p.Y - p.Speed
              CASE CHR$(0) + CHR$(80): p.Y = p.Y + p.Speed
              CASE CHR$(0) + CHR$(77): p.X = p.X + p.Speed
              CASE CHR$(0) + CHR$(75): p.X = p.X - p.Speed


                CASE "q", "Q": keepLooping% = 0
                CASE CHR$(32)
                  SpawnBullet bullets(iCurrentBullet%), p.X + 5, p.Y + 5
                  iCurrentBullet% = iCurrentBullet% + 1
                  IF (iCurrentBullet% > 5) THEN
                    iCurrentBullet% = 1
                  END IF

                CASE CHR$(27): keepLooping% = 0
                CASE ELSE
            END SELECT
          

REM Update Code

FOR i% = 1 TO 5
  IF (bullets(i%).IsAlive = 1) THEN
    bullets(i%).X = bullets(i%).X + bullets(i%).Speed
  END IF
NEXT i%

FOR i% = 1 TO 5
  IF (enemies(i%).IsAlive = 1) THEN
    enemies(i%).X = enemies(i%).X + enemies(i%).Speed
  END IF
NEXT i%

iEnemySpawnDelay% = iEnemySpawnDelay% - 1
IF (iEnemySpawnDelay% <= 0) THEN
  SpawnEnemy enemies(iCurrentEnemy%)
  iCurrentEnemy% = iCurrentEnemy% + 1
  IF (iCurrentEnemy% > 5) THEN
    iCurrentEnemy% = 1
  END IF
  iEnemySpawnDelay% = 20

END IF



REM Draw Code

REM SCREEN 7, , 1

REM LINE (0, 0)-(640, 480), 0, BF
CLS
LINE (p.X, p.Y)-(p.X + 10, p.Y + 10), 3, BF
REM PSET (bullets(1).X, bullets(1).Y), 4


FOR i% = 1 TO 5
  IF (bullets(i%).IsAlive = 1) THEN
    PSET (bullets(i%).X, bullets(i%).Y), 4
  END IF
NEXT i%

FOR i% = 1 TO 5
  IF (enemies(i%).IsAlive = 1) THEN
    CIRCLE (enemies(i%).X, enemies(i%).Y), 10, 2
REM     PAINT (enemies(i%).X, enemies(i%).Y), 10, 2
  END IF
NEXT i%

           
REM SCREEN 7, , , 0
           
            WEND

SUB SpawnBullet (b AS Bullet, posX AS INTEGER, posY AS INTEGER)
  SOUND 440, 1
REM  DIM b AS bullet
REM  b.X = 50
REM  b.Y = 50
 
  REM bullets(1).Speed = 8
  REM bullets(1).X = posX
  REM bullets(1).Y = posY
  REM bullets(1).IsAlive = 1
  b.Speed = 8
  b.X = posX
  b.Y = posY
  b.IsAlive = 1

END SUB

SUB SpawnEnemy (e AS Enemy)
  e.IsAlive = 1
  e.X = 200
  e.Y = 20 + RND * 200
  e.Speed = -2

END SUB

