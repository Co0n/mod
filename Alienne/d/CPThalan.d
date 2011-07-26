EXTEND_TOP THALAN 1 #1
  IF ~Global("CPSideQuest","GLOBAL",1)~ THEN REPLY ~Seid Ihr Thalantyr? Ich benötige Euren Stab.~ GOTO Staff
END

EXTEND_TOP THALAN 35 #1
  IF ~Global("CPSideQuest","GLOBAL",1)~ THEN REPLY ~Seid Ihr Thalantyr? Ich benötige Euren Stab.~ GOTO Staff
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
IF ~~ THEN REPLY ~Ich kann nicht ohne diesen Stab gehen, Melvin würde den Betrug wahrscheinlich bemerken. Wir müssen sein Vertrauen gewinnen um die Entführer eines jungen Mädchens zu verfolgen.~ GOTO Alienne
IF ~~ THEN REPLY ~Wenn das so ist muss ich den Stab wohl Euren toten Händen entwinden.~ GOTO Fight
END

IF ~~ THEN BEGIN Alienne
SAY ~Bei allen Göttern, warum sagt Ihr das nicht gleich? Ein junges Mädchen sagt Ihr? Wie könnte ich Euch da auch nur eine Bitte ausschlagen? Ihr... müsst sie mir unbedingt vorstellen wenn Ihr sie gefunden habt. Sie wird mir sicherlich danken wollen.
Wo habe ich diesen Verjüngungstrank liegen lassen? Hmm...
(Thalantyrs lüsterner Gesichtsausdruck widert Euch an, aber offenbar habt Ihr einen wunden Punkt getroffen.)~
= ~Ihr seid noch hier? Achja, der Stab...
Nehmt ihn, ich brauche ihn ohnehin nicht. Und solltet ihr die Gelegenheit dazu bekommen, sorgt bitte dafür, dass man mich nicht mehr stört. Dieser Melvin ist wirklich eine Plage!~
IF ~~ THEN REPLY ~Ähm ja, ich gehe dann mal.~ GOTO EndTalk2
IF ~~ THEN REPLY ~Ich erledige meine Aufgaben lieber gründlich, macht Euch auf den Tod gefasst, Perversling!~ GOTO Fight2
END

IF ~~ THEN BEGIN Fight
SAY ~Nun, ich denke es kann nicht schaden neues Material für meine Experimente zu bekommen. Aber sagt nicht ich hätte Euch nicht gewarnt... nachdem ich Euch wieder zusammengebaut habe.~
IF ~~ THEN DO ~Enemy()SetGlobal("CPSideQuest","GLOBAL",2)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Ich habe Thalantyr in seinem Anwesen besucht und wie von Melvin verlangt habe ich mich um die Beschaffung des Stabs gekümmert. Ich erkenne keinerlei Magie in diesem Stück Holz, aber Auftrag ist Auftrag.% EXIT
END

IF ~~ THEN BEGIN Fight2
SAY ~Nun, ich denke es kann nicht schaden neues Material für meine Experimente zu bekommen. Aber sagt nicht ich hätte Euch nicht gewarnt... nachdem ich Euch wieder zusammengebaut habe.~
IF ~~ THEN DO ~Enemy()SetGlobal("CPSideQuest","GLOBAL",2)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Ich habe Thalantyr in seinem Anwesen besucht und wie von Melvin verlangt habe ich mich um die Beschaffung des Stabs gekümmert. Thalantyr behauptete, dass keinerlei Magie in seinem Stab steckt und übergab ihn mir freiwillig.
Thalantyr musste trotzdem das zeitliche Segnen, ich erfülle meine Aufträge nunmal gerne vollständig.% EXIT
END

IF ~~ THEN BEGIN EndTalk
SAY ~Ich werde mich wieder meinen Forschungen widmen, stört mich nicht weiter.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EndTalk2
SAY ~Ich werde mich wieder meinen Forschungen widmen, stört mich nicht weiter.~
IF ~~ THEN DO ~GiveItem("CPstaf1",LastTalkedToBy())SetGlobal("CPSideQuest","GLOBAL",2)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Ich habe Thalantyr in seinem Anwesen besucht und wie von Melvin verlangt habe ich mich um die Beschaffung des Stabs gekümmert. Thalantyr behauptete, dass keinerlei Magie in seinem Stab steckt und übergab ihn mir freiwillig.
Wenn ich Melvin den Stab übergebe wird er glauben, dass Thalantyr tot ist und mich hoffentlich endlich zu Alienne führen.
% EXIT
END
END