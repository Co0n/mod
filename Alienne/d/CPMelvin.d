BEGIN CPMelvin

IF ~!Global("CPQuestPart","GLOBAL",5)NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Hmpf, geht mir aus der Sonne, <RACE>.~
IF ~~ THEN EXIT
END

IF ~Global("CPQuestPart","GLOBAL",5)NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Hmpf, was wollt Ihr, <RACE>? ~
//  Macht es hier Sinn nochmal den Magier zu unterscheiden? Melvin m�sste das erkennen und angreifen (s.u.)
IF ~HasItem("CPscrl1",LastTalkedToBy())Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~(Die Befehle �berreichen) Ich hei�e Aeri, ich soll hier f�r Euch arbeiten.~ GOTO Mage
IF ~HasItem("CPscrl1",LastTalkedToBy())!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~(Die Befehle �berreichen) Ich hei�e Aeri, ich soll hier f�r Euch arbeiten.~ GOTO Work

// F�hrt uns ein Kampf hier weiter oder w�re die Quest dann beendet? (einziger Kontaktmann tot, keine weiteren Hinweise. 
// Vielleicht verplappert sich Melvin und gibt einen wagen Tip ab? "Du wirst das richtige Haus nie finden, daf�r ist Beregost zu gro�" oder �hnliches)
// IF ~~ THEN REPLY ~Seid Ihr Melvin? Ich suche ein M�dchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~
IF ~~ THEN REPLY ~Nichts, Auf wiedersehen.~ GOTO EndTalk
END

IF ~~ THEN BEGIN EndTalk
SAY ~Hmpf...~
IF ~~ THEN EXIT