BEGIN CPTravin

IF ~NumTimesTalkedTo(0)~ 
THEN BEGIN InitialTalk
SAY ~(Als Ihr den nächsten Raum betretet seht Ihr Travin am anderen Ende des Raums stehen. Neben ihm auf dem Tisch liegt eine junge Frau, neben ihr liegt eine Vielzahl an kleinen Messern, Skalpellen und anderen Apparaturen. Der Tisch auf dem sie liegt und der Boden darunter ist rot gefärbt von ihrem Blut und Ihr begreift, dass Ihr Alienne vor Euch habt.)~
= ~(Travin, der offensichtlich ihr Peiniger ist scheint zu beschäftigt zu sein um Euch zu bemerken.)~
= ~Ahh, Ihr seid brav an Eurem Platz geblieben wie ich sehe. Nun, Zu schade, dass Ihr schon wieder ohnmächtig geworden seid, aber Ihr würdet ohnehin nicht sonderlich weit laufen können, nicht wahr, Schätzchen? Ich denke es wird Zeit Euch wieder mit einem kleinen Heilzauber auf die Sprünge zu helfen, wir wollen doch nicht, dass Ihr Euren Auftritt verpasst...~
= ~(Plötzlich sieht Travin auf und bemerkt Euch) IHR DORT! WER WAGT ES DAS RITUAL ZU EHREN DES GROSSEN CYRIC ZU STÖREN?! Wie zur Hölle seid Ihr hier herein gekommen? Wer seid Ihr überhaupt?~
IF ~~ THEN REPLY ~Ich bin <CHARNAME>, und ich werde dieses Mädchen nun mit mir nehmen, Abschaum!~ GOTO Ritual
IF ~~ THEN REPLY ~Wer ich bin ist egal. Ich werde Eurem Handeln ein für allemal ein Ende setzen!~ GOTO Ritual
IF ~~ THEN REPLY ~Was habt Ihr dem Mädchen angetan? Was für ein Monster seid Ihr eigentlich!?~ GOTO Ritual
END

IF ~~ THEN BEGIN Ritual
SAY ~HA! Diese Göre ist dem großen Cyric, dem Bezwinger Mystras versprochen! Ich werde nicht zulassen, dass Ihr das Ritual stört! Dank mir konnte er sich die letzten Tage an ihrem Schmerz, an ihren unermesslichen Qualen laben. Das ist die Strafe Cyrics für alljene die Mächte anstreben, die den Dienern der Götter vorbehalten sind! Cyric belohnt seine Anhänger fürstlich, ich kann die Macht, die er mir verleiht förmlich spüren! Jedes Wimmern, jedes Stöhnen und jeder qualvolle Schrei dieser Heidin lässt Cyric erstarken!~
= ~Hihihi, Ihr kommt zu spät, der Tod dieser Göre ist unausweichlich, dafür befindet sie sich schon zu lange in ... meiner Obhut. (Travin  grinst euch böse an.)~
IF ~~ THEN REPLY ~MONSTER! Dafür werdet ihr büßen!! Ihr werdet niemandem mehr Leid zufügen!~ GOTO Fight
IF ~~ THEN REPLY ~Euer Ritual interessiert mich nicht, mich interessiert nur Gold. Und das bekomme ich nunmal nur, wenn ich dieses Mädchen bei ihrer Mutter abliefere. Macht Euch bereit zu sterben.~ GOTO Fight
//Möglichkeit Alienne zu töten um die Belohnung Cyrics zu erhalten?
//IF ~~ THEN REPLY ~~
END

IF ~~ THEN BEGIN Fight
SAY ~NARREN! Glaub Ihr wirklich einem Diener des Cyric gewachsen zu sein? Ich werde Euch in seinem Namen ZERSCHMETTERN! TÖTET SIE, TÖTEN SIE ALLE!!!~
IF ~~ THEN DO ~Enemy()~ EXIT
END