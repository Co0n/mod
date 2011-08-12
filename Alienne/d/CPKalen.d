BEGIN CPKalen

CHAIN 
IF ~~ THEN CPKalen 0
~Und ich erwarte, dass das Balg tot ist, wenn ich zurück komme, Travin!~
== CPTravin ~Ihr vergesst, dass ICH hier die Leitung habe! Cyric ist es ein Wohlgefallen, wenn seine Opfer sich in Agonie winden, ehe sie in den Abyss geschickt werden.~
== CPKalen ~Und ich habe den Auftrag dafür zu sorgen, dass alles ohne größeres Aufsehen abläuft. Und ich erhalte meine Order direkt aus dem Hauptquartier! Dort ist man ohnehin der Ansicht, dass Eure ‚Eskapaden’ langsam gefährlich werden könnten!~
== CPTravin ~Was Ihr nicht sagt! Immerhin waren es MEINE Leute, die das Mistgör eingefangen und hierher gebracht haben ...~
== CPKalen ~... Und darüber hinaus vergessen, ihre Spuren zu beseitigen. Habt Ihr eine Ahnung, was ‚keine Zeugen’ bedeutet, Ihr Narr!?~
== CPTravin ~Wie Ihr wünscht, Kalen. Ich werde mich sofort um das Mädchen kümmern. (arroganter Wichtigtuer!)~ DO ~ClearAllActions()StartCutSceneMode()StartCutScene("CPCUT_2")~ //Travin geht in den Folterkeller
EXIT

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN CPKalen 1
~Was bei den Höllen ... Ihr dort! Wer seid Ihr? Was habt Ihr hier zu suchen? Sprecht oder sterbt!~
== CPMelvin ~Immer mit der Ruhe Kalen! Das ist die Verstärkung aus Amn, ich habe alles überprüft.~
== CPKalen ~Sie haben Euch hinters Licht geführt, kleiner Tor!  Los, kümmert Euch um sie! Ich werde dafür sorgen, dass alle übrigen Spuren verwischt werden.~
EXIT