EXTEND_TOP FIREBE 6 #1
IF ~Global("CPMelvinDead","GLOBAL",1)~ THEN REPLY ~Ich bin den -- NAME DER ORGANISATION -- auf der Spur, k�nnt Ihr mir etwas �ber ihren Aufenthaltsort erz�hlen?~ GOTO Suche
END

APPEND FIREBE
IF ~~ THEN BEGIN Suche
SAY ~Von ihnen habe ich schon seit einer Ewigkeit nichts mehr gesehen, aber ich war ja auch eine lange Zeit in Kerzenburg. Wie kommt es, dass Ihr mit solchen Menschen zu tun habt, Kind?~
IF ~~ THEN REPLY ~Sie haben eine Elfe entf�hrt und halten sie gefangen, ich m�chte sie befreien.~ GOTO Rescue
IF ~~ THEN REPLY ~Man hat mir f�r die Rettung eines ihrer Opfer eine gute Summe geboten.~ GOTO Money
END

IF ~~ THEN BEGIN Rescue
SAY ~Es freut mich zu h�ren, dass Gorions Sch�tzling sich f�r die Leiden anderer interessiert. Wenn Ihr mir ein wenig �ber diese Elfe erz�hlt k�nnte ich sie vielleicht f�r euch auf magische Weise aufsp�ren.~
IF ~~ THEN REPLY ~Sie ist eine Elfenmagierin und hei�t Alienne. Sie befand sich mit ihrer Mutter auf dem Weg nach Norden, mehr wei� ich leider nicht.~ GOTO Spell
END

IF ~~ THEN BEGIN Money
SAY ~Es ist sch�n zu h�ren, dass Ihr Eure Dienste f�r eine gute Sache anbieten, auch wenn Eure Motivation nicht gerade Gorions Erziehung entspricht. Wenn Ihr mir ein wenig �ber Person die ihr sucht erz�hlt, k�nnte ich sie vielleicht f�r euch auf magische Weise aufsp�ren.~
IF ~~ THEN REPLY ~Sie ist eine Elfenmagierin und hei�t Alienne. Sie befand sich mit ihrer Mutter auf dem Weg nach Norden, mehr wei� ich leider nicht.~ GOTO Spell
END

IF ~~ THEN BEGIN Spell
SAY ~Nun, das ist zwar nicht viel, es sollte jedoch reichen sie zu finden.~
// Spellcasting Cutscene?
= ~Es tut mir Leid, ich konnte ihren Aufenthaltsort nicht genau erkennen. Sie befindet sich irgendwo unter der Erde ... in einer Art Keller. Es war ein sehr dunkler, grausamer Ort. Ich konnte sie kaum noch warnehmen, sie liegt im sterben.~
= ~Eine so schwache Pr�senz muss sich irgendwo in unserer N�he befinden! Ihr solltet die H�user s�dlich von hier absuchen. Beeilt Euch besser, oder Eure suche war wom�glich umsonst.~
IF ~~ THEN REPLY ~Ich danke euch f�r Eure Hilfe!~ GOTO EndTalk
END

IF ~~ THEN BEGIN EndTalk
SAY ~Nun geht schon!~
IF ~~ THEN DO ~SetGlobal("CPFirebHint","GLOBAL",1)AddJournalEntry(@10014,QUEST)~ EXIT
END