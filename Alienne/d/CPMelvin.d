BEGIN CPMelvin

IF 
~!Global("CPQuestPart","GLOBAL",5)
NumTimesTalkedTo(0)~ 
THEN BEGIN InitialTalk
SAY ~Hmpf, geht mir aus der Sonne, <RACE>.~
IF ~~ THEN EXIT
END

//Infos von Brol erhalten (durch Kampf oder Überzeugung)
IF 
~Global("CPQuestPart","GLOBAL",5)
NumTimesTalkedTo(0)~
THEN BEGIN InitialTalk2
SAY ~Hmpf, was wollt Ihr, <RACE>? ~
IF ~HasItem("CPscrl1",LastTalkedToBy())Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ GOTO Mage
IF ~HasItem("CPscrl1",LastTalkedToBy())!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ GOTO Work
IF ~~ THEN REPLY ~Seid Ihr Melvin? Ich suche ein Mädchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~ GOTO Fight
IF ~~ THEN REPLY ~Nichts, Auf wiedersehen.~ GOTO EndTalk
END

IF WEIGHT #2 
~Global("CPQuestPart","GLOBAL",5)
NumTimesTalkedToGT(0)~ 
THEN BEGIN InitialTalk2
SAY ~Hmpf, was wollt Ihr, <RACE>? ~
IF ~HasItem("CPscrl1",LastTalkedToBy())Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ GOTO Mage
IF ~HasItem("CPscrl1",LastTalkedToBy())!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~(Die Befehle überreichen) Ich heiße <CHARNAME>, ich soll hier für Euch arbeiten.~ GOTO Work
IF ~~ THEN REPLY ~Seid Ihr Melvin? Ich suche ein Mädchen Namens Alienne und ich glaube, dass Ihr ganz genau wisst wo ich suchen muss!~ GOTO Fight
IF ~~ THEN REPLY ~Nichts, Auf wiedersehen.~ GOTO EndTalk
END

// Nebenquest angenommen und erfüllt.
IF WEIGHT #1 
~Global("CPQuestPart","GLOBAL",5)
PartyHasItem("CPstaf1")
NumTimesTalkedToGT(0)~ THEN BEGIN InitialTalk3
SAY ~Ah, <CHARNAME>, wie ich sehe habt ihr den Stab! Dann dann mal her damit. Und ich gehe recht in der Annahme, dass Thalantyr nicht mehr unter den Lebenden weilt?~
IF ~~ THEN REPLY ~Thalantyr wird Euch keine Probleme mehr bereiten.~ DO ~SetGlobal("CPSideQuest","GLOBAL",3)SetGlobal("CPQuestPart","GLOBAL",6)TakePartyItem("CPstaf1")AddexperienceParty(600)~ GOTO EndTalkQuest
END

// Nebenquest angenommen aber noch nicht erfüllt.
IF WEIGHT #1 
~Global("CPQuestPart","GLOBAL",5)
!PartyHasItem("CPstaf1")
NumTimesTalkedToGT(0)~ 
THEN BEGIN InitialTalk4
SAY ~Worauf wartet Ihr noch, <RACE>? Kümmert Euch um Thalantyr und besorgt mir diesen Stab!~
IF ~~ THEN REPLY ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ GOTO Fight2
IF ~~ THEN REPLY ~Bin schon auf dem Weg.~ GOTO EndTalk
END

IF ~~ THEN BEGIN Mage
SAY ~Soso, arbeiten wollt Ihr, ja? Ihr könnt mich nicht täuschen, Magier. Ich denke ich weiß ganz genau warum Ihr wirklich hier seid, und Ihr werdet bald erfahren, dass es mit uns nicht zu Spaßen ist.~
= ~Travin hat gerade eine gehörige Menge Spaß mit der Göre in einem Haus südlich von hier. Und ich werde nun meinen Spaß mit euch haben.~
= ~ANGRIFF MÄNNER!!~
//Melvin greift zusammen mit seinen Wachen an.
IF ~~ THEN DO ~Enemy()SetGlobal("CPSideQuest","GLOBAL",0)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Melvin erkannte sofort, dass ich ein Magier bin und griff mich mit seinen Wachen an.
Nun habe ich jegliche Verbindung zu Alienne verloren. Mir bleibt nichts anderes übrig als in Beregost nach dem Versteck zu suchen. Ich sollte mich beeilen um Alienne lebend aus den Händen dieses Travin zu retten.% EXIT
END

IF ~~ THEN BEGIN Work
SAY ~Soso, man schickt Euch also direkt aus Amn hier her, <PRO_GIRLBOY>? Hmpf, anscheinend traut man uns hier nicht einmal derart simple Aufträge zu. Eure Papiere scheinen echt zu sein, aber Ihr versteht sicherlich wenn ich Euch nicht direkt zum Hauptquartier geleiten kann. Wir unterstehen zwar den Meistern in Amn, aber wir haben einen gewissen Qualitätsstand zu halten, wenn Ihr versteht was ich meine...~
= ~Nun, Ihr wisst sicher wie gefährlich unsere Arbeit bisweilen sein kann, wir können uns dabei nicht auf irgendwelche Stümper aus Amn verlassen. Ich habe einen kleinen Auftrag für Euch, sozusagen um Eure Fähigkeiten unter Beweis zu stellen.~
= ~Wir sind schon seit einigen Wochen hinter einem Magier her. Er ist äußerst mächtig und verfügt über einige nicht minder mächtige und daher wertvolle Gegenstände! Da Ihr vorgebt ein im Umgang mit Magiern versierter Krieger zu sein dürfte diese Aufgabe für Euch jedoch kaum ein Problem darstellen. Tötet die Zielperson und bringt mir den Stab den sie bei sich trägt! Kann ich mich auf Euch verlassen?~
IF ~~ THEN REPLY ~Wer ist die Zielperson?~ GOTO Zielperson
IF ~~ THEN REPLY ~Zeigt in die Richtung und betrachtet die Sache als erledigt!~ GOTO Accept
IF ~~ THEN REPLY ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ GOTO Fight2
END

IF ~~ THEN BEGIN Zielperson
SAY ~Ich kann Euch leider nicht mehr über den Auftrag erzählen bevor ich nicht Eure Zusage habe. Nehmt den Auftrag an, dann erläutere ich die Einzelheiten.~
IF ~~ THEN REPLY ~Also gut, ich bin dabei.~ GOTO Accept
IF ~~ THEN REPLY ~Ich habe kein Interesse Euren Handlanger zu spielen, zeigt mir den Weg zum Unterschlupf oder schmeckt Stahl!~ GOTO Fight2
END

IF ~~ THEN BEGIN Accept
SAY ~Ihr scheint zumindest nicht auf den Kopf gefallen zu sein. Also passt auf, der Auftraggeber möchte einen Magier namens Thalantyr tot sehen. Wir sind ihm bereits seit Wochen auf den Fersen, aber der Feigling hat sich lange Zeit in seinem Anwesen versteckt. Und hier kommt Ihr ins Spiel. Ihr werdet in sein Haus eindringen, den alten Kerl um die Ecke bringen und mir seinen Stab beschaffen.~
= ~Seid jedoch gewarnt, er ist ein hinterhältiger alter Knacker, und verfügt über einige magische Fähigkeiten. Kommt zurück wenn Ihr den Stab habt, er dürfte einige überaus mächtige Verzauberungen beherbergen.~
IF ~~ THEN REPLY ~Tut mir Leid für Euch, aber ich habe es mir anders überlegt. Nun führt mich zu eurem Unterschlupf, dann verschone ich Euch vielleicht.~ GOTO Fight2
IF ~~ THEN REPLY ~Ich mache mich dann mal auf den Weg.~ GOTO EndTalk2
END

// direkte Konfrontation mit der Entführung
IF ~~ THEN BEGIN Fight
SAY ~Achso ist das? Seht, ich mache mir die Hände nicht mit Affen wie Euch schmutzig. Beregost ist groß, es wird Euch nicht gelingen unseren Unterschlupf zu finden bevor das Mädchen tot ist...~
= ~ANGRIFF MÄNNER!!~
// Melvin flieht, seine Wachen greifen an.
// Wachen fehlen noch
IF ~~ THEN DO ~Enemy()SetGlobal("CPSideQuest","GLOBAL",0)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Ich habe Melvin direkt mit meiner Suche nach Alienne konfrontiert. Leider zeigte er sich davon nicht sonderlich beeindruckt und verschwand, jedoch nicht ohne seine Wachen auf uns zu hetzen.
Nun habe ich jegliche Verbindung zu Alienne verloren. Mir bleibt nichts anderes übrig als in Beregost nach dem Versteck zu suchen. Ich sollte mich beeilen um Alienne lebend aus den Händen dieses Travin zu retten.% EXIT
END

// Bedrohung und Verlangen nach Aufenthaltsort
IF ~~ THEN BEGIN Fight2
SAY ~Achso ist das? Seht, ich mache mir die Hände nicht mit Affen wie Euch schmutzig. Ich schätze ich verstehe langsam, warum Ihr wirklich hier seid. Beregost ist groß, es wird Euch nicht gelingen unseren Unterschlupf zu finden bevor das Mädchen tot ist...~
= ~ANGRIFF MÄNNER!!~
// Melvin flieht, seine Wachen greifen an.
// Wachen fehlen noch
IF ~~ THEN DO ~Enemy()SetGlobal("CPSideQuest","GLOBAL",0)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Melvin verlangte von mir, dass ich einen Magier namens Thalantyr ermorde, um meine Fähigkeiten unter Beweis zu stellen. Ich habe mich jedoch dagegen entschieden, woraufhin er seine Wachen auf mich hetzte.
Nun habe ich jegliche Verbindung zu Alienne verloren. Mir bleibt nichts anderes übrig als in Beregost nach dem Versteck zu suchen. Ich sollte mich beeilen um Alienne lebend aus den Händen dieses Travin zu retten.% EXIT
END

IF ~~ THEN BEGIN EndTalk
SAY ~Hmpf...~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EndTalk2
SAY ~Hmpf... Ich werde hier auf Euch warten. Aber beeilt euch, ich habe keine Lust den ganzen Tag hier zu stehen.~
IF ~~ THEN DO ~SetGlobal("CPSideQuest","GLOBAL",1)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Ich habe mich mit Brols Kontaktmann getroffen, dieser war jedoch nicht bereit mich ohne eine Prüfung zum Unterschlupf zu führen. Um meinen Nutzen für die Organisation zu beweisen soll ich Thalantyr töten und dessen Stab als Beweis mitbringen. Er wohnt westlich von Beregost.% EXIT
END

//Nebenquest beendet
IF ~~ THEN BEGIN EndTalkQuest
SAY ~Wunderbar, Ihr habt meine Erwartungen bei Weitem übertroffen! Um ehrlich zu sein habe ich nicht mit Eurer Rückkehr gerechnet, allerdings scheint ihr tatsächlich ganz brauchbare Fähigkeiten zu besitzen.
Alles weitere sollten wir mit Travin besprechen, kommt!~
// Melvin sollte die Gruppe nun in einer Zwischensequenz zum Unterschlupf führen.
IF ~~ THEN EXIT
END