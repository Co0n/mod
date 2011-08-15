BEGIN CPKalen

CHAIN 
IF ~NumTimesTalkedTo(0)Global("CPKalenVSTravin","GLOBAL",0)~ THEN CPKalen Kalen.Travin
~Und ich erwarte, dass das Balg tot ist, wenn ich zurück komme, Travin!~
== CPTravin ~Ihr vergesst, dass ICH hier die Leitung habe! Cyric ist es ein Wohlgefallen, wenn seine Opfer sich in Agonie winden, ehe sie in den Abyss geschickt werden.~
== CPKalen ~Und ich habe den Auftrag dafür zu sorgen, dass alles ohne größeres Aufsehen abläuft. Ich erhalte meine Order direkt aus dem Hauptquartier! Dort ist man ohnehin der Ansicht, dass Eure "Eskapaden" langsam gefährlich werden könnten!~
== CPTravin ~Was Ihr nicht sagt! Immerhin waren es MEINE Leute, die das Mistgör eingefangen und hierher gebracht haben ...~
== CPKalen ~... Und darüber hinaus vergessen, ihre Spuren zu beseitigen. Habt Ihr eine Ahnung, was "keine Zeugen" bedeutet, Ihr Narr!?~
== CPTravin ~Hütet Eure Zunge, wenn Ihr  mit mir sprecht! Ich dulde keine weiteren Ausbrüche dieser Art, oder Euch wird es bald nicht anderes ergehen als dieser Göre! (arroganter Wichtigtuer!)~ 
== CPTravin ~Und nun kümmert Euch um diese Quälgeister die nach uns suchen! Cyric wartet nicht gerne, ich werde mich wieder unserem "Gast" widmen.~ DO ~ClearAllActions()StartCutSceneMode()StartCutScene("CPCUT_2")~ //Travin geht in den Folterkeller
EXIT

CHAIN
IF ~NumTimesTalkedTo(0)Global("CPMelvinHQArrival","GLOBAL",1)~ THEN CPKalen Kalen.Melvin
~Was bei den neun Höllen... Ihr dort! Wer seid Ihr? Was habt Ihr hier zu suchen? Sprecht oder sterbt!~
== CPMelvin ~Immer mit der Ruhe Kalen! Das ist die Verstärkung aus Amn, ich habe alles überprüft.~
== CPKalen ~Einfältiger Tölpel! Das ist die Gruppe die sich nach dem Mädchen umgehört hat, die Beschreibung passt genau! Kann man Euch denn keine Sekunde aus den Augen lassen?~
== CPKalen ~Worauf wartet Ihr noch? Tötet sie, bevor sie fliehen!~ DO ~Enemy()~ 
EXIT

APPEND CPKALEN

IF ~NumTimesTalkedTo(1)Global("CPMelvinHQArrival","GLOBAL",0)Class(LastTalkedToBy,MAGE_ALL)Global("CPKalenVSTravin","GLOBAL",1)~ THEN BEGIN InitialTalkMage
SAY ~Was bei den neun Höllen... Ihr dort! Wer seid Ihr? Was habt ihr hier zu suchen?~
= ~Moment, Ihr... Ihr seid ein MAGIER? Wie könnt Ihr es wagen hier einzudringen?! WACHEN, ZUM ANGRIFF, Tötet <PRO_HIMHER>, ehe <PRO_HESHE> einen Zauber sprechen kann!~
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~NumTimesTalkedTo(1)Global("CPMelvinHQArrival","GLOBAL",0)Global("CPKalenVSTravin","GLOBAL",1)~ THEN BEGIN InitialTalk
SAY ~Was bei den neun Höllen... Ihr dort! Wer seid Ihr? Was habt ihr hier zu suchen?~
= ~ Wie könnt Ihr es wagen hier einzudringen?! WACHEN, ZUM ANGRIFF! Lasst keinen entkommen, sonst haben wir bald die Flammende Faust am Hals!~
IF ~~THEN DO ~Enemy()~ EXIT
END

END //APPEND CPKALEN