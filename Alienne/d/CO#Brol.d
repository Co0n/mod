BEGIN CO#Brol

IF ~NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Verschwindet, ich habe keine Lust mich mit Gesindel wie Euch abzugeben!~
IF ~~ THEN EXIT
END

IF ~!Global("CO#QuestPart","GLOBAL",4)NumTimesTalkedToGT(0)~ THEN BEGIN Talk2
SAY ~Ihr schon wieder? Verschwindet, <RACE>, bevor ihr meine Stiefel zu sp�ren bekommt!~
IF ~~ THEN EXIT
END

IF ~Global("CO#QuestPart","GLOBAL",4)NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk2
SAY ~Verschwindet, ich habe keine Lust mich mit Gesindel wie Euch abzugeben!~
IF ~Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet ihr mir helfen.~ GOTO Mage
IF ~!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet Ihr mir helfen.~ GOTO Girl
IF ~~ THEN REPLY ~H�tet Eure Zunge, oder ich schneide sie Euch heraus!~ GOTO Fight
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen.~ GOTO EndTalk
END 

IF ~Global("CO#QuestPart","GLOBAL",4)NumTimesTalkedToGT(0)~ THEN BEGIN Talk3
SAY ~Ihr schon wieder? Verschwindet, bevor ihr meine Stiefel zu sp�ren bekommt!~
IF ~Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet ihr mir helfen.~ GOTO Mage
IF ~!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten M�dchen, vielleicht k�nntet Ihr mir helfen.~ GOTO Girl
IF ~~ THEN REPLY ~H�tet Eure Zunge, oder ich schneide sie Euch heraus!~ GOTO Fight
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen.~ GOTO EndTalk
END

IF ~~ THEN BEGIN Mage
SAY ~(Brols gesamte Aufmerksamkeit richtet sich pl�tzlich auf Euch. Sein Blick wandert pr�fend �ber Eure Kleidung.)~
= ~Soso, ein Magier also? Ihr seid wohl ein Begleiter dieser Rotzg�re. Macht Euch keine Gedanken, Ihr werdet sie niemals finden. Genaugenommen werdet Ihr euch eh nie wieder Gedanken machen k�nnen!
Ihr macht uns keine Probleme, f�r Begegnungen mit Eurer Sorte wurde ich ausgebildet�~
IF ~~ THEN DO ~Enemy()SetGlobal("CO#QuestPart","GLOBAL",5)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Der Schankwirt der Roten Gabe verwies mich auf einen grimmigen Kerl namens Brol, der erst seit kurzem die Schenke besuchte. Mein Gespr�ch mit ihm verlief jedoch alles andere als hilfreich. Als er bemerkte, dass ich �ber magische F�higkeiten verf�ge griff er mich an.
Er deutete an ein Magierkiller zu sein, ein Krieger der auf das T�ten von Magiern spezialisiert ist. Offensichtlich brachte er uns in Verbindung mit dem Entf�hrten M�dchen. Vielleicht finde ich einen entsprechenden Hinweis in seinem Gep�ck.% EXIT
END

IF ~~ THEN BEGIN Girl
SAY ~Ich habe weder Zeit noch Lust mich mit solchen Dingen zu befassen.~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO ConvinceFail
IF ~Global("CO#Corrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CO#Corrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~Global("CO#Corrupt300","GLOBAL",0)~ THEN REPLY ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CO#Corrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN Threat
SAY ~Schon gut <PRO_GIRLBOY>, kein Grund gleich ungem�tlich zu werden! Wir wollen doch hier keinen �rger anfangen, oder?
Jetzt steckt die Waffen wieder ein, ich erz�hle Euch was ich wei�.~
IF ~~ THEN GOTO Explain
END

IF ~~ THEN BEGIN ThreatFail
SAY ~(Brol lacht laut) Macht Euch nicht l�cherlich, sogar der fette Schankwirt w�rde Euch im Handumdrehen vor die T�r jagen! Nun steckt die Waffen ein bevor Ihr Euch noch verletzt.~
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO ConvinceFail
IF ~Global("CO#Corrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CO#Corrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~Global("CO#Corrupt300","GLOBAL",0)~ THEN REPLY ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CO#Corrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN Convince
SAY ~*grml* Ich nehme an, dass Ihr selber an Euer dummes Geschw�tz glaubt. Aber ich kann es mir nicht leisten mit der Wache in Konflikt zu geraten.~
IF ~~ THEN GOTO Explain
END

IF ~~ THEN BEGIN ConvinceFail
SAY ~(Brol lacht laut) Verd�chtig, ja? Also ist jeder hier der von Eurem Geschw�tz genervt ist "verd�chtig"?. Was wollt Ihr tun, die Wache rufen? Zieht Leine!~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~Global("CO#Corrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CO#Corrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~Global("CO#Corrupt300","GLOBAL",0)~ THEN REPLY ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CO#Corrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN CorruptFail100
SAY ~Es f�llt mir weiterhin sehr schwer mich zu erinnern, wenn Ihr versteht was ich meine.
Vielleicht w�rde es ja helfen wenn Ihr etwas tiefer in Eure Tasche greifen w�rdet...~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO ConvinceFail
IF ~Global("CO#Corrupt300","GLOBAL",0)~ THEN REPLY ~Wie w�r�s mit 300 Goldm�nzen, w�rde das Eure Zunge lockern?~ DO ~SetGlobal("CO#Corrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN CorruptFail300
SAY ~Ja, ja, ja! Ich erinnere mich dunkel etwas �ber ein Elfenm�dchen geh�rt zu haben! Wenn ich mich doch nur entsinnen k�nnte wo...
Helft mir doch ein wenig auf die Spr�nge...~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch �u�erst verd�chtig.~ GOTO ConvinceFail
IF ~Global("CO#Corrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldm�nzen euch ja umstimmen?~ DO ~SetGlobal("CO#Corrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~~ THEN REPLY ~Der Klang von 500 Goldm�nzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die St�rung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN Corrupt
SAY ~Ahhh, nat�rlich! Ich erinnere mich wieder!~
IF ~~ THEN GOTO Explain
END

IF ~~ THEN BEGIN Explain
SAY ~Meine Auftraggeber haben mich nach Beregost geschickt um hier ihre Interessen zu vertreten. In den n�chsten Tagen sollte ich mich mit meinem Kontaktmann treffen um alles weitere zu vereinbaren.~
= ~Nun, Ihr fragt Euch sicher, was das mit dem M�dchen zu tun hat das Ihr sucht. Seht, die Organisation f�r die ich arbeite versteht sich darauf bestimmte Personen... verschwinden zu lassen. Man sagte mir bereits, dass man nahe Nashkell ein neues Ziel ausfindig gemacht habe und es schleunigst zu unserer... Zweigstelle bringen wolle.~
= ~Laut meinen Auftraggebern handelte es sich dabei um eine junge Elfeng�re. Ich nehme an, dass sie das M�dchen ist von dem Ihr vorhin spracht.
Die gute Nachricht ist, dass ich Euch sagen kann wo sie sich gerade befindet...~
= ~Wie das nunmal so ist gibt es aber auch immer eine schlechte Nachricht. Unsere Organisation versteht sich auf das Ausschalten von Personen mit magischer Begabung. Wir werden ausgebildet unsere Ziele schnell und pr�zise zu erledigen.
Das ist zumindest die normale Vorgehensweise. Ihr ahnt sicherlich schon, worauf ich hinaus will. Es ist �u�erst ungew�hnlich, dass wir uns die zus�tzliche Arbeit machen Gefangene zu nehmen.~
= ~In Beregost leitet Travin die Operationen. Er ist ein sadistischer Widerling der sich am Leid der Zielpersonen erg�tzt. Ich kann Euch versichern, dass Eure Freundin gerade unvorstellbare Qualen erleidet, wenn der Tod sie nicht bereits erl�st hat.~
= ~Nehmt meine Befehle, alles was Ihr wissen m�sst um Travin zu finden steht dort drin.

Ihr versteht sicherlich, wenn ich mich jetzt aus dem Staub mache. Meine Arbeitgeber sehen es alles andere als gern, wenn man �ber sie plaudert.~
// Hier das Item "Befehle von Brol" der Gruppe �bergeben.
IF ~~ THEN DO ~GiveItem("CO#scrl1",LastTalkedToBy())SetGlobal("CO#QuestPart","GLOBAL",5)EscapeAreaDestroy(10)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Ich habe einen Mann namens Brol getroffen der mir nach etwas �berzeugungsarbeit wichtige Informationen �ber Aliennes Aufenthaltsort geben konnte. Anscheinend ist eine Gruppierung von Magierkillern hinter ihr her gewesen.
Diese Leute scheinen normalerweise keine Gefangenen zu nehmen, sondern entledigen sich ihrer Zielpersonen schnell und heimlich. Aliennes Entf�hrung stellt hier also eine Ausnahme dar. Brol erz�hlte mir, dass ein Mann namens Travin die Operationen in Beregost leitet, ein Sadist der es bevorzugt seine Opfer vorher zu foltern.
Ich sollte mich schleunigst auf die Suche nach Brols Kontaktmann in Beregost machen.% EXIT
END

IF ~~ THEN BEGIN Fight
SAY ~(Brol schnaubt ver�chtlich) Was glaubt Ihr eigentlich wer Ihr seid? Anscheinend muss ich das Gesindel von der Stra�e wieder einmal in die Schranken weisen.~
IF ~~ THEN DO ~Enemy()SetGlobal("CO#QuestPart","GLOBAL",5)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Der Schankwirt der Roten Gabe verwies mich auf einen grimmigen Kerl namens Brol, der erst seit kurzem die Schenke besuchte. Mein Gespr�ch mit ihm verlief jedoch alles andere als hilfreich. Er griff mich an, sodass mir nichts anderes �brig blieb als ihn zu t�ten.
Vielleicht finde ich in seinem Gep�ck ja einen Hinweis auf Aliennes Aufenthaltsort.% EXIT
END


IF ~~ THEN BEGIN EndTalk
SAY ~Ja das werdet Ihr, und nun macht dass ihr davon kommt!~
IF ~~ THEN EXIT
END