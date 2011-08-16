BEGIN CPTaldr

// Erstes Treffen in Nashkell
// Quest Part 1 beginnt
CHAIN
IF ~NumTimesTalkedTo(0)~ THEN CPTaldr InitialTalk
~Ihr dort! Bitte wartet!~
END CPTaldr Talk2

CHAIN
IF ~NumTimesTalkedToGT(0)Global("CPJoinQuest","GLOBAL",0)~ THEN CPTaldr InitialTalk2
~Wollt Ihr mir nun helfen? Ich flehe euch an!~
END
++ ~Beruhigt Euch, wie kann ich Euch helfen?~ + Help
++ ~Nun gut, aber lasst Euch gesagt sein, dass meine Dienste nicht umsonst sind.~ + Pay
++ ~Es tut mir Leid, aber ich habe immer noch keine Zeit.~ + NoTime
++ ~Ich sagte doch bereits, verschwindet!~ + Decline

CHAIN
IF ~~ THEN CPTaldr Talk2
~Bitte bleibt einen Moment stehen <SIRMAAM>, ich benötige Eure Hilfe!~
END
++ ~Beruhigt Euch, wie kann ich Euch helfen?~ + Help
++ ~Nun gut, aber lasst Euch gesagt sein, dass meine Dienste nicht umsonst sind.~ + Pay
++ ~Es tut mir Leid, aber ich habe keine Zeit um mich Euren Problemem zu widmen.~ + NoTime
++ ~Zur Seite, Dirne! Eure Probleme interessieren mich nicht!~ + Decline

CHAIN
IF ~~ THEN CPTaldr Pay
~Ich biete Euch mein ganzes Geld, wenn Ihr mir nur helft!~
END
++ ~Musik in meinen Ohren, was ist Euer Anliegen?~ + Help

CHAIN
IF ~~ THEN CPTaldr Help
~Mystra sei gepriesen, endlich erhört mich jemand!~
= ~Wir wurden letzte Nacht nicht weit nördlich von hier überfallen. Sie kamen nachts während wir schliefen, wir konnten uns nicht einmal verteidigen...~
END
++ ~Und wir sollen nun Euer Hab und Gut von den Räubern beschaffen nehme ich an?~ + Property
++ ~"Wir"? Ihr seid nicht alleine?~ + We


CHAIN
IF ~~ THEN CPTaldr Property
~(Taldrins stimme zittert während sie spricht) Es geht nicht um Geld oder irgendwelche Gegenstände! Sie haben mir etwas viel wichtigeres genommen.~
= ~Meine Tochter und ich waren nach Norden unterwegs. Ich d-dachte ich könnte uns beschützen!~
= ~Bitte! Ihr müsst sie zurückholen!~
END
++ ~Ihr seid getrennt worden? Wo ist sie jetzt?~ + Where

CHAIN
IF ~~ THEN CPTaldr We
~(Taldrins stimme zittert während sie spricht) N-nein, meine Tochter und ich waren nach Norden unterwegs. Ich d-dachte ich könnte uns vor den Gefahren der Straße beschützen!~
= ~Bitte! Ihr müsst sie zurückholen!~
END
++ ~Ihr seid getrennt worden? Wo ist sie jetzt?~ + Where

CHAIN
IF ~~ THEN CPTaldr Where
~Ich weiß es nicht, sie haben sie gepackt und verschleppt ehe ich meine Waffe ergreifen konnte.~
= ~Sie hatten es nur auf Alienne abgesehen. Normalerweise kann sie auf sich selbst aufpassen, aber anscheinend wurde sie ebenfalls überrascht.~
= ~Das letzte was ich von ihnen sah war, wie sie Richtung Norden flüchteten.~
END
++ ~Wir werden alles daran setzen sie zu finden, macht Euch keine Sorgen!~ + Accept
++ ~Das klingt nach einer langen und schwierigen Aufgabe. Wenn die Bezahlung stimmt können wir sofort aufbrechen.~ + AcceptPay
++ ~Warum wendet Ihr euch nicht an die Flammende Faust?~ + Guard
++ ~Das klingt nach jeder Menge Ärger. Wir können keine weiteren Feinde gebrauchen. Wir lehnen ab.~ + Decline

CHAIN
IF ~~ THEN CPTaldr Guard
~Die Faust? Diese Tölpel sind ihren Sold nicht wert! Ohne konkrete Anhaltspunkte waren sie nicht bereit die Entführer zu verfolgen.~
= ~Bitte, ich brauche Eure Hilfe. Alleine werde ich es kaum schaffen die Verfolgung aufzunehmen!~
END
++ ~Wir werden alles daran setzen sie zu finden, macht Euch keine Sorgen!~ + Accept
++ ~Das ist eine schwierigen Aufgabe, aber wenn die Bezahlung stimmt können wir sofort aufbrechen.~ + AcceptPay
++ ~Das klingt nach jeder Menge Ärger. Es tut uns Leid, aber wir können keine weiteren Feinde gebrauchen. Wir lehnen ab.~ + Decline

CHAIN
IF ~~ THEN CPTaldr Accept
~Ich weiß garnicht wie ich Euch danken kann! Ihr solltet Eure Suche in Beregost beginnen, die Entführer haben sicherlich in einem der Wirthshäuser übernachtet. Wir haben keine Zeit zu verlieren, Ihr solltet gleich aufbrechen! Ich werde mich ebenfalls dorthin begeben und mich umhören.~
= ~Möge Mystra Euch beistehen.~ 
END
IF ~~ THEN DO ~EraseJournalEntry(@10000)SetGlobal("CPJoinQuest","GLOBAL",1)AddJournalEntry(@10001,QUEST)EscapeAreaMove("AR6704",503,809,3)~ EXIT 

CHAIN
IF ~~ THEN CPTaldr AcceptPay
~Ich gebe Euch alles was ich habe, solange Ihr mir nur meine Alienne zurückbringt! Ihr solltet Eure Suche in Beregost beginnen, die Entführer haben sicherlich in einem der Wirthshäuser übernachtet. Wir haben keine Zeit zu verlieren, Ihr solltet gleich aufbrechen! Ich werde mich ebenfalls dorthin begeben und mich umhören.~
= ~Möge Mystra Euch beistehen!~
END
IF ~~ THEN DO ~EraseJournalEntry(@10000)SetGlobal("CPJoinQuest","GLOBAL",1)AddJournalEntry(@10001,QUEST)EscapeAreaMove("AR6704",503,809,3)~ EXIT

CHAIN
IF ~~ THEN CPTaldr NoTime
~Ich flehe Euch an, es ist von größter Wichtigkeit! Wenn Ihr Zeit findet kommt bitte umgehend zu mir!~
END
IF ~~ THEN DO ~AddJournalEntry(@10000,QUEST)~ EXIT

CHAIN
IF ~~ THEN CPTaldr Decline
~(Taldrin schaut Euch ungläubig an und wendet sich schließlich mit Tränen in den Augen ab.) ~
EXIT


// Quest angenommen, Begegnung Beregost Windiger Schwindler -> Part2
CHAIN
IF ~Global("CPJoinQuest","GLOBAL",1)Global("CPBeregostSearch","GLOBAL",0)~ THEN CPTaldr InitialTalkP2
~Da seid Ihr ja endlich! Ich habe mich hier bereits ein wenig umgehört, konnte jedoch keine Informationen über Aliennes Entführer erhalten.
Ihr solltet Euch in den anderen Wirtshäusern und auf der Straße ein wenig umhören. Für gewöhnlich fallen Reisende schnell auf, irgendjemand sollte sie also gesehen haben. Ich bete darum, dass es noch nicht zu spät ist.~
END
++ ~Ich würde Euch gerne noch ein paar Fragen stellen.~ + Questions
++ ~Ich werde gleich mit der Suche beginnen.~ + Endtalk2

CHAIN
IF ~~ THEN CPTaldr Questions
~Wenn das unserer Sache dienlich ist bin ich gerne bereit alle Fragen zu beantworten.~
END
++ ~Habt Ihr eine Ahnung wer dahinter stecken könnte?~ + QWho
++ ~Woher stammt Ihr ursprünglich, wenn ich fragen darf?~ + QFrom
++ ~Was könnt Ihr mir über Alienne erzählen?~ + QAlienne
++ ~Ich habe keine Fragen mehr, auf Wiedersehen.~ + Endtalk2

CHAIN
IF ~~ THEN CPTaldr QWho
~Es gab einige Personen die uns nicht sonderlich freundlich gesonnen waren, aber ich kann mir nicht vorstellen, dass sie uns bis an die Schwertküste gefolgt sind.~
END
++ ~Wie könnt Ihr Euch da so sicher sein?~ + QWhySure
++ ~Woher stammt Ihr ursprünglich, wenn ich fragen darf?~ + QFrom
++ ~Ich möchte Euch etwas anderes fragen.~ + Questions
++ ~Ich werde gleich mit der Suche beginnen.~ + Endtalk2

CHAIN
IF ~~ THEN CPTaldr QWhySure
~Man mochte uns zwar nicht sonderlich, aber ebensowenig hasste man uns. Es ist vielmehr eine generelle Abneigung.
In unserer Heimat ist das Wirken von Magie nicht so selbstverständlich wie es hierzulande ist! Dennoch gaben wir niemandem einen Grund uns böses zu wollen.~
END
++ ~Woher stammt Ihr ursprünglich, wenn ich fragen darf?~ + QFrom
++ ~Ihr seht nicht so aus als würdet Ihr mit Blitzen und Feuerbällen um euch werfen.~ + QConflictsMage
++ ~Ich möchte Euch etwas anderes fragen.~ + Questions
++ ~Ich werde gleich mit der Suche beginnen.~ + Endtalk2

CHAIN
IF ~~ THEN CPTaldr QFrom
~Wir stammen ursprünglich aus Amn, genaugenommen aus einer Stadt namens Athkathla. Das liegt weit im Süden.~
END
++ ~Ich möchte Euch etwas anderes fragen.~ + Questions
++ ~Ich werde gleich mit der Suche beginnen.~ + Endtalk2

CHAIN
IF ~~ THEN CPTaldr QConflictsMage
~Da habt Ihr natürlich recht. Ich verstehe von Magie ebenso wenig wie ein Zwerg von Hygiene oder Benehmen.
Ganz anders als Alienne. Sie hatte von klein auf eine gewisse magische Begabung. Wir kommen ursprünglich aus Athkathla in Amn.
Es war schwer für uns, aber vor allem für sie, unter diesen Umständen dort zu leben. Versteht mich nicht falsch, uns ging es in Athkathla keineswegs schlecht!
Aber Alienne verstand das Misstrauen das man ihr entgegen brachte damals noch nicht, es bedrückte sie. Daher entschloss ich mich vor einigen Jahren Amn zu verlassen und unser Glück in der Ferne zu suchen.~
END
++ ~Ich möchte Euch etwas anderes fragen.~ + Questions
++ ~Ich werde gleich mit der Suche beginnen.~ + Endtalk2

CHAIN
IF ~~ THEN CPTaldr QAlienne
~Alienne ist meine einzige Tochter und mein ganzer Stolz.
Schon von klein auf zeigte sich ihre Begabung in der Anwendung der Magie. Ich erinnere mich an jeden einzelnen ihrer Streiche, mit denen sie ihre Mitmenschen auf Trap hielt.~
= ~Einmal lies sie das Wasser ihres Lehrmeisters zu Eis erstarren während er dabei war einen tiefen Schluck zu nehmen. 
(Über Taldrims Gesicht flitzt ein kurzes Lächeln) Er konnte natürlich keinen Zauber sprechen um das Eis zu tauen, schließlich waren seine Lippen eingefroren.
Er musste fast 2 Stunden warten bis das Eis geschmolzen war und als er sich endlich befreien konnte tobte er vor Wut.
Alienne konnte danach 3 Tage lang nicht sitzen...~
= ~Sie verfügte damals bereits über erstaunliche Zauberkräfte, aber seit sie erwachsen ist rettete Alienna mich aus mancher heiklen Lage!
Die Straßen sind schon immer gefährlich gewesen, Räuber und andere Plagen treiben sich dort herum. Dennoch wusste ich immer, dass wir gemeinsam nichts zu fürchten brauchen.
(Das Lächeln auf Taldrims Gesicht verschwindet schlagartig, als sie an die Entführung ihrer Tochter denkt)
Das dachte ich zumindest...~
END
++ ~Ich möchte Euch etwas anderes fragen.~ + Questions
++ ~Ich werde gleich mit der Suche beginnen.~ + Endtalk2
   
CHAIN
IF ~~ THEN CPTaldr Endtalk2
~Wir dürfen ihren Vorsprung nicht noch größer werden lassen! Beeilt Euch!~
END
IF ~Global("CPJoinQuest","GLOBAL",1)~ THEN DO ~SetGlobal("CPBeregostSearch","GLOBAL",1)AddJournalEntry(@10002,QUEST)~ EXIT

// Quest Part 3 beginnt ab hier: Die Suche nach den Entführern in Beregost.
CHAIN
IF ~Global("CPJoinQuest","GLOBAL",1)Global("CPBeregostSearch","GLOBAL",1)~ THEN CPTaldr InitialTalkP3
~Ihr seid schon zurück? Was habt ihr herausgefunden?~
END
++ ~Ich würde Euch gerne noch ein paar Fragen stellen.~ + Questions
++ ~Noch nichts, ich beginne sofort mit der Suche.~ + Endtalk3


CHAIN
IF ~~ THEN CPTaldr Endtalk3
~Wir dürfen ihren Vorsprung nicht noch größer werden lassen! Beeilt Euch!~
EXIT
