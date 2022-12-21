DO
'c = INP(96)
c = INP(&H60)
PRINT c

IF (c = 30) THEN
  PRINT "You pressed A"
END IF

LOOP WHILE c <> 1

