BEGIN CoMelvin

IF ~NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Hmpf, geht mir aus der Sonne, <RACE>.~
IF ~~ THEN EXIT
END