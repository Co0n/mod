EXTEND_TOP BART5 0 #1
IF ~Global("CO#QuestPart","GLOBAL",3)~ THEN REPLY ~Habt ihr in letzter Zeit neue Gäste? Ich suche eine Gruppe Reisender die ein Elfenmädchen bei sich haben.~ GOTO Answer
END

APPEND BART5
IF ~~ THEN BEGIN Answer
SAY ~Gäste? In letzter Zeit kommen nur noch wenige Reisende hier vorbei. Auf den Straßen ist es viel zu gefährlich geworden. Die meisten sind klug genug zu Hause zu bleiben. 
Vor einer Woche kam eine Gruppe "Abenteurer" hier an, sie hatten nicht nur all ihr Eisen, sondern auch drei ihrer Kameraden verloren.
Wenn diese armen Tölpel nicht diejenigen sind die Ihr sucht, kann ich Euch nicht weiterhelfen.~
IF ~~ THEN EXIT
END
END