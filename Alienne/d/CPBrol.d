BEGIN CPBrol

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN CPBrol InitialTalk
~Verschwindet, ich habe keine Lust mich mit Gesindel wie Euch abzugeben!~
END
+ ~Global("CPBeregostSearch","GLOBAL",2)Class(LastTalkedToBy,MAGE_ALL)~ + ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet ihr mir helfen.~ + Mage
+ ~Global("CPBeregostSearch","GLOBAL",2)!Class(LastTalkedToBy,MAGE_ALL)~ + ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet Ihr mir helfen.~ + Girl
+ ~Global("CPBeregostSearch","GLOBAL",2)~ + ~H�tet Eure Zunge, oder ich schneide sie Euch heraus!~ + Fight
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen.~ + EndTalk

CHAIN
IF ~NumTimesTalkedToGT(0)~ THEN CPBrol Talk2
~Ihr schon wieder? Verschwindet, <RACE>, bevor ihr meine Stiefel zu sp�ren bekommt!~
END
+ ~Global("CPBeregostSearch","GLOBAL",2)Class(LastTalkedToBy,MAGE_ALL)~ + ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet ihr mir helfen.~ + Mage
+ ~Global("CPBeregostSearch","GLOBAL",2)!Class(LastTalkedToBy,MAGE_ALL)~ + ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet Ihr mir helfen.~ + Girl
+ ~Global("CPBeregostSearch","GLOBAL",2)~ + ~H�tet Eure Zunge, oder ich schneide sie Euch heraus!~ + Fight
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen.~ + EndTalk

CHAIN
IF ~~ THEN CPBrol Mage
~(Brols gesamte Aufmerksamkeit richtet sich pl�tzlich auf Euch. Sein Blick wandert pr�fend �ber Eure Kleidung.)~
= ~Soso, ein Magier also? Ihr seid wohl ein Begleiter dieser Rotzg�re. Macht Euch keine Gedanken, Ihr werdet sie niemals finden. Genaugenommen werdet Ihr euch eh nie wieder Gedanken machen k�nnen!
Ihr macht uns keine Probleme, f�r Begegnungen mit Eurer Sorte wurde ich ausgebildet�~
END
IF ~~ THEN DO ~Enemy()SetGlobal("CPBrolAttack","GLOBAL",1)AddJournalEntry(@10003,QUEST)~ EXIT

CHAIN
IF ~~ THEN CPBrol Girl
~Ich habe weder Zeit noch Lust mich mit solchen Dingen zu befassen.~
END
+ ~CheckStatGT(LastTalkedToBy,16,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + Threat
+ ~CheckStatLT(LastTalkedToBy,17,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + ThreatFail
+ ~CheckStatGT(LastTalkedToBy,16,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + Convince
+ ~CheckStatLT(LastTalkedToBy,17,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + ConvinceFail
+ ~Global("CPCorrupt100","GLOBAL",0)~ + ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ + CorruptFail100
+ ~Global("CPCorrupt300","GLOBAL",0)~ + ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ + CorruptFail300
++ ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ + Corrupt
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ + EndTalk

CHAIN
IF ~~ THEN CPBrol Threat
~Schon gut <PRO_GIRLBOY>, kein Grund gleich ungem�tlich zu werden! Wir wollen doch hier keinen �rger anfangen, oder?
Jetzt steckt die Waffen wieder ein, ich erz�hle Euch was ich wei�.~
END CPBrol Explain

CHAIN
IF ~~ THEN CPBrol ThreatFail
~(Brol lacht laut) Macht Euch nicht l�cherlich, sogar der fette Schankwirt w�rde Euch im Handumdrehen vor die T�r jagen! Nun steckt die Waffen ein bevor Ihr Euch noch verletzt.~
END
+ ~CheckStatGT(LastTalkedToBy,16,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + Convince
+ ~CheckStatLT(LastTalkedToBy,17,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + ConvinceFail
+ ~Global("CPCorrupt100","GLOBAL",0)~ + ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ + CorruptFail100
+ ~Global("CPCorrupt300","GLOBAL",0)~ + ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ + CorruptFail300
++ ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ + Corrupt
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ + EndTalk

CHAIN
IF ~~ THEN CPBrol Convince
~*grml* Ich nehme an, dass Ihr selber an Euer dummes Geschw�tz glaubt. Aber ich kann es mir nicht leisten mit der Wache in Konflikt zu geraten.~
END CPBrol Explain

CHAIN             
IF ~~ THEN CPBrol ConvinceFail
~(Brol lacht laut) Verd�chtig, ja? Also ist jeder hier der von Eurem Geschw�tz genervt ist "verd�chtig"?. Was wollt Ihr tun, die Wache rufen? Zieht Leine!~
END
+ ~CheckStatGT(LastTalkedToBy,16,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + Threat
+ ~CheckStatLT(LastTalkedToBy,17,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + ThreatFail
+ ~Global("CPCorrupt100","GLOBAL",0)~ + ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ + CorruptFail100
+ ~Global("CPCorrupt300","GLOBAL",0)~ + ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ + CorruptFail300
++ ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ + Corrupt
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ + EndTalk

CHAIN
IF ~~ THEN CPBrol CorruptFail100
~Es f�llt mir weiterhin sehr schwer mich zu erinnern, wenn Ihr versteht was ich meine.
Vielleicht w�rde es ja helfen wenn Ihr etwas tiefer in Eure Tasche greifen w�rdet...~
END
+ ~CheckStatGT(LastTalkedToBy,16,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + Threat
+ ~CheckStatLT(LastTalkedToBy,17,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + ThreatFail
+ ~CheckStatGT(LastTalkedToBy,16,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + Convince
+ ~CheckStatLT(LastTalkedToBy,17,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + ConvinceFail
+ ~Global("CPCorrupt300","GLOBAL",0)~ + ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ + CorruptFail300
++ ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ + Corrupt
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ + EndTalk

CHAIN
IF ~~ THEN CPBrol CorruptFail300
~Ja, ja, ja! Ich erinnere mich dunkel etwas �ber ein Elfenm�dchen geh�rt zu haben! Wenn ich mich doch nur entsinnen k�nnte wo...
Helft mir doch ein wenig auf die Spr�nge...~
END
+ ~CheckStatGT(LastTalkedToBy,16,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + Threat
+ ~CheckStatLT(LastTalkedToBy,17,36)~ + ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ + ThreatFail
+ ~CheckStatGT(LastTalkedToBy,16,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + Convince
+ ~CheckStatLT(LastTalkedToBy,17,39)~ + ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ + ConvinceFail
+ ~Global("CPCorrupt100","GLOBAL",0)~ + ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ + CorruptFail100
++ ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ + Corrupt
++ ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ + EndTalk

CHAIN
IF ~~ THEN CPBrol Corrupt
~Ahhh, nat�rlich! Ich erinnere mich wieder!~
END CPBrol Explain

CHAIN
IF ~~ THEN CPBrol Explain
~Meine Auftraggeber haben mich nach Beregost geschickt um hier ihre Interessen zu vertreten. In den n�chsten Tagen sollte ich mich mit meinem Kontaktmann treffen um alles weitere zu vereinbaren.~
= ~Nun, Ihr fragt Euch sicher, was das mit dem M�dchen zu tun hat das Ihr sucht. Seht, die Organisation f�r die ich arbeite versteht sich darauf bestimmte Personen... verschwinden zu lassen. Man kennt uns unter dem Namen "Zirkeln von Anmana". Man sagte mir bereits, dass man nahe Nashkell ein neues Ziel ausfindig gemacht habe und es schleunigst zu unserer... Zweigstelle bringen wolle.~
= ~Laut meinen Auftraggebern handelte es sich dabei um eine junge Elfeng�re. Ich nehme an, dass sie das M�dchen ist von dem Ihr vorhin spracht.
Die gute Nachricht ist, dass ich Euch sagen kann wo sie sich gerade befindet...~
= ~Wie das nunmal so ist gibt es aber auch immer eine schlechte Nachricht. Unsere Organisation versteht sich auf das Ausschalten von Personen mit magischer Begabung. Wir werden ausgebildet unsere Ziele schnell und pr�zise zu erledigen.
Das ist zumindest die normale Vorgehensweise. Ihr ahnt sicherlich schon, worauf ich hinaus will. Es ist �u�erst ungew�hnlich, dass wir uns die zus�tzliche Arbeit machen Gefangene zu nehmen.~
= ~In Beregost leitet Travin die Operationen. Er ist ein sadistischer Widerling der sich am Leid der Zielpersonen erg�tzt. Ich kann Euch versichern, dass Eure Freundin gerade unvorstellbare Qualen erleidet, wenn der Tod sie nicht bereits erl�st hat.~
= ~Nehmt meine Befehle, alles was Ihr wissen m�sst um Travin zu finden steht dort drin.

Ihr versteht sicherlich, wenn ich mich jetzt aus dem Staub mache. Meine Arbeitgeber sehen es alles andere als gern, wenn man �ber sie plaudert.~
END
IF ~~ THEN DO ~GiveItem("CPscrl1",LastTalkedToBy())AddJournalEntry(@10004,QUEST)EscapeAreaDestroy(10)~ EXIT

CHAIN
IF ~~ THEN CPBrol Fight
~(Brol schnaubt ver�chtlich) Was glaubt Ihr eigentlich wer Ihr seid? Anscheinend muss ich das Gesindel von der Stra�e wieder einmal in die Schranken weisen.~
END
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10005,QUEST)~ EXIT

CHAIN
IF ~~ THEN CPBrol EndTalk
~Ja das werdet Ihr, und nun macht dass ihr davon kommt!~
EXIT
