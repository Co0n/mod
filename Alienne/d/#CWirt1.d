EXTEND_TOP BART5 0 #1
IF ~Global("#CQuestPart","GLOBAL",3)~ THEN REPLY ~Habt ihr in letzter Zeit neue G�ste? Ich suche eine Gruppe Reisender die ein Elfenm�dchen bei sich haben.~ GOTO Answer
END

APPEND BART5
IF ~~ THEN BEGIN Answer
SAY ~G�ste? In letzter Zeit kommen nur noch wenige Reisende hier vorbei. Auf den Stra�en ist es viel zu gef�hrlich geworden. Die meisten sind klug genug zu Hause zu bleiben. 
Vor einer Woche kam eine Gruppe "Abenteurer" hier an, sie hatten nicht nur all ihr Eisen, sondern auch drei ihrer Kameraden verloren.
Wenn diese armen T�lpel nicht diejenigen sind die Ihr sucht, kann ich Euch nicht weiterhelfen.~
IF ~~ THEN EXIT
END
END