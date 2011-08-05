EXTEND_TOP FIREBE 6 #1
IF ~Global("CPMelvinDead","GLOBAL",1)~ THEN REPLY ~Ich bin den -- NAME DER ORGANISATION -- auf der Spur, könnt Ihr mir etwas über ihren Aufenthaltsort erzählen?~ GOTO Suche
END

APPEND FIREBE
IF ~~ THEN BEGIN Suche
SAY ~Von ihnen habe ich schon seit einer Ewigkeit nichts mehr gesehen, aber ich war ja auch eine lange Zeit in Kerzenburg. Wie kommt es, dass Ihr mit solchen Menschen zu tun habt, Kind?~
IF ~~ THEN REPLY ~Sie haben eine Elfe entführt und halten sie gefangen, ich möchte sie befreien.~ GOTO Rescue
IF ~~ THEN REPLY ~Man hat mir für die Rettung eines ihrer Opfer eine gute Summe geboten.~ GOTO Money
END

IF ~~ THEN BEGIN Rescue
SAY ~Es freut mich zu hören, dass Gorions Schützling sich für die Leiden anderer interessiert. Wenn Ihr mir ein wenig über diese Elfe erzählt könnte ich sie vielleicht für euch auf magische Weise aufspüren.~
IF ~~ THEN REPLY ~Sie ist eine Elfenmagierin und heißt Alienne. Sie befand sich mit ihrer Mutter auf dem Weg nach Norden, mehr weiß ich leider nicht.~ GOTO Spell
END

IF ~~ THEN BEGIN Money
SAY ~Es ist schön zu hören, dass Ihr Eure Dienste für eine gute Sache anbieten, auch wenn Eure Motivation nicht gerade Gorions Erziehung entspricht. Wenn Ihr mir ein wenig über Person die ihr sucht erzählt, könnte ich sie vielleicht für euch auf magische Weise aufspüren.~
IF ~~ THEN REPLY ~Sie ist eine Elfenmagierin und heißt Alienne. Sie befand sich mit ihrer Mutter auf dem Weg nach Norden, mehr weiß ich leider nicht.~ GOTO Spell
END

IF ~~ THEN BEGIN Spell
SAY ~Nun, das ist zwar nicht viel, es sollte jedoch reichen sie zu finden.~
// Spellcasting Cutscene?
= ~Es tut mir Leid, ich konnte ihren Aufenthaltsort nicht genau erkennen. Sie befindet sich irgendwo unter der Erde ... in einer Art Keller. Es war ein sehr dunkler, grausamer Ort. Ich konnte sie kaum noch warnehmen, sie liegt im sterben.~
= ~Eine so schwache Präsenz muss sich irgendwo in unserer Nähe befinden! Ihr solltet die Häuser südlich von hier absuchen. Beeilt Euch besser, oder Eure suche war womöglich umsonst.~
IF ~~ THEN REPLY ~Ich danke euch für Eure Hilfe!~ GOTO EndTalk
END

IF ~~ THEN BEGIN EndTalk
SAY ~Nun geht schon!~
IF ~~ THEN DO ~SetGlobal("CPFirebHint","GLOBAL",1)AddJournalEntry(@10014,QUEST)~ EXIT
END