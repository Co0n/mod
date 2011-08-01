EXTEND_TOP THALAN 1 #1
  IF ~Global("CPJoinSideQuest","GLOBAL",1)~ THEN REPLY ~Seid Ihr Thalantyr? Ich benötige Euren Stab.~ GOTO Staff
END

EXTEND_TOP THALAN 35 #1
  IF ~Global("CPJoinSideQuest","GLOBAL",1)~ THEN REPLY ~Seid Ihr Thalantyr? Ich benötige Euren Stab.~ GOTO Staff
END

APPEND THALAN
IF ~~ THEN BEGIN Staff
SAY ~Seht Ihr hier noch jemand anderen? Es ist wirklich nicht allzu schwer meine Identität zu erraten, wenn man nicht gerade einen meiner Golems für einen Magier wie mich hält. Natürlich bin ich Thalantyr! Und was wollt Ihr überhaupt mit meinem Stab? Ist die Welt inzwischen untergegangen und sämtliche Wälder haben sich in ein flammendes Inferno verwandelt oder wollt Ihr nur Euren Spaß mit einem alten Mann treiben?~
IF ~~ THEN REPLY ~Man hat mich beauftragt Euch zu töten und als Beweis euren magischen Stab zu überbringen. Ich habe kein Interesse daran Euch zu töten, aber ich muss auf den Stab bestehen!~ GOTO Staff2
IF ~~ THEN REPLY ~Ich habe keine Zeit für Euer Geschwätz, sterbt!~ GOTO Fight
END

IF ~~ THEN BEGIN Staff2
SAY ~Meinen magischen Stab wollt Ihr? Wie kommt Ihr überhaupt darauf, dass ich etwas derartiges besitze? Ich besitze zwar den einen oder anderen magischen Gegenstand, vielleicht befindet sich darunter ja sogar ein Stab, aber DIESES tote Stück holz was ich hier in meinen Händen halte ist nichts anderes als das was es zu sein scheint: ein totes Stück Holz. Im Wald findet Ihr tausende dieser Art. Und welcher Einfallspinsel schickt euch überhaupt?~
IF ~~ THEN REPLY ~Ein Halbling namens Melvin schickt mich, warum...~ GOTO Melvin
IF ~~ THEN REPLY ~Ich habe keine Zeit für Euer Geschwätz, sterbt!~ GOTO Fight
END

IF ~~ THEN BEGIN Melvin
SAY ~MELVIN! Dieser Wicht nervt mich bereits seit Wochen! Beinahe täglich schickt er seine Handlanger um mich zu töten. Habt Ihr meine Diener gesehen? Ich habe sie aus den überresten Eurer Vorgänger gebaut.~
= ~Ich hab keine Zeit für seine Spielchen und ich dulde keine weiteren Unterbrechungen. Und nun verlasst mein Haus, wenn Euch Euer Leben lieb ist.~
IF ~~ THEN REPLY ~Melvin und seine Leute halten eine Magierin gefangen, wir brauchen Euren Stab damit er uns zu ihr führt.~ GOTO Alienne
IF ~~ THEN REPLY ~Wenn das so ist muss ich den Stab wohl Euren toten Händen entwinden.~ GOTO Fight
END

IF ~~ THEN BEGIN Alienne
SAY ~Bei allen Göttern, warum sagt Ihr das nicht gleich? Das ist ein nobles Ziel das Ihr da habt! Hier, nehmt ihn, ich brauche das alte Ding ohnehin nicht wirklich. Und solltet ihr die Gelegenheit dazu bekommen, sorgt bitte dafür, dass man mich nicht mehr stört. Dieser Melvin ist wirklich eine Plage!~
IF ~~ THEN REPLY ~Ähm ja, ich gehe dann mal.~ GOTO EndTalk2
IF ~~ THEN REPLY ~Ich erledige meine Aufgaben lieber gründlich, macht Euch auf den Tod gefasst!~ GOTO Fight2
END
                    
IF ~~ THEN BEGIN Fight
SAY ~Nun, ich denke es kann nicht schaden neues Material für meine Experimente zu bekommen. Aber sagt nicht ich hätte Euch nicht gewarnt... nachdem ich Euch wieder zusammengebaut habe.~
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10010,QUEST)~ EXIT
END

IF ~~ THEN BEGIN Fight2
SAY ~Nun, ich denke es kann nicht schaden neues Material für meine Experimente zu bekommen. Aber sagt nicht ich hätte Euch nicht gewarnt... nachdem ich Euch wieder zusammengebaut habe.~
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10011,QUEST)~ EXIT
END

IF ~~ THEN BEGIN EndTalk
SAY ~Ich werde mich wieder meinen Forschungen widmen, stört mich nicht weiter.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EndTalk2
SAY ~Ich werde mich wieder meinen Forschungen widmen, stört mich nicht weiter.~
IF ~~ THEN DO ~GiveItem("CPstaf1",LastTalkedToBy())AddJournalEntry(@10012,QUEST)~ EXIT
END
END