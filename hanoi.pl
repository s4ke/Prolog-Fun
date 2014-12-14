%Martin Braun (1249080) Übung 11 KI
isValid(red).
isValid(green).
isValid(yellow).
isValid(blue).
val(red, 1).
val(green, 2).
val(yellow, 3).
val(blue, 4).

smaller(X,Y) :- isValid(X),isValid(Y),
 val(X, ValX), val(Y, ValY), ValX < ValY.

reverseList(List, Result) :- reverseList(List, [], Result).
reverseList([], X, X).
reverseList([First|Rest], Acc, Result) :-
	reverseList(Rest, [First|Acc], Result).

move([FirstFrom|Rest], [], Rest, [FirstFrom]).
move([FirstFrom|Rest], [FirstTo|RestTo], Rest, [FirstFrom,FirstTo|RestTo]) :-
  smaller(FirstFrom, FirstTo).

solveHanoi :- hanoi([red, green, yellow, blue], [], [], [], Path),
	reverseList(Path, CorrectPath),
	write(CorrectPath),nl.

hanoi([], [], _, Path, Path).
hanoi(Left, Mid, Right, Path, Res) :-

	move(Left, Right, NewLeft, NewRight),
	NewElem = [NewLeft, Mid, NewRight],
	not(member(NewElem, Path)),
	hanoi(NewLeft, Mid, NewRight, [NewElem|Path], Res);
	
	move(Left, Mid, NewLeft, NewMid),
	NewElem = [NewLeft, NewMid, Right],
	not(member(NewElem, Path)),
	hanoi(NewLeft, NewMid, Right, [NewElem|Path], Res);
	
	move(Mid, Right, NewMid, NewRight),
	NewElem = [Left, NewMid, NewRight],
	not(member(NewElem, Path)),
	hanoi(Left, NewMid, NewRight, [NewElem|Path], Res);
	
	move(Mid, Left, NewMid, NewLeft),
	NewElem = [NewLeft, NewMid, Right],
	not(member(NewElem, Path)),
	hanoi(NewLeft, NewMid, Right, [NewElem|Path], Res);
	
	move(Right, Mid, NewRight, NewMid),
	NewElem = [Left, NewMid, NewRight],
	not(member(NewElem, Path)),
	hanoi(Left, NewMid, NewRight, [NewElem|Path], Res);
	
	move(Right, Left, NewRight, NewLeft),
	NewElem = [NewLeft, Mid, NewRight],
	not(member(NewElem, Path)),
	hanoi(NewLeft, Mid, NewRight, [NewElem|Path], Res).
	
killEverySecond([], []).
killEverySecond(List, Result) :- uneven(List, [], Result).

uneven([], [X], [X]).
uneven([First|Rest], _, [First|Result]) :-
 even(Rest, [First], Result).
 
even([], [X], []).
even([First|Rest], _, Result) :-
 uneven(Rest, [First], Result).