REM 2019 Levi D. Smith

CLS
PRINT "Hello Number Guessing Game"
PRINT "2019 Levi D. Smith"

PRINT "Guess the number between 1 and 100"

RANDOMIZE TIMER
iRand% = INT(RND * 100) + 1
REM PRINT iRand%
iTries% = 0

DO WHILE iGuess% <> iRand%
  INPUT iGuess%
  iTries% = iTries% + 1

  IF (iGuess% < iRand%) THEN
    PRINT "Higher"
  ELSEIF (iGuess% > iRand%) THEN
    PRINT "Lower"
  ELSEIF (iGuess% = iRand%) THEN
    PRINT "CORRECT! "; iTries%; " guesses"

  END IF

LOOP



