BEGIN CPKalen

IF ~~ THEN BEGIN 0 
  SAY ~Und ich erwarte, dass das Balg tot ist, wenn ich zur�ckkomme, Travin!~
  IF ~~ THEN EXTERN ~CPTravin~ 0
END

IF ~~ THEN BEGIN 1 
  SAY ~Und ich habe den Auftrag daf�r zu sorgen, dass alles ohne gr��eres Aufsehen abl�uft. Und ich erhalte meine Order direkt aus dem Hauptquartier! Dort ist man ohnehin der Ansicht, dass Eure �Eskapaden� langsam gef�hrlich werden k�nnten.~
  IF ~~ THEN EXTERN ~CPTravin~ 1
END

IF ~~ THEN BEGIN 2 
  SAY ~... Und dar�ber hinaus vergessen, ihre Spuren zu beseitigen. Habt Ihr eine Ahnung, was �keine Zeugen� bedeutet, Ihr Narr?~
  IF ~~ THEN EXTERN ~CPTravin~ 2
END