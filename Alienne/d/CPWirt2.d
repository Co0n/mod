EXTEND_TOP BART13 0 #1
IF ~Global("CPQuestPart","GLOBAL",3)~ THEN REPLY ~Habt ihr in letzter Zeit neue G�ste? Ich suche eine Gruppe Reisender die ein Elfenm�dchen bei sich haben.~ GOTO Answer
END

APPEND BART13
IF ~~ THEN BEGIN Answer
SAY ~Ein Elfenm�dchen sagt Ihr? In den letzten Tagen angekommen?
...~
= ~Wollt Ihr mich verspotten? Die Stra�e ist in letzter Zeit viel zu gef�hrlich f�r einfache Reisende. Au�er den Trunkenbolden die hier ohnehin den ganzen Tag herumlungern habe ich niemanden hier gesehen.
Wollt ihr nun etwas trinken oder nur weiter meine Zeit vergeuden?~
IF ~~ THEN EXIT
END
END