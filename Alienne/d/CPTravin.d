BEGIN CPTravin

IF ~~ THEN BEGIN 0
  SAY ~Ihr vergesst, dass ich hier die Leitung habe! Cyric ist es ein Wohlgefallen, wenn seine Opfer sich in Agonie winden, ehe sie in den Abyss geschickt werden.~
  IF ~~ THEN EXTERN ~CPKalen~ 1
END

IF ~~ THEN BEGIN 1
  SAY ~Was Ihr nicht sagt! Immerhin waren es MEINE Leute, die das Mistg�r eingefangen und hierher gebracht haben ...~
  IF ~~ THEN EXTERN ~CPKalen~ 2
END

IF ~~ THEN BEGIN 2
  SAY ~Wie Ihr w�nscht, Kalen. Ich werde mich sofort um das M�dchen k�mmern. (arroganter Wichtigtuer!)~
  IF ~~ THEN EXIT
END

//CHAIN3 CPKalen Travin
//~Und ich erwarte, dass das Balg tot ist, wenn ich zur�ckkomme, Travin!~
//== CPTravin ~~
//== CPKalen ~~
//== CPTravin ~~
//== CPKalen ~~
//== CPTravin ~~ //travin geht in den Folterkeller
//END
