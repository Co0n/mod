EXTEND_TOP THALAN 1 #1
  IF ~Global("CPJoinSideQuest","GLOBAL",1)~ THEN REPLY ~Seid Ihr Thalantyr? Ich ben�tige Euren Stab.~ GOTO Staff
END

EXTEND_TOP THALAN 35 #1
  IF ~Global("CPJoinSideQuest","GLOBAL",1)~ THEN REPLY ~Seid Ihr Thalantyr? Ich ben�tige Euren Stab.~ GOTO Staff
END

APPEND THALAN
IF ~~ THEN BEGIN Staff
SAY ~Seht Ihr hier noch jemand anderen? Es ist wirklich nicht allzu schwer meine Identit�t zu erraten, wenn man nicht gerade einen meiner Golems f�r einen Magier wie mich h�lt. Nat�rlich bin ich Thalantyr! Und was wollt Ihr �berhaupt mit meinem Stab? Ist die Welt inzwischen untergegangen und s�mtliche W�lder haben sich in ein flammendes Inferno verwandelt oder wollt Ihr nur Euren Spa� mit einem alten Mann treiben?~
IF ~~ THEN REPLY ~Man hat mich beauftragt Euch zu t�ten und als Beweis euren magischen Stab zu �berbringen. Ich habe kein Interesse daran Euch zu t�ten, aber ich muss auf den Stab bestehen!~ GOTO Staff2
IF ~~ THEN REPLY ~Ich habe keine Zeit f�r Euer Geschw�tz, sterbt!~ GOTO Fight
END

IF ~~ THEN BEGIN Staff2
SAY ~Meinen magischen Stab wollt Ihr? Wie kommt Ihr �berhaupt darauf, dass ich etwas derartiges besitze? Ich besitze zwar den einen oder anderen magischen Gegenstand, vielleicht befindet sich darunter ja sogar ein Stab, aber DIESES tote St�ck holz was ich hier in meinen H�nden halte ist nichts anderes als das was es zu sein scheint: ein totes St�ck Holz. Im Wald findet Ihr tausende dieser Art. Und welcher Einfallspinsel schickt euch �berhaupt?~
IF ~~ THEN REPLY ~Ein Halbling namens Melvin schickt mich, warum...~ GOTO Melvin
IF ~~ THEN REPLY ~Ich habe keine Zeit f�r Euer Geschw�tz, sterbt!~ GOTO Fight
END

IF ~~ THEN BEGIN Melvin
SAY ~MELVIN! Dieser Wicht nervt mich bereits seit Wochen! Beinahe t�glich schickt er seine Handlanger um mich zu t�ten. Habt Ihr meine Diener gesehen? Ich habe sie aus den �berresten Eurer Vorg�nger gebaut.~
= ~Ich hab keine Zeit f�r seine Spielchen und ich dulde keine weiteren Unterbrechungen. Und nun verlasst mein Haus, wenn Euch Euer Leben lieb ist.~
IF ~~ THEN REPLY ~Melvin und seine Leute halten eine Magierin gefangen, wir brauchen Euren Stab damit er uns zu ihr f�hrt.~ GOTO Alienne
IF ~~ THEN REPLY ~Wenn das so ist muss ich den Stab wohl Euren toten H�nden entwinden.~ GOTO Fight
END

IF ~~ THEN BEGIN Alienne
SAY ~Bei allen G�ttern, warum sagt Ihr das nicht gleich? Das ist ein nobles Ziel das Ihr da habt! Hier, nehmt ihn, ich brauche das alte Ding ohnehin nicht wirklich. Und solltet ihr die Gelegenheit dazu bekommen, sorgt bitte daf�r, dass man mich nicht mehr st�rt. Dieser Melvin ist wirklich eine Plage!~
IF ~~ THEN REPLY ~�hm ja, ich gehe dann mal.~ GOTO EndTalk2
IF ~~ THEN REPLY ~Ich erledige meine Aufgaben lieber gr�ndlich, macht Euch auf den Tod gefasst!~ GOTO Fight2
END
                    
IF ~~ THEN BEGIN Fight
SAY ~Nun, ich denke es kann nicht schaden neues Material f�r meine Experimente zu bekommen. Aber sagt nicht ich h�tte Euch nicht gewarnt... nachdem ich Euch wieder zusammengebaut habe.~
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10010,QUEST)~ EXIT
END

IF ~~ THEN BEGIN Fight2
SAY ~Nun, ich denke es kann nicht schaden neues Material f�r meine Experimente zu bekommen. Aber sagt nicht ich h�tte Euch nicht gewarnt... nachdem ich Euch wieder zusammengebaut habe.~
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10011,QUEST)~ EXIT
END

IF ~~ THEN BEGIN EndTalk
SAY ~Ich werde mich wieder meinen Forschungen widmen, st�rt mich nicht weiter.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EndTalk2
SAY ~Ich werde mich wieder meinen Forschungen widmen, st�rt mich nicht weiter.~
IF ~~ THEN DO ~GiveItem("CPstaf1",LastTalkedToBy())AddJournalEntry(@10012,QUEST)~ EXIT
END
END