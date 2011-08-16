BEGIN CPMelvin

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN CPMelvin InitialTalk
~Hmpf, geht mir aus der Sonne, <RACE>.~
END
+ ~PartyHasItem("CPscrl1")Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle �berreichen) Ich hei�e <CHARNAME>, ich soll hier f�r Euch arbeiten.~ + Mage
+ ~PartyHasItem("CPscrl1")!Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle �berreichen) Ich hei�e <CHARNAME>, ich soll hier f�r Euch arbeiten.~ + Work
+ ~PartyHasItem("CPscrl1")~ + ~Seid Ihr Melvin? Ich suche ein M�dchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~ + Fight
++ ~Auf wiedersehen.~ + EndTalk

CHAIN
IF WEIGHT #2 ~NumTimesTalkedToGT(0)~ THEN CPMelvin InitialTalk2
~Hmpf, was wollt Ihr, <RACE>?~
END
+ ~PartyHasItem("CPscrl1")Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle �berreichen) Ich hei�e <CHARNAME>, ich soll hier f�r Euch arbeiten.~ + Mage
+ ~PartyHasItem("CPscrl1")!Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle �berreichen) Ich hei�e <CHARNAME>, ich soll hier f�r Euch arbeiten.~ DO ~TakePartyItem("CPscrl1")~ + Work
+ ~PartyHasItem("CPscrl1")~ + ~Seid Ihr Melvin? Ich suche ein M�dchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~ + Fight
++ ~Nichts, Auf wiedersehen.~ + EndTalk

CHAIN
IF WEIGHT #1 ~Global("CPMelvinHQArrival","GLOBAL",1)~ THEN CPMelvin HQArrival
~Ah, da seid Ihr ja endlich. Wartet einen Augenblick, ich werde Euch gleich vorstellen.~
END CPKalen 0 

CHAIN
IF WEIGHT #1 ~Global("CPJoinSideQuest","GLOBAL",1)~ THEN CPMelvin Sidequest
~Ah, <CHARNAME>, habt Ihr den Auftrag erf�llt?~
END
+ ~PartyHasItem("CPstaf1")~ + ~Thalantyr wird Euch keine Probleme mehr bereiten, hier ist sein Stab.~ DO ~SetGlobal("CPJoinSideQuest","GLOBAL",2)TakePartyItem("CPstaf1")AddexperienceParty(600)~ + EndTalkQuest
++ ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ + Fight2
++ ~Bin schon auf dem Weg.~ + EndTalk


CHAIN
IF WEIGHT #1 ~Global("CPJoinSideQuest","GLOBAL",2)~ THEN CPMelvin Sidequest
~Hmpf, da w�ren wir also. Ich erinnere Euch nochmal daran, dass dieser Ort geheim ist. Niemand wei�, dass wir hier sind und das soll auch so bleiben, verstanden?~
= ~Hier, nehmt diesen Schl�ssel. Und nun lasst uns endlich hinein gehen, bevor uns noch jemand sieht.~
END
IF ~~ THEN DO ~GiveItem("CPMelKey",LastTalkedToBy())SetGlobal("CPMelvinHQArrival","GLOBAL",1)AddJournalEntry(@10013,QUEST)EscapeAreaMove("CP0001",738,363,4)~ EXIT

CHAIN
IF ~~ THEN CPMelvin Mage
~Soso, arbeiten wollt Ihr, ja? Ihr k�nnt mich nicht t�uschen, Magier. Ich denke ich wei� ganz genau warum Ihr wirklich hier seid, und Ihr werdet bald erfahren, dass es mit uns nicht zu Spa�en ist.~
= ~Travin hat gerade eine geh�rige Menge Spa� mit der G�re in einem Haus s�dlich von hier. Und ich werde nun meinen Spa� mit euch haben.~
= ~ANGRIFF M�NNER!!~
END
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10006,QUEST)~ EXIT

CHAIN
IF ~~ THEN CPMelvin Work
~Soso, man schickt Euch also direkt aus Amn hier her, <PRO_GIRLBOY>? Hmpf, anscheinend traut man uns hier nicht einmal derart simple Auftr�ge zu. Eure Papiere scheinen echt zu sein, aber Ihr versteht sicherlich wenn ich Euch nicht direkt zum Hauptquartier geleiten kann. Wir unterstehen zwar den Meistern in Amn, aber wir haben einen gewissen Qualit�tsstand zu halten, wenn Ihr versteht was ich meine...~
= ~Nun, Ihr wisst sicher wie gef�hrlich unsere Arbeit bisweilen sein kann, wir k�nnen uns dabei nicht auf irgendwelche St�mper aus Amn verlassen. Ich habe einen kleinen Auftrag f�r Euch, sozusagen um Eure F�higkeiten unter Beweis zu stellen.~
= ~Wir sind schon seit einigen Wochen hinter einem Magier her. Er ist �u�erst m�chtig und verf�gt �ber einige nicht minder m�chtige und daher wertvolle Gegenst�nde! Da Ihr vorgebt ein im Umgang mit Magiern versierter Krieger zu sein d�rfte diese Aufgabe f�r Euch jedoch kaum ein Problem darstellen. T�tet die Zielperson und bringt mir den Stab den sie bei sich tr�gt! Kann ich mich auf Euch verlassen?~
END
++ ~Wer ist die Zielperson?~ + Zielperson
++ ~Zeigt in die Richtung und betrachtet die Sache als erledigt!~ + Accept
++ ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ + Fight2

CHAIN
IF ~~ THEN CPMelvin Zielperson
~Ich kann Euch leider nicht mehr �ber den Auftrag erz�hlen bevor ich nicht Eure Zusage habe. Nehmt den Auftrag an, dann erl�utere ich die Einzelheiten.~
END
++ ~Also gut, ich bin dabei.~ + Accept
++ ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ + Fight2

CHAIN
IF ~~ THEN CPMelvin Accept
~Ihr scheint zumindest nicht auf den Kopf gefallen zu sein. Also passt auf, der Auftraggeber m�chte einen Magier namens Thalantyr tot sehen. Wir sind ihm bereits seit Wochen auf den Fersen, aber der Feigling hat sich lange Zeit in seinem Anwesen versteckt. Und hier kommt Ihr ins Spiel. Ihr werdet in sein Haus eindringen, den alten Kerl um die Ecke bringen und mir seinen Stab beschaffen.~
= ~Seid jedoch gewarnt, er ist ein hinterh�ltiger alter Knacker, und verf�gt �ber einige magische F�higkeiten. Kommt zur�ck wenn Ihr den Stab habt, er d�rfte einige �beraus m�chtige Verzauberungen beherbergen.~
END
++ ~Tut mir Leid f�r Euch, aber ich habe es mir anders �berlegt. Nun f�hrt mich zu eurem Unterschlupf, dann verschone ich Euch vielleicht.~ + Fight2
++ ~Ich mache mich dann mal auf den Weg.~ + EndTalk2
                                             
// direkte Konfrontation mit der Entf�hrung
CHAIN
IF ~~ THEN CPMelvin Fight
~Achso ist das? Seht, ich mache mir die H�nde nicht mit Affen wie Euch schmutzig. Beregost ist gro�, es wird Euch nicht gelingen unseren Unterschlupf zu finden bevor das M�dchen tot ist...~
= ~ANGRIFF M�NNER!!~
END
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10007,QUEST)~ EXIT

// Bedrohung und Verlangen nach Aufenthaltsort
CHAIN
IF ~~ THEN CPMelvin Fight2
~Achso ist das? Seht, ich mache mir die H�nde nicht mit Affen wie Euch schmutzig. Ich sch�tze ich verstehe langsam, warum Ihr wirklich hier seid. Beregost ist gro�, es wird Euch nicht gelingen unseren Unterschlupf zu finden bevor das M�dchen tot ist...~
= ~ANGRIFF M�NNER!!~
END
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10008,QUEST)~ EXIT

CHAIN
IF ~~ THEN CPMelvin EndTalk
~Hmpf...~
EXIT

CHAIN
IF ~~ THEN CPMelvin EndTalk2
~Hmpf... Ich werde hier auf Euch warten. Aber beeilt euch, ich habe keine Lust den ganzen Tag hier zu stehen.~
END
IF ~~ THEN DO ~SetGlobal("CPJoinSideQuest","GLOBAL",1)AddJournalEntry(@10009,QUEST)~ EXIT

//Nebenquest beendet
CHAIN
IF ~~ THEN CPMelvin EndTalkQuest
~Wunderbar, Ihr habt meine Erwartungen bei Weitem �bertroffen! Um ehrlich zu sein habe ich nicht mit Eurer R�ckkehr gerechnet, allerdings scheint ihr tats�chlich ganz brauchbare F�higkeiten zu besitzen.
Alles weitere sollten wir mit Travin besprechen, kommt!~
END
IF ~~ THEN DO ~ClearAllActions()StartCutSceneMode()StartCutScene("CPCUT_1")~ EXIT