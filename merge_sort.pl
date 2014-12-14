%martin braun 1249080

%mydivide and mymerge could be done with accumulators
%instead of this way. this would cost some more time
%to write and would use more space.
%it would be like mydivide(List, LeftAcc, RightAcc, LeftRes, RightRes).
%this could be easier to understand though :P

%because Left and Right are not initialized yet, we can simply
%do the recursive call until they get initialized and on the
%way back all the elements get added.
mydivide([], [], []).
mydivide([A], [A], []).
mydivide([First, Second | Rest], [First | Left], [Second | Right]) :- mydivide(Rest, Left, Right).

%same goes for merging way of doing stuff
%this is 
mymerge([], B, B).
mymerge(A, [], A).
mymerge([FirstLeft|RestLeft], [FirstRight|RestRight], [FirstLeft|Rest]) :-
	FirstLeft =< FirstRight,
	mymerge(RestLeft, [FirstRight|RestRight], Rest).
mymerge([FirstLeft|RestLeft], [FirstRight|RestRight], [FirstRight|Rest]) :-
	FirstLeft > FirstRight,
	mymerge([FirstLeft|RestLeft], RestRight, Rest).

%disable backtracking here to prevent multiple versions of the same result
mymergesort([A], [A]).
mymergesort(List, Result) :-
	mydivide(List, Left, Right),
	mymergesort(Left, LeftRes),
	mymergesort(Right, RightRes),
	mymerge(LeftRes, RightRes, Result),!.