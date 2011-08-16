BEGIN CPMelvin

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN CPMelvin InitialTalk
~Hmpf, geht mir aus der Sonne, <RACE>.~
END
+ ~PartyHasItem("CPscrl1")Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ + Mage
+ ~PartyHasItem("CPscrl1")!Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ + Work
+ ~PartyHasItem("CPscrl1")~ + ~Seid Ihr Melvin? Ich suche ein Mädchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~ + Fight
++ ~Auf wiedersehen.~ + EndTalk

CHAIN
IF WEIGHT #2 ~NumTimesTalkedToGT(0)~ THEN CPMelvin InitialTalk2
~Hmpf, was wollt Ihr, <RACE>?~
END
+ ~PartyHasItem("CPscrl1")Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ + Mage
+ ~PartyHasItem("CPscrl1")!Class(LastTalkedToBy,MAGE_ALL)~ + ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ DO ~TakePartyItem("CPscrl1")~ + Work
+ ~PartyHasItem("CPscrl1")~ + ~Seid Ihr Melvin? Ich suche ein Mädchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~ + Fight
++ ~Nichts, Auf wiedersehen.~ + EndTalk

CHAIN
IF WEIGHT #1 ~Global("CPMelvinHQArrival","GLOBAL",1)~ THEN CPMelvin HQArrival
~Ah, da seid Ihr ja endlich. Wartet einen Augenblick, ich werde Euch gleich vorstellen.~
END CPKalen 0 

CHAIN
IF WEIGHT #1 ~Global("CPJoinSideQuest","GLOBAL",1)~ THEN CPMelvin Sidequest
~Ah, <CHARNAME>, habt Ihr den Auftrag erfüllt?~
END
+ ~PartyHasItem("CPstaf1")~ + ~Thalantyr wird Euch keine Probleme mehr bereiten, hier ist sein Stab.~ DO ~SetGlobal("CPJoinSideQuest","GLOBAL",2)TakePartyItem("CPstaf1")AddexperienceParty(600)~ + EndTalkQuest
++ ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ + Fight2
++ ~Bin schon auf dem Weg.~ + EndTalk


CHAIN
IF WEIGHT #1 ~Global("CPJoinSideQuest","GLOBAL",2)~ THEN CPMelvin Sidequest
~Hmpf, da wären wir also. Ich erinnere Euch nochmal daran, dass dieser Ort geheim ist. Niemand weiß, dass wir hier sind und das soll auch so bleiben, verstanden?~
= ~Hier, nehmt diesen Schlüssel. Und nun lasst uns endlich hinein gehen, bevor uns noch jemand sieht.~
END
IF ~~ THEN DO ~GiveItem("CPMelKey",LastTalkedToBy())SetGlobal("CPMelvinHQArrival","GLOBAL",1)AddJournalEntry(@10013,QUEST)EscapeAreaMove("CP0001",738,363,4)~ EXIT

CHAIN
IF ~~ THEN CPMelvin Mage
~Soso, arbeiten wollt Ihr, ja? Ihr könnt mich nicht täuschen, Magier. Ich denke ich weiß ganz genau warum Ihr wirklich hier seid, und Ihr werdet bald erfahren, dass es mit uns nicht zu Spaßen ist.~
= ~Travin hat gerade eine gehörige Menge Spaß mit der Göre in einem Haus südlich von hier. Und ich werde nun meinen Spaß mit euch haben.~
= ~ANGRIFF MÄNNER!!~
END
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10006,QUEST)~ EXIT

CHAIN
IF ~~ THEN CPMelvin Work
~Soso, man schickt Euch also direkt aus Amn hier her, <PRO_GIRLBOY>? Hmpf, anscheinend traut man uns hier nicht einmal derart simple Aufträge zu. Eure Papiere scheinen echt zu sein, aber Ihr versteht sicherlich wenn ich Euch nicht direkt zum Hauptquartier geleiten kann. Wir unterstehen zwar den Meistern in Amn, aber wir haben einen gewissen Qualitätsstand zu halten, wenn Ihr versteht was ich meine...~
= ~Nun, Ihr wisst sicher wie gefährlich unsere Arbeit bisweilen sein kann, wir können uns dabei nicht auf irgendwelche Stümper aus Amn verlassen. Ich habe einen kleinen Auftrag für Euch, sozusagen um Eure Fähigkeiten unter Beweis zu stellen.~
= ~Wir sind schon seit einigen Wochen hinter einem Magier her. Er ist äußerst mächtig und verfügt über einige nicht minder mächtige und daher wertvolle Gegenstände! Da Ihr vorgebt ein im Umgang mit Magiern versierter Krieger zu sein dürfte diese Aufgabe für Euch jedoch kaum ein Problem darstellen. Tötet die Zielperson und bringt mir den Stab den sie bei sich trägt! Kann ich mich auf Euch verlassen?~
END
++ ~Wer ist die Zielperson?~ + Zielperson
++ ~Zeigt in die Richtung und betrachtet die Sache als erledigt!~ + Accept
++ ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ + Fight2

CHAIN
IF ~~ THEN CPMelvin Zielperson
~Ich kann Euch leider nicht mehr über den Auftrag erzählen bevor ich nicht Eure Zusage habe. Nehmt den Auftrag an, dann erläutere ich die Einzelheiten.~
END
++ ~Also gut, ich bin dabei.~ + Accept
++ ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ + Fight2

CHAIN
IF ~~ THEN CPMelvin Accept
~Ihr scheint zumindest nicht auf den Kopf gefallen zu sein. Also passt auf, der Auftraggeber möchte einen Magier namens Thalantyr tot sehen. Wir sind ihm bereits seit Wochen auf den Fersen, aber der Feigling hat sich lange Zeit in seinem Anwesen versteckt. Und hier kommt Ihr ins Spiel. Ihr werdet in sein Haus eindringen, den alten Kerl um die Ecke bringen und mir seinen Stab beschaffen.~
= ~Seid jedoch gewarnt, er ist ein hinterhältiger alter Knacker, und verfügt über einige magische Fähigkeiten. Kommt zurück wenn Ihr den Stab habt, er dürfte einige überaus mächtige Verzauberungen beherbergen.~
END
++ ~Tut mir Leid für Euch, aber ich habe es mir anders überlegt. Nun führt mich zu eurem Unterschlupf, dann verschone ich Euch vielleicht.~ + Fight2
++ ~Ich mache mich dann mal auf den Weg.~ + EndTalk2
                                             
// direkte Konfrontation mit der Entführung
CHAIN
IF ~~ THEN CPMelvin Fight
~Achso ist das? Seht, ich mache mir die Hände nicht mit Affen wie Euch schmutzig. Beregost ist groß, es wird Euch nicht gelingen unseren Unterschlupf zu finden bevor das Mädchen tot ist...~
= ~ANGRIFF MÄNNER!!~
END
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10007,QUEST)~ EXIT

// Bedrohung und Verlangen nach Aufenthaltsort
CHAIN
IF ~~ THEN CPMelvin Fight2
~Achso ist das? Seht, ich mache mir die Hände nicht mit Affen wie Euch schmutzig. Ich schätze ich verstehe langsam, warum Ihr wirklich hier seid. Beregost ist groß, es wird Euch nicht gelingen unseren Unterschlupf zu finden bevor das Mädchen tot ist...~
= ~ANGRIFF MÄNNER!!~
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
~Wunderbar, Ihr habt meine Erwartungen bei Weitem übertroffen! Um ehrlich zu sein habe ich nicht mit Eurer Rückkehr gerechnet, allerdings scheint ihr tatsächlich ganz brauchbare Fähigkeiten zu besitzen.
Alles weitere sollten wir mit Travin besprechen, kommt!~
END
IF ~~ THEN DO ~ClearAllActions()StartCutSceneMode()StartCutScene("CPCUT_1")~ EXIT