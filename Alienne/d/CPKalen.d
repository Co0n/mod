BEGIN CPKalen

CHAIN 
IF ~~ THEN CPKalen Kalen.Travin
~Und ich erwarte, dass das Balg tot ist, wenn ich zur�ck komme, Travin!~
== CPTravin ~Ihr vergesst, dass ICH hier die Leitung habe! Cyric ist es ein Wohlgefallen, wenn seine Opfer sich in Agonie winden, ehe sie in den Abyss geschickt werden.~
== CPKalen ~Und ich habe den Auftrag daf�r zu sorgen, dass alles ohne gr��eres Aufsehen abl�uft. Ich erhalte meine Order direkt aus dem Hauptquartier! Dort ist man ohnehin der Ansicht, dass Eure �Eskapaden� langsam gef�hrlich werden k�nnten!~
== CPTravin ~Was Ihr nicht sagt! Immerhin waren es MEINE Leute, die das Mistg�r eingefangen und hierher gebracht haben ...~
== CPKalen ~... Und dar�ber hinaus vergessen, ihre Spuren zu beseitigen. Habt Ihr eine Ahnung, was �keine Zeugen� bedeutet, Ihr Narr!?~
== CPTravin ~H�tet Eure Zunge, wenn Ihr  mit mir sprecht! Ich dulde keine weiteren Ausbr�che dieser Art, oder Euch wird es bald nicht anderes ergehen als dieser G�re! (arroganter Wichtigtuer!)~ 
== CPTravin ~Und nun k�mmert Euch um diese Qu�lgeister die nach uns suchen! Cyric wartet nicht gerne, ich werde mich wieder unserem �Gast� widmen.~ DO ~ClearAllActions()StartCutSceneMode()StartCutScene("CPCUT_2")~ //Travin geht in den Folterkeller
EXIT

CHAIN
IF ~NumTimesTalkedTo(0)Global("CPMelvinHQArrival","GLOBAL",1)~ THEN CPKalen Kalen.Melvin
~Was bei den neun H�llen... Ihr dort! Wer seid Ihr? Was habt Ihr hier zu suchen? Sprecht oder sterbt!~
== CPMelvin ~Immer mit der Ruhe Kalen! Das ist die Verst�rkung aus Amn, ich habe alles �berpr�ft.~
== CPKalen ~Einf�ltiger T�lpel! Das ist die Gruppe die sich nach dem M�dchen umgeh�rt habt, die Beschreibung passt genau! Kann man Euch denn keine Sekunde aus den Augen lassen?~
== CPKalen ~Worauf wartet Ihr noch? T�tet sie, bevor sie fliehen!~ DO ~Enemy()~ 
EXIT

IF ~NumTimesTalkedTo(0)Class(LastTalkedToBy,MAGE_ALL)~ THEN
SAY ~Was bei den neun H�llen... Ihr dort! Wer seid Ihr? Was habt ihr hier zu suchen? Sprecht oder sterbt!~
= ~Moment, Ihr... Ihr seid ein MAGIER? Wie k�nnt Ihr es wagen hier einzudringen?! WACHEN, ZUM ANGRIFF!~
IF ~~ THEN DO ~Enemy()~ EXIT
END


IF ~NumTimesTalkedTo(0)Class(LastTalkedToBy,MAGE_ALL)~ THEN
SAY ~Was bei den neun H�llen... Ihr dort! Wer seid Ihr? Was habt ihr hier zu suchen? Sprecht oder sterbt!~
= ~Moment, Ihr... Ihr seid doch die Gruppe die sich in Beregost nach uns umgeh�rt hat! Wie k�nnt Ihr es wagen hier einzudringen?! WACHEN, ZUM ANGRIFF!~
IF ~~THEN DO ~Enemy()~ EXIT
END
