BEGIN CPTravin

IF ~NumTimesTalkedTo(0)~ 
THEN BEGIN InitialTalk
SAY ~(Als Ihr den n�chsten Raum betretet seht Ihr Travin am anderen Ende des Raums stehen. Neben ihm auf dem Tisch liegt eine junge Frau, neben ihr liegt eine Vielzahl an kleinen Messern, Skalpellen und anderen Apparaturen. Der Tisch auf dem sie liegt und der Boden darunter ist rot gef�rbt von ihrem Blut und Ihr begreift, dass Ihr Alienne vor Euch habt.)~
= ~(Travin, der offensichtlich ihr Peiniger ist scheint zu besch�ftigt zu sein um Euch zu bemerken.)~
= ~Ahh, Ihr seid brav an Eurem Platz geblieben wie ich sehe. Nun, Zu schade, dass Ihr schon wieder ohnm�chtig geworden seid, aber Ihr w�rdet ohnehin nicht sonderlich weit laufen k�nnen, nicht wahr, Sch�tzchen? Ich denke es wird Zeit Euch wieder mit einem kleinen Heilzauber auf die Spr�nge zu helfen, wir wollen doch nicht, dass Ihr Euren Auftritt verpasst...~
= ~(Pl�tzlich sieht Travin auf und bemerkt Euch) IHR DORT! WER WAGT ES DAS RITUAL ZU EHREN DES GROSSEN CYRIC ZU ST�REN?! Wie zur H�lle seid Ihr hier herein gekommen? Wer seid Ihr �berhaupt?~
IF ~~ THEN REPLY ~Ich bin <CHARNAME>, und ich werde dieses M�dchen nun mit mir nehmen, Abschaum!~ GOTO Ritual
IF ~~ THEN REPLY ~Wer ich bin ist egal. Ich werde Eurem Handeln ein f�r allemal ein Ende setzen!~ GOTO Ritual
IF ~~ THEN REPLY ~Was habt Ihr dem M�dchen angetan? Was f�r ein Monster seid Ihr eigentlich!?~ GOTO Ritual
END

IF ~~ THEN BEGIN Ritual
SAY ~HA! Diese G�re ist dem gro�en Cyric, dem Bezwinger Mystras versprochen! Ich werde nicht zulassen, dass Ihr das Ritual st�rt! Dank mir konnte er sich die letzten Tage an ihrem Schmerz, an ihren unermesslichen Qualen laben. Das ist die Strafe Cyrics f�r alljene die M�chte anstreben, die den Dienern der G�tter vorbehalten sind! Cyric belohnt seine Anh�nger f�rstlich, ich kann die Macht, die er mir verleiht f�rmlich sp�ren! Jedes Wimmern, jedes St�hnen und jeder qualvolle Schrei dieser Heidin l�sst Cyric erstarken!~
= ~Ihr kommt zu sp�t, der Tod dieser G�re ist unausweichlich, daf�r befindet sie sich schon zu lange in ... meiner Obhut.~
IF ~~ THEN EXIT
END