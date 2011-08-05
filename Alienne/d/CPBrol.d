BEGIN CPBrol

IF ~NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Verschwindet, ich habe keine Lust mich mit Gesindel wie Euch abzugeben!~
IF ~Global("CPBeregostSearch","GLOBAL",2)Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten Mädchen, vielleicht könntet ihr mir helfen.~ GOTO Mage
IF ~Global("CPBeregostSearch","GLOBAL",2)!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten Mädchen, vielleicht könntet Ihr mir helfen.~ GOTO Girl
IF ~Global("CPBeregostSearch","GLOBAL",2)~ THEN REPLY ~Hütet Eure Zunge, oder ich schneide sie Euch heraus!~ GOTO Fight
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen.~ GOTO EndTalk
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN Talk2
SAY ~Ihr schon wieder? Verschwindet, <RACE>, bevor ihr meine Stiefel zu spüren bekommt!~
IF ~Global("CPBeregostSearch","GLOBAL",2)Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten Mädchen, vielleicht könntet ihr mir helfen.~ GOTO Mage
IF ~Global("CPBeregostSearch","GLOBAL",2)!Class(LastTalkedToBy,MAGE_ALL)~ THEN REPLY ~Ich bin auf der Suche nach einem vermissten Mädchen, vielleicht könntet Ihr mir helfen.~ GOTO Girl
IF ~Global("CPBeregostSearch","GLOBAL",2)~ THEN REPLY ~Hütet Eure Zunge, oder ich schneide sie Euch heraus!~ GOTO Fight
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen.~ GOTO EndTalk
END

IF ~~ THEN BEGIN Mage
SAY ~(Brols gesamte Aufmerksamkeit richtet sich plötzlich auf Euch. Sein Blick wandert prüfend über Eure Kleidung.)~
= ~Soso, ein Magier also? Ihr seid wohl ein Begleiter dieser Rotzgöre. Macht Euch keine Gedanken, Ihr werdet sie niemals finden. Genaugenommen werdet Ihr euch eh nie wieder Gedanken machen können!
Ihr macht uns keine Probleme, für Begegnungen mit Eurer Sorte wurde ich ausgebildet…~
//Variable hier eventuell erst setzen wenn Brol tot ist.
IF ~~ THEN DO ~Enemy()SetGlobal("CPBrolAttack","GLOBAL",1)AddJournalEntry(@10003,QUEST)~ EXIT
END

IF ~~ THEN BEGIN Girl
SAY ~Ich habe weder Zeit noch Lust mich mit solchen Dingen zu befassen.~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO ConvinceFail
IF ~Global("CPCorrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldmünzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~Global("CPCorrupt300","GLOBAL",0)~ THEN REPLY ~Wie wär’s mit 300 Goldmünzen, würde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldmünzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN Threat
SAY ~Schon gut <PRO_GIRLBOY>, kein Grund gleich ungemütlich zu werden! Wir wollen doch hier keinen Ärger anfangen, oder?
Jetzt steckt die Waffen wieder ein, ich erzähle Euch was ich weiß.~
IF ~~ THEN GOTO Explain
END

IF ~~ THEN BEGIN ThreatFail
SAY ~(Brol lacht laut) Macht Euch nicht lächerlich, sogar der fette Schankwirt würde Euch im Handumdrehen vor die Tür jagen! Nun steckt die Waffen ein bevor Ihr Euch noch verletzt.~
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO ConvinceFail
IF ~Global("CPCorrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldmünzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~Global("CPCorrupt300","GLOBAL",0)~ THEN REPLY ~Wie wär’s mit 300 Goldmünzen, würde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldmünzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN Convince
SAY ~*grml* Ich nehme an, dass Ihr selber an Euer dummes Geschwätz glaubt. Aber ich kann es mir nicht leisten mit der Wache in Konflikt zu geraten.~
IF ~~ THEN GOTO Explain
END

IF ~~ THEN BEGIN ConvinceFail
SAY ~(Brol lacht laut) Verdächtig, ja? Also ist jeder hier der von Eurem Geschwätz genervt ist "verdächtig"?. Was wollt Ihr tun, die Wache rufen? Zieht Leine!~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~Global("CPCorrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldmünzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~Global("CPCorrupt300","GLOBAL",0)~ THEN REPLY ~Wie wär’s mit 300 Goldmünzen, würde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldmünzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN CorruptFail100
SAY ~Es fällt mir weiterhin sehr schwer mich zu erinnern, wenn Ihr versteht was ich meine.
Vielleicht würde es ja helfen wenn Ihr etwas tiefer in Eure Tasche greifen würdet...~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO ConvinceFail
IF ~Global("CPCorrupt300","GLOBAL",0)~ THEN REPLY ~Wie wär’s mit 300 Goldmünzen, würde das Eure Zunge lockern?~ DO ~SetGlobal("CPCorrupt300","GLOBAL",1)TakePartyGold(300)~ GOTO CorruptFail300
IF ~~ THEN REPLY ~Der Klang von 500 Goldmünzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN CorruptFail300
SAY ~Ja, ja, ja! Ich erinnere mich dunkel etwas über ein Elfenmädchen gehört zu haben! Wenn ich mich doch nur entsinnen könnte wo...
Helft mir doch ein wenig auf die Sprünge...~
IF ~CheckStatGT(LastTalkedToBy,16,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO Threat
IF ~CheckStatLT(LastTalkedToBy,17,36)~ THEN REPLY ~ Nun, wir haben nicht gerade viel Zeit und haben ebenso wenig Lust zu plaudern wie Ihr. Aber im Gegensatz zu euch sind wir schwer bewaffnet und kampfbereit.~ GOTO ThreatFail
IF ~CheckStatGT(LastTalkedToBy,16,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO Convince
IF ~CheckStatLT(LastTalkedToBy,17,39)~ THEN REPLY ~ Ohne Euch zu nahe treten zu wollen, aber durch Euer ablehnendes Verhalten macht Ihr Euch äußerst verdächtig.~ GOTO ConvinceFail
IF ~Global("CPCorrupt100","GLOBAL",0)~ THEN REPLY ~Nun, vielleicht kann das Klimpern von 100 Goldmünzen euch ja umstimmen?~ DO ~SetGlobal("CPCorrupt100","GLOBAL",1)TakePartyGold(100)~ GOTO CorruptFail100
IF ~~ THEN REPLY ~Der Klang von 500 Goldmünzen sollte selbst in Euren Ohren wie Musik klingen, was wisst Ihr?~ DO ~TakePartyGold(500)~ GOTO Corrupt
IF ~~ THEN REPLY ~Verzeiht die Störung, ich werde Euch in Ruhe lassen..~ GOTO EndTalk
END

IF ~~ THEN BEGIN Corrupt
SAY ~Ahhh, natürlich! Ich erinnere mich wieder!~
IF ~~ THEN GOTO Explain
END

IF ~~ THEN BEGIN Explain
SAY ~Meine Auftraggeber haben mich nach Beregost geschickt um hier ihre Interessen zu vertreten. In den nächsten Tagen sollte ich mich mit meinem Kontaktmann treffen um alles weitere zu vereinbaren.~
= ~Nun, Ihr fragt Euch sicher, was das mit dem Mädchen zu tun hat das Ihr sucht. Seht, die Organisation für die ich arbeite versteht sich darauf bestimmte Personen... verschwinden zu lassen. Man sagte mir bereits, dass man nahe Nashkell ein neues Ziel ausfindig gemacht habe und es schleunigst zu unserer... Zweigstelle bringen wolle.~
= ~Laut meinen Auftraggebern handelte es sich dabei um eine junge Elfengöre. Ich nehme an, dass sie das Mädchen ist von dem Ihr vorhin spracht.
Die gute Nachricht ist, dass ich Euch sagen kann wo sie sich gerade befindet...~
= ~Wie das nunmal so ist gibt es aber auch immer eine schlechte Nachricht. Unsere Organisation versteht sich auf das Ausschalten von Personen mit magischer Begabung. Wir werden ausgebildet unsere Ziele schnell und präzise zu erledigen.
Das ist zumindest die normale Vorgehensweise. Ihr ahnt sicherlich schon, worauf ich hinaus will. Es ist äußerst ungewöhnlich, dass wir uns die zusätzliche Arbeit machen Gefangene zu nehmen.~
= ~In Beregost leitet Travin die Operationen. Er ist ein sadistischer Widerling der sich am Leid der Zielpersonen ergötzt. Ich kann Euch versichern, dass Eure Freundin gerade unvorstellbare Qualen erleidet, wenn der Tod sie nicht bereits erlöst hat.~
= ~Nehmt meine Befehle, alles was Ihr wissen müsst um Travin zu finden steht dort drin.

Ihr versteht sicherlich, wenn ich mich jetzt aus dem Staub mache. Meine Arbeitgeber sehen es alles andere als gern, wenn man über sie plaudert.~
IF ~~ THEN DO ~GiveItem("CPscrl1",LastTalkedToBy())AddJournalEntry(@10004,QUEST)EscapeAreaDestroy(10)~ EXIT
END

IF ~~ THEN BEGIN Fight
SAY ~(Brol schnaubt verächtlich) Was glaubt Ihr eigentlich wer Ihr seid? Anscheinend muss ich das Gesindel von der Straße wieder einmal in die Schranken weisen.~
IF ~~ THEN DO ~Enemy()AddJournalEntry(@10005,QUEST)~ EXIT
END

IF ~~ THEN BEGIN EndTalk
SAY ~Ja das werdet Ihr, und nun macht dass ihr davon kommt!~
IF ~~ THEN EXIT
END