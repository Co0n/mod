BEGIN CPKalen

CHAIN 
IF ~~ THEN CPKalen Kalen.Travin
~Und ich erwarte, dass das Balg tot ist, wenn ich zurück komme, Travin!~
== CPTravin ~Ihr vergesst, dass ICH hier die Leitung habe! Cyric ist es ein Wohlgefallen, wenn seine Opfer sich in Agonie winden, ehe sie in den Abyss geschickt werden.~
== CPKalen ~Und ich habe den Auftrag dafür zu sorgen, dass alles ohne größeres Aufsehen abläuft. Ich erhalte meine Order direkt aus dem Hauptquartier! Dort ist man ohnehin der Ansicht, dass Eure ‚Eskapaden’ langsam gefährlich werden könnten!~
== CPTravin ~Was Ihr nicht sagt! Immerhin waren es MEINE Leute, die das Mistgör eingefangen und hierher gebracht haben ...~
== CPKalen ~... Und darüber hinaus vergessen, ihre Spuren zu beseitigen. Habt Ihr eine Ahnung, was ‚keine Zeugen’ bedeutet, Ihr Narr!?~
== CPTravin ~Hütet Eure Zunge, wenn Ihr  mit mir sprecht! Ich dulde keine weiteren Ausbrüche dieser Art, oder Euch wird es bald nicht anderes ergehen als dieser Göre! (arroganter Wichtigtuer!)~ 
== CPTravin ~Und nun kümmert Euch um diese Quälgeister die nach uns suchen! Cyric wird langsam ungeduldig, ich sollte mich wieder unserem ‚Gast’ widmen.~ DO ~ClearAllActions()StartCutSceneMode()StartCutScene("CPCUT_2")~ //Travin geht in den Folterkeller
EXIT

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN CPKalen Kalen.Melvin
~Was bei den Höllen ... Ihr dort! Wer seid Ihr? Was habt Ihr hier zu suchen? Sprecht oder sterbt!~
== CPMelvin ~Immer mit der Ruhe Kalen! Das ist die Verstärkung aus Amn, ich habe alles überprüft.~
== CPKalen ~Sie haben Euch hinters Licht geführt, kleiner Tor!  Los, kümmert Euch um sie! Ich werde dafür sorgen, dass alle übrigen Spuren verwischt werden.~
EXIT