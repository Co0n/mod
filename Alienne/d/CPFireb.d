EXTEND_TOP FIREBE 6 #1
IF ~Global("CPSideQuest","GLOBAL",1)~ THEN REPLY ~Ich bin heute nicht zum Plaudern hier, alter Mann. Sterbt!~ GOTO Fight
IF ~Global("CPSideQuest","GLOBAL",1)~ THEN REPLY ~Gief da Staff!~ GOTO Staff
END

APPEND FIREBE
IF ~~ THEN BEGIN Fight
SAY ~Oki~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN Staff
SAY ~Okay, hier hastn.~
IF ~~ THEN DO ~~ EXIT
END
END