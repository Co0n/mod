BEGIN CoTaldr

// Erstes Treffen in Nashkell
// Quest Part 1 beginnt
IF ~NumTimesTalkedTo(0)~ THEN BEGIN InitialTalk
SAY ~Ihr dort! Bitte wartet!~
IF ~~ THEN DO ~SetGlobal("#CQuestPart","GLOBAL",1)~ GOTO Talk2
END

IF ~Global("#CQuestPart","GLOBAL",1)~ THEN BEGIN Talk2
SAY ~Bitte bleibt einen Moment stehen <SIRMAAM>, ich benötige Eure Hilfe!~
IF ~~ THEN REPLY ~Beruhigt Euch, wie kann ich Euch helfen?~ GOTO Help
IF ~~ THEN REPLY ~Nun gut, aber lasst Euch gesagt sein, dass meine Dienste nicht umsonst sind.~ GOTO Pay
IF ~~ THEN REPLY ~Es tut mir Leid, aber ich habe keine Zeit um mich Euren Problemem zu widmen.~ GOTO NoTime
IF ~~ THEN REPLY ~Zur Seite, Dirne! Eure Probleme interessieren mich nicht!~ GOTO Decline
END

IF ~NumTimesTalkedToGT(0)Global("#CQuestPart","GLOBAL",1)~ THEN BEGIN InitialTalk2
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
SAY ~Mystra sei gepriesen, endlich erhört mich jemand!~
= ~Wir wurden letzte Nacht nicht weit nördlich von hier überfallen. Sie kamen nachts während wir schliefen, wir konnten uns nicht einmal verteidigen...~
IF ~~ THEN REPLY ~Und wir sollen nun Euer Hab und Gut von den Räubern beschaffen nehme ich an?~ GOTO Property
IF ~~ THEN REPLY ~"Wir"? Ihr seid nicht alleine?~ GOTO We
END

IF ~~ THEN BEGIN Property
SAY ~(Taldrins stimme zittert während sie spricht) Es geht nicht um Geld oder irgendwelche Gegenstände! Sie haben mir etwas viel wichtigeres genommen.~
= ~Meine Tochter und ich waren nach Norden unterwegs. Ich d-dachte ich könnte uns beschützen!~
= ~Bitte! Ihr müsst sie zurückholen!~
IF ~~ THEN REPLY ~Ihr seid getrennt worden? Wo ist sie jetzt?~ GOTO Where
END

IF ~~ THEN BEGIN We
SAY ~(Taldrins stimme zittert während sie spricht) N-nein, meine Tochter und ich waren nach Norden unterwegs. Ich d-dachte ich könnte uns vor den Gefahren der Straße beschützen!~
= ~Bitte! Ihr müsst sie zurückholen!~
IF ~~ THEN REPLY ~Ihr seid getrennt worden? Wo ist sie jetzt?~ GOTO Where
END

IF ~~ THEN BEGIN Where
SAY ~Ich weiß es nicht, sie haben sie gepackt und verschleppt ehe ich meine Waffe ergreifen konnte.~
= ~Sie hatten es nur auf Alienne abgesehen. Normalerweise kann sie auf sich selbst aufpassen, aber anscheinend wurde sie ebenfalls überrascht.~
= ~Das letzte was ich von ihnen sah war, wie sie Richtung Norden flüchteten.~
IF ~~ THEN REPLY ~Wir werden alles daran setzen sie zu finden, macht Euch keine Sorgen!~ GOTO Accept
IF ~~ THEN REPLY ~Das klingt nach einer langen und schwierigen Aufgabe. Wenn die Bezahlung stimmt können wir sofort aufbrechen.~ GOTO AcceptPay
IF ~~ THEN REPLY ~Warum wendet Ihr euch nicht an die Flammende Faust?~ GOTO Guard
IF ~~ THEN REPLY ~Das klingt nach jeder Menge Ärger. Wir können keine weiteren Feinde gebrauchen. Wir lehnen ab.~ GOTO Decline
END

IF ~~ THEN BEGIN Guard
SAY ~Die Faust? Diese Tölpel sind ihren Sold nicht wert! Ohne konkrete Anhaltspunkte waren sie nicht bereit die Entführer zu verfolgen.~
= ~Bitte, ich brauche Eure Hilfe. Alleine werde ich es kaum schaffen die Verfolgung aufzunehmen!~
IF ~~ THEN REPLY ~Wir werden alles daran setzen sie zu finden, macht Euch keine Sorgen!~ GOTO Accept
IF ~~ THEN REPLY ~Das ist eine schwierigen Aufgabe, aber wenn die Bezahlung stimmt können wir sofort aufbrechen.~ GOTO AcceptPay
IF ~~ THEN REPLY ~Das klingt nach jeder Menge Ärger. Es tut uns Leid, aber wir können keine weiteren Feinde gebrauchen. Wir lehnen ab.~ GOTO Decline
END

IF ~~ THEN BEGIN Accept
SAY ~Ich weiß garnicht wie ich Euch danken kann! Ihr solltet Eure Suche in Beregost beginnen, die Entführer haben sicherlich in einem der Wirthshäuser übernachtet.~
= ~Wir haben keine Zeit zu verlieren, Ihr solltet gleich aufbrechen! Ich werde mich ebenfalls dorthin begeben und mich umhören.~
= ~Möge Mystra Euch beistehen.~ 
IF ~~ THEN DO ~EraseJournalEntry(%Aliennes Entfühung

Nach meiner Rückkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mich verzweifelt um Hilfe bat.
Ich konnte mich jedoch nicht darauf einlassen ohne meine aktuellen Ziele aus den Augen zu verlieren.
Wenn ich es mir anders überlege sollte ich sie noch mal in Nashkell aufsuchen.%)SetGlobal("#CQuestPart","GLOBAL",2)EscapeAreaMove("AR6704",503,809,3)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Nach meiner Rückkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mir verzweifelt von der Entführung ihrer Tochter Alienne berichtete.
Die Beiden wurden auf der Straße Richtung Beregost im Schlaf von Räubern überrascht. Taldrin meinte, dass sie es vielleicht sogar nur auf ihre Tochter abgesehen hatten.
Bei den Entführern handelt es sich vermutlich um Sklavenhändler oder ähnliches. Ich willigte ein ihr bei der Verfolgung der Entführer zu helfen.
Taldrim wartet auf mich in einem Wirtshaus in Beregost.% EXIT
END 

IF ~~ THEN BEGIN AcceptPay
SAY ~Ich gebe Euch alles was ich habe, solange Ihr mir nur meine Alienne zurückbringt! Ihr solltet Eure Suche in Beregost beginnen, die Entführer haben sicherlich in einem der Wirthshäuser übernachtet.~
= ~Wir haben keine Zeit zu verlieren, Ihr solltet gleich aufbrechen! Ich werde mich ebenfalls dorthin begeben und mich umhören.~
= ~Möge Mystra Euch beistehen!~
IF ~~ THEN DO ~EraseJournalEntry(%Aliennes Entfühung

Nach meiner Rückkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mich verzweifelt um Hilfe bat.
Ich konnte mich jedoch nicht darauf einlassen ohne meine aktuellen Ziele aus den Augen zu verlieren.
Wenn ich es mir anders überlege sollte ich sie noch mal in Nashkell aufsuchen.%)SetGlobal("#CQuestPart","GLOBAL",2)EscapeAreaMove("AR6704",503,809,3)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Nach meiner Rückkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mir verzweifelt von der Entführung ihrer Tochter Alienne berichtete.
Die Beiden wurden auf der Straße Richtung Beregost im Schlaf von Räubern überrascht. Taldrin meinte, dass sie es vielleicht sogar nur auf ihre Tochter abgesehen hatten.
Bei den Entführern handelt es sich vermutlich um Sklavenhändler oder ähnliches. Ich willigte ein ihr bei der Verfolgung der Entführer zu helfen, im Gegenzug erwartet mich eine Belohnung.
Taldrim wartet auf mich in einem Wirtshaus in Beregost.% EXIT
END

IF ~~ THEN BEGIN NoTime
SAY ~Ich flehe Euch an, es ist von größter Wichtigkeit! Wenn Ihr Zeit findet kommt bitte umgehend zu mir!~
IF ~~ THEN DO ~SetGlobal("#CEntryNoTime","GLOBAL",1)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Nach meiner Rückkehr aus den Minen von Nashkell traf ich eine Elfe names Taldrin, die mich verzweifelt um Hilfe bat.
Ich konnte mich jedoch nicht darauf einlassen ohne meine aktuellen Ziele aus den Augen zu verlieren.
Wenn ich es mir anders überlege sollte ich sie noch mal in Nashkell aufsuchen.% EXIT
END

IF ~~ THEN BEGIN Decline
SAY ~(Taldrin schaut Euch ungläubig an und wendet sich schließlich mit Tränen in den Augen ab.) ~
IF ~~ THEN EXIT
END 

// Quest angenommen, Begegnung Beregost Windiger Schwindler -> Part2
IF ~Global("#CQuestPart","GLOBAL",2)~ THEN BEGIN InitialTalkP2
SAY ~Da seid Ihr ja endlich! Ich habe mich hier bereits ein wenig umgehört, konnte jedoch keine Informationen über Aliennes Entführer erhalten.
Ihr solltet Euch in den anderen Wirtshäusern und auf der Straße ein wenig umhören. Für gewöhnlich fallen Reisende schnell auf, irgendjemand sollte sie also gesehen haben. Ich bete darum, dass es noch nicht zu spät ist.~
IF ~~ THEN REPLY ~Ich würde Euch gerne noch ein paar Fragen stellen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN Questions
SAY ~Wenn das unserer Sache dienlich ist bin ich gerne bereit alle Fragen zu beantworten.~
IF ~~ THEN REPLY ~Habt Ihr eine Ahnung wer dahinter stecken könnte?~ GOTO QWho
IF ~~ THEN REPLY ~Woher stammt Ihr ursprünglich, wenn ich fragen darf?~ GOTO QFrom
IF ~~ THEN REPLY ~Was könnt Ihr mir über Alienne erzählen?~ GOTO QAlienne
IF ~~ THEN REPLY ~Ich habe keine Fragen mehr, auf Wiedersehen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QWho
SAY ~Es gab einige Personen die uns nicht sonderlich freundlich gesonnen waren, aber ich kann mir nicht vorstellen, dass sie uns bis an die Schwertküste gefolgt sind.~
IF ~~ THEN REPLY ~Wie könnt Ihr Euch da so sicher sein?~ GOTO QWhySure
IF ~~ THEN REPLY ~Woher stammt Ihr ursprünglich, wenn ich fragen darf?~ GOTO QFrom
IF ~~ THEN REPLY ~Ich möchte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QWhySure
SAY ~Man mochte uns zwar nicht sonderlich, aber ebensowenig hasste man uns. Es ist vielmehr eine generelle Abneigung.
In unserer Heimat ist das Wirken von Magie nicht so selbstverständlich wie es hierzulande ist! Dennoch gaben wir niemandem einen Grund uns böses zu wollen.~
IF ~~ THEN REPLY ~Woher stammt Ihr ursprünglich, wenn ich fragen darf?~ GOTO QFrom
IF ~~ THEN REPLY ~Ihr seht nicht so aus als würdet Ihr mit Blitzen und Feuerbällen um euch werfen.~ GOTO QConflictsMage
IF ~~ THEN REPLY ~Ich möchte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QFrom
SAY ~Wir stammen ursprünglich aus Amn, genaugenommen aus einer Stadt namens Athkathla. Das liegt weit im Süden.~
IF ~~ THEN REPLY ~Ich möchte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QConflictsMage
SAY ~Da habt Ihr natürlich recht. Ich verstehe von Magie ebenso wenig wie ein Zwerg von Hygiene oder Benehmen.
Ganz anders als Alienne. Sie hatte von klein auf eine gewisse magische Begabung. Wir kommen ursprünglich aus Athkathla in Amn.
Es war schwer für uns, aber vor allem für sie, unter diesen Umständen dort zu leben. Versteht mich nicht falsch, uns ging es in Athkathla keineswegs schlecht!
Aber Alienne verstand das Misstrauen das man ihr entgegen brachte damals noch nicht, es bedrückte sie. Daher entschloss ich mich vor einigen Jahren Amn zu verlassen und unser Glück in der Ferne zu suchen.~
IF ~~ THEN REPLY ~Ich möchte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END

IF ~~ THEN BEGIN QAlienne
SAY ~Alienne ist meine einzige Tochter und mein ganzer Stolz.
Schon von klein auf zeigte sich ihre Begabung in der Anwendung der Magie. Ich erinnere mich an jeden einzelnen ihrer Streiche, mit denen sie ihre Mitmenschen auf Trap hielt.~
= ~Einmal lies sie das Wasser ihres Lehrmeisters zu Eis erstarren während er dabei war einen tiefen Schluck zu nehmen. 
(Über Taldrims Gesicht flitzt ein kurzes Lächeln) Er konnte natürlich keinen Zauber sprechen um das Eis zu tauen, schließlich waren seine Lippen eingefroren.
Er musste fast 2 Stunden warten bis das Eis geschmolzen war und als er sich endlich befreien konnte tobte er vor Wut.
Alienne konnte danach 3 Tage lang nicht sitzen...~
= ~Sie verfügte damals bereits über erstaunliche Zauberkräfte, aber seit sie erwachsen ist rettete Alienna mich aus mancher heiklen Lage!
Die Straßen sind schon immer gefährlich gewesen, Räuber und andere Plagen treiben sich dort herum. Dennoch wusste ich immer, dass wir gemeinsam nichts zu fürchten brauchen.
(Das Lächeln auf Taldrims Gesicht verschwindet schlagartig, als sie an die Entführung ihrer Tochter denkt)
Das dachte ich zumindest...~
IF ~~ THEN REPLY ~Ich möchte Euch etwas anderes fragen.~ GOTO Questions
IF ~~ THEN REPLY ~Ich werde gleich mit der Suche beginnen.~ GOTO Endtalk2
END
   
IF ~~ THEN BEGIN Endtalk2
SAY ~Wir dürfen ihren Vorsprung nicht noch größer werden lassen! Beeilt Euch!~
IF ~Global("#CQuestPart","GLOBAL",2)~ THEN DO ~SetGlobal("#CQuestPart","GLOBAL",3)~ UNSOLVED_JOURNAL %Aliennes Entfühung

Taldrin erwartete mich wie vereinbart in Beregost. Sie berichtete mir, dass sie noch keine nennenswerten Informationen bezüglich Aliennes Entführern erhalten konnte.
Sie riet mir mich auf den Straßen und in den Wirtshäußern nach kürzlich eingetroffenen Reisenden umzuhören.
Ich sollte schnell mit der Suche beginnen bevor sich die Spur verliert.% EXIT
END

// Quest Part 3 beginnt ab hier
IF ~Global("#CQuestPart","GLOBAL",3)~ THEN BEGIN InitialTalkP3
SAY ~Ihr seid schon zurück? Was habt ihr herausgefunden?~
IF ~~ THEN REPLY ~Ich würde Euch gerne noch ein paar Fragen stellen.~ GOTO Questions
IF ~~ THEN REPLY ~Noch nichts, ich beginne sofort mit der Suche.~ GOTO Endtalk3
END

IF ~~ THEN BEGIN Endtalk3
SAY ~Wir dürfen ihren Vorsprung nicht noch größer werden lassen! Beeilt Euch!~
IF ~~ THEN EXIT
END