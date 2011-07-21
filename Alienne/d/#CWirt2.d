EXTEND_TOP BART13 0 #1
IF ~Global("#CQuestPart","GLOBAL",3)~ THEN REPLY ~Habt ihr in letzter Zeit neue Gäste? Ich suche eine Gruppe Reisender die ein Elfenmädchen bei sich haben.~ GOTO Answer
END

APPEND BART13
IF ~~ THEN BEGIN Answer
SAY ~Ein Elfenmädchen sagt Ihr? In den letzten Tagen angekommen?
...~
= ~Wollt Ihr mich verspotten? Die Straße ist in letzter Zeit viel zu gefährlich für einfache Reisende. Außer den Trunkenbolden die hier ohnehin den ganzen Tag herumlungern habe ich niemanden hier gesehen.
Wollt ihr nun etwas trinken oder nur weiter meine Zeit vergeuden?~
IF ~~ THEN EXIT
END
END