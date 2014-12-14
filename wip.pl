%Martin Braun (1249080)
%Wahl der Programmiersprache: Prolog muss geübt werden :).
%Abgesehen davon führt Prolog automatisch eine Suche durch, die man
%in einer anderen Sprache erst mühevoll programmieren muss.
%Bemerkung: Grenzen bei Alternativen in Prolog Statements:
%	wenn sich zwei Alternativen gegenseitig aufheben (move_to_small und move_to_big)
%	und diese direkt hintereinander kommen, kommt es zu einer Endlosschleife.
%	Daher werden hier nur Operationen benutzt, die auch wirklich zum finden
%	der Lösung benötigt werden.
serve(Small, Big) :- write(big),write(' '),write(Big),nl,write(small),write(' '),write(Small),nl,
	(Big =:= 400);
	((Small =:= 300) -> write(kill_small),nl,serve(0, Big));
	%Big to Small
	(Move is 300 - Small,
		Small < 300, Big > 0 -> (write(move_to_small),nl,
		(Big > Move) -> Left is Big - Move, serve(300, Left);
		(Big =< Move) -> NewSmall is Small + Big, 
			(serve(NewSmall, 0); serve(NewSmall, 500))));
	serve(Small, 500).
	
main :- serve(0, 500).