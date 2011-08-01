EXTEND_TOP BART3 0 #1
IF ~Global("CPBeregostSearch","GLOBAL",1)~ THEN REPLY ~Habt ihr in letzter Zeit neue Gäste? Ich suche eine Gruppe Reisender die ein Elfenmädchen bei sich haben.~ GOTO Answer
END

APPEND BART3
IF ~~ THEN BEGIN Answer
SAY ~Hmm... jetzt wo Ihr's sagt, <SIRMAAM>, der grimmige Kerl dort drüben an der Bar ist vor 2 Tagen hier eingetroffen. Ich kann mich nicht daran erinnern eine Elfe in seiner Begleitung gesehen zu haben, aber vielleicht kann er Euch ja weiterhelfen.~
IF ~~ THEN DO ~SetGlobal("CPBeregostSearch","GLOBAL",2)~ EXIT
END
END