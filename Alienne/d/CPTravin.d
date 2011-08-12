BEGIN CPTravin

IF ~NumTimesTalkedTo(0)~ 
THEN BEGIN InitialTalk
SAY ~Hmpf, geht mir aus der Sonne, <RACE>.~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ 
THEN BEGIN InitialTalk2
SAY ~Hmpf, geht mir aus der Sonne OLOLOLOLOLOLOL!~
IF ~~ THEN EXIT
END