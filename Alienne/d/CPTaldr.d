BEGIN CPTaldr

// Erstes Treffen in Nashkell
// Quest Part 1 beginnt
IF ~NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Ihr dort! Bitte wartet!~
IF ~~ THEN DO ~SetGlobal("CPQuestPart","GLOBAL",1)~ GOTO Talk2
END

IF ~Global("CPQuestPart","GLOBAL",1)~ THEN BEGIN Talk2
SAY ~Bitte bleibt einen Moment stehen <SIRMAAM>, ich ben�tige Eure Hilfe!~
IF ~~ THEN REPLY ~Beruhigt Euch, wie kann ich Euch helfen?~ GOTO Help
IF ~~ THEN REPLY ~Nun gut, aber lasst Euch gesagt sein, dass meine Dienste nicht umsonst sind.~ GOTO Pay
IF ~~ THEN REPLY ~Es tut mir Leid, aber ich habe keine Zeit um mich Euren Problemem zu widmen.~ GOTO NoTime
IF ~~ THEN REPLY ~Zur Seite, Dirne! Eure Probleme interessieren mich nicht!~ GOTO Decline
END

IF ~NumTimesTalkedToGT(0)Global("CPQuestPart","GLOBAL",1)~ THEN BEGIN InitialTalk2
SAY ~Wollt Ihr mir nun helfen? Ich flehe euch an!~
IF ~~ THEN REPLY ~Beruhigt Euch, wie kann ich Euch helfen?~ GOTO Help
IF ~~ THEN REPLY ~Nun gut, aber lasst Euch gesagt sein, dass meine Dienste nicht umsonst sind.~ GOTO Pay
IF ~~ THEN REPLY ~Es tut mir Leid, aber ich habe immer noch keine Zeit.~ GOTO NoTime
IF ~~ THEN REPLY ~Ich sagte doch bereits, verschwindet!~ GOTO Decline
END

IF ~~ THEN BEGIN Pay
SAY ~Ich biete Euch mein ganzes Geld, wenn Ihr mir nur helft!~
IF ~~ THEN REPLY ~Musik in meinen Ohren, was ist Euer Anliegen?~ GOTO Help
END

IF ~~ THEN BEGIN Help
SAY ~Mystra sei gepriesen, endlich erh�rt mich jemand!~
= ~Wir wurden letzte Nacht nicht weit n�rdlich von hier �berfallen. Sie kamen nachts w�hrend wir schliefen, wir konnten uns nicht einmal verteidigen...~
IF ~~ THEN REPLY ~Und wir sollen nun Euer Hab und Gut von den R�ubern beschaffen nehme ich an?~ GOTO Property
IF ~~ THEN REPLY ~"Wir"? Ihr seid nicht alleine?~ GOTO We
END

IF ~~ THEN BEGIN Property
SAY ~(Taldrins stimme zittert w�hrend sie spricht) Es geht nicht um Geld oder irgendwelche Gegenst�nde! Sie haben mir etwas viel wichtigeres genommen.~
= ~Meine Tochter und ich waren nach Norden unterwegs. Ich d-dachte ich k�nnte uns besch�tzen!~
= ~Bitte! Ihr m�sst sie zur�ckholen!~
IF ~~ THEN REPLY ~Ihr seid getrennt worden? Wo ist sie jetzt?~ GOTO Where
END

IF ~~ THEN BEGIN We
SAY ~(Taldrins stimme zittert w�hrend sie spricht) N-nein, meine Tochter und ich waren nach Norden unterwegs. Ich d-dachte ich k�nnte uns vor den Gefahren der Stra�e besch�tzen!~
= ~Bitte! Ihr m�sst sie zur�ckholen!~
IF ~~ THEN REPLY ~Ihr seid getrennt worden? Wo ist sie jetzt?~ GOTO Where
END

IF ~~ THEN BEGIN Where
SAY ~Ich wei� es nicht, sie haben sie gepackt und verschleppt ehe ich meine Waffe ergreifen konnte.~
= ~Sie hatten es nur auf Alienne abgesehen. Normalerweise kann sie auf sich selbst aufpassen, aber anscheinend wurde sie ebenfalls �berrascht.~
= ~Das letzte was ich von ihnen sah war, wie sie Richtung Norden fl�chteten.~
IF ~~ THEN REPLY ~Wir werden alles daran setzen sie zu finden, macht Euch keine Sorgen!~ GOTO Accept
IF ~~ THEN REPLY ~Das klingt nach einer langen und schwierigen Aufgabe. Wenn die Bezahlung stimmt k�nnen wir sofort aufbrechen.~ GOTO AcceptPay
IF ~~ THEN REPLY ~Warum wendet Ihr euch nicht an die Flammende Faust?~ GOTO Guard
IF ~~ THEN REPLY ~Das klingt nach jeder Menge �rger. Wir k�nnen keine weiteren Feinde gebrauchen. Wir lehnen ab.~ GOTO Decline
END

IF ~~ THEN BEGIN Guard
SAY ~Die Faust? Diese T�lpel sind ihren Sold nicht wert! Ohne konkrete Anhaltspunkte waren sie nicht bereit die Entf�hrer zu verfolgen.~
= ~Bitte, ich brauche Eure Hilfe. Alleine werde ich es kaum schaffen die Verfolgung aufzunehmen!~
IF ~~ THEN REPLY ~Wir werden alles daran setzen sie zu finden, macht Euch keine Sorgen!~ GOTO Accept
IF ~~ THEN REPLY ~Das ist eine schwierigen Aufgabe, aber wenn die Bezahlung stimmt k�nnen wir sofort aufbrechen.~ GOTO AcceptPay
IF ~~ THEN REPLY ~Das klingt nach jeder Menge �rger. Es tut uns Leid, aber wir k�nnen keine weiteren Feinde gebrauchen. Wir lehnen ab.~ GOTO Decline
END

IF ~~ THEN BEGIN Accept
SAY ~Ich wei� garnicht wie ich Euch danken kann! Ihr solltet Eure Suche in Beregost beginnen, die Entf�hrer haben sicherlich in einem der Wirthsh�user �bernachtet. Wir haben keine Zeit zu verlieren, Ihr solltet gleich aufbrechen! Ich werde mich ebenfalls dorthin begeben und mich umh�ren.~
= ~M�ge Mystra Euch beistehen.~ 
IF ~~ THEN DO ~EraseJournalEntry(%Aliennes Entf�hung

Nach meiner R�ckkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mich verzweifelt um Hilfe bat.
Ich konnte mich jedoch nicht darauf einlassen ohne meine aktuellen Ziele aus den Augen zu verlieren.
Wenn ich es mir anders �berlege sollte ich sie noch mal in Nashkell aufsuchen.%)SetGlobal("CPQuestPart","GLOBAL",2)EscapeAreaMove("AR6704",503,809,3)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Nach meiner R�ckkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mir verzweifelt von der Entf�hrung ihrer Tochter Alienne berichtete.
Die Beiden wurden auf der Stra�e Richtung Beregost im Schlaf von R�ubern �berrascht. Taldrin meinte, dass sie es vielleicht sogar nur auf ihre Tochter abgesehen hatten.
Bei den Entf�hrern handelt es sich vermutlich um Sklavenh�ndler oder �hnliches. Ich willigte ein ihr bei der Verfolgung der Entf�hrer zu helfen.
Taldrim wartet auf mich in einem Wirtshaus in Beregost.% EXIT
END 

IF ~~ THEN BEGIN AcceptPay
SAY ~Ich gebe Euch alles was ich habe, solange Ihr mir nur meine Alienne zur�ckbringt! Ihr solltet Eure Suche in Beregost beginnen, die Entf�hrer haben sicherlich in einem der Wirthsh�user �bernachtet. Wir haben keine Zeit zu verlieren, Ihr solltet gleich aufbrechen! Ich werde mich ebenfalls dorthin begeben und mich umh�ren.~
= ~M�ge Mystra Euch beistehen!~
IF ~~ THEN DO ~EraseJournalEntry(%Aliennes Entf�hung

Nach meiner R�ckkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mich verzweifelt um Hilfe bat.
Ich konnte mich jedoch nicht darauf einlassen ohne meine aktuellen Ziele aus den Augen zu verlieren.
Wenn ich es mir anders �berlege sollte ich sie noch mal in Nashkell aufsuchen.%)SetGlobal("CPQuestPart","GLOBAL",2)EscapeAreaMove("AR6704",503,809,3)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Nach meiner R�ckkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mir verzweifelt von der Entf�hrung ihrer Tochter Alienne berichtete.
Die Beiden wurden auf der Stra�e Richtung Beregost im Schlaf von R�ubern �berrascht. Taldrin meinte, dass sie es vielleicht sogar nur auf ihre Tochter abgesehen hatten.
Bei den Entf�hrern handelt es sich vermutlich um Sklavenh�ndler oder �hnliches. Ich willigte ein ihr bei der Verfolgung der Entf�hrer zu helfen, im Gegenzug erwartet mich eine Belohnung.
Taldrim wartet auf mich in einem Wirtshaus in Beregost.% EXIT
END

IF ~~ THEN BEGIN NoTime
SAY ~Ich flehe Euch an, es ist von gr��ter Wichtigkeit! Wenn Ihr Zeit findet kommt bitte umgehend zu mir!~
IF ~~ THEN DO ~SetGlobal("CPEntryNoTime","GLOBAL",1)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Nach meiner R�ckkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mich verzweifelt um Hilfe bat.
Ich konnte mich jedoch nicht darauf einlassen ohne meine aktuellen Ziele aus den Augen zu verlieren.
Wenn ich es mir anders �berlege sollte ich sie noch mal in Nashkell aufsuchen.% EXIT
END

IF ~~ THEN BEGIN Decline
SAY ~(Taldrin schaut Euch ungl�ubig an und wendet sich schlie�lich mit Tr�nen in den Augen ab.) ~
IF ~~ THEN EXIT
END 

// Quest angenommen, Begegnung Beregost Windiger Schwindler -> Part2
IF ~Global("CPQuestPart","GLOBAL",2)~ THEN BEGIN InitialTalkP2
SAY ~Da seid Ihr ja endlich! Ich habe mich hier bereits ein wenig umgeh�rt, konnte jedoch keine Informationen �ber Aliennes Entf�hrer erhalten.
Ihr solltet Euch in den anderen Wirtsh�usern und auf der Stra�e ein wenig umh�ren. F�r gew�hnlich fallen Reisende schnell auf, irgendjemand sollte sie also gesehen haben. Ich bete darum, dass es noch nicht zu sp�t ist.~
IF ~~ THEN REPLY ~Ich w�rde Euch gerne noch ein paar Fragen stellen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN Questions
SAY ~Wenn das unserer Sache dienlich ist bin ich gerne bereit alle Fragen zu beantworten.~
IF ~~ THEN REPLY ~Habt Ihr eine Ahnung wer dahinter stecken k�nnte?~ GOTO QWho
IF ~~ THEN REPLY ~Woher stammt Ihr urspr�nglich, wenn ich fragen darf?~ GOTO QFrom
IF ~~ THEN REPLY ~Was k�nnt Ihr mir �ber Alienne erz�hlen?~ GOTO QAlienne
IF ~~ THEN REPLY ~Ich habe keine Fragen mehr, auf Wiedersehen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QWho
SAY ~Es gab einige Personen die uns nicht sonderlich freundlich gesonnen waren, aber ich kann mir nicht vorstellen, dass sie uns bis an die Schwertk�ste gefolgt sind.~
IF ~~ THEN REPLY ~Wie k�nnt Ihr Euch da so sicher sein?~ GOTO QWhySure
IF ~~ THEN REPLY ~Woher stammt Ihr urspr�nglich, wenn ich fragen darf?~ GOTO QFrom
IF ~~ THEN REPLY ~Ich m�chte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QWhySure
SAY ~Man mochte uns zwar nicht sonderlich, aber ebensowenig hasste man uns. Es ist vielmehr eine generelle Abneigung.
In unserer Heimat ist das Wirken von Magie nicht so selbstverst�ndlich wie es hierzulande ist! Dennoch gaben wir niemandem einen Grund uns b�ses zu wollen.~
IF ~~ THEN REPLY ~Woher stammt Ihr urspr�nglich, wenn ich fragen darf?~ GOTO QFrom
IF ~~ THEN REPLY ~Ihr seht nicht so aus als w�rdet Ihr mit Blitzen und Feuerb�llen um euch werfen.~ GOTO QConflictsMage
IF ~~ THEN REPLY ~Ich m�chte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QFrom
SAY ~Wir stammen urspr�nglich aus Amn, genaugenommen aus einer Stadt namens Athkathla. Das liegt weit im S�den.~
IF ~~ THEN REPLY ~Ich m�chte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QConflictsMage
SAY ~Da habt Ihr nat�rlich recht. Ich verstehe von Magie ebenso wenig wie ein Zwerg von Hygiene oder Benehmen.
Ganz anders als Alienne. Sie hatte von klein auf eine gewisse magische Begabung. Wir kommen urspr�nglich aus Athkathla in Amn.
Es war schwer f�r uns, aber vor allem f�r sie, unter diesen Umst�nden dort zu leben. Versteht mich nicht falsch, uns ging es in Athkathla keineswegs schlecht!
Aber Alienne verstand das Misstrauen das man ihr entgegen brachte damals noch nicht, es bedr�ckte sie. Daher entschloss ich mich vor einigen Jahren Amn zu verlassen und unser Gl�ck in der Ferne zu suchen.~
IF ~~ THEN REPLY ~Ich m�chte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QAlienne
SAY ~Alienne ist meine einzige Tochter und mein ganzer Stolz.
Schon von klein auf zeigte sich ihre Begabung in der Anwendung der Magie. Ich erinnere mich an jeden einzelnen ihrer Streiche, mit denen sie ihre Mitmenschen auf Trap hielt.~
= ~Einmal lies sie das Wasser ihres Lehrmeisters zu Eis erstarren w�hrend er dabei war einen tiefen Schluck zu nehmen. 
(�ber Taldrims Gesicht flitzt ein kurzes L�cheln) Er konnte nat�rlich keinen Zauber sprechen um das Eis zu tauen, schlie�lich waren seine Lippen eingefroren.
Er musste fast 2 Stunden warten bis das Eis geschmolzen war und als er sich endlich befreien konnte tobte er vor Wut.
Alienne konnte danach 3 Tage lang nicht sitzen...~
= ~Sie verf�gte damals bereits �ber erstaunliche Zauberkr�fte, aber seit sie erwachsen ist rettete Alienna mich aus mancher heiklen Lage!
Die Stra�en sind schon immer gef�hrlich gewesen, R�uber und andere Plagen treiben sich dort herum. Dennoch wusste ich immer, dass wir gemeinsam nichts zu f�rchten brauchen.
(Das L�cheln auf Taldrims Gesicht verschwindet schlagartig, als sie an die Entf�hrung ihrer Tochter denkt)
Das dachte ich zumindest...~
IF ~~ THEN REPLY ~Ich m�chte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END
   
IF ~~ THEN BEGIN Endtalk2
SAY ~Wir d�rfen ihren Vorsprung nicht noch gr��er werden lassen! Beeilt Euch!~
IF ~Global("CPQuestPart","GLOBAL",2)~ THEN DO ~SetGlobal("CPQuestPart","GLOBAL",3)~ UNSOLVED_JOURNAL %Aliennes Entf�hung

Taldrin erwartete mich wie vereinbart in Beregost. Sie berichtete mir, dass sie noch keine nennenswerten Informationen bez�glich Aliennes Entf�hrern erhalten konnte.
Sie riet mir mich auf den Stra�en und in den Wirtsh�u�ern nach k�rzlich eingetroffenen Reisenden umzuh�ren.
Ich sollte schnell mit der Suche beginnen bevor sich die Spur verliert.% EXIT
END

// Quest Part 3 beginnt ab hier
IF ~Global("CPQuestPart","GLOBAL",3)~ THEN BEGIN InitialTalkP3
SAY ~Ihr seid schon zur�ck? Was habt ihr herausgefunden?~
IF ~~ THEN REPLY ~Ich w�rde Euch gerne noch ein paar Fragen stellen.~ GOTO Questions
IF ~~ THEN REPLY ~Noch nichts, ich beginne sofort mit der Suche.~ GOTO Endtalk3
END

IF ~~ THEN BEGIN Endtalk3
SAY ~Wir d�rfen ihren Vorsprung nicht noch gr��er werden lassen! Beeilt Euch!~
IF ~~ THEN EXIT
END