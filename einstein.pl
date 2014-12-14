%Martin Braun (1249080).
%Idea: get all the different permutations
%and check for correctness. For better performance
%there is also an order in the search order to prevent exploding
%of the searching tree.

pos(1).
pos(2).
pos(3).
pos(4).
pos(5).

	
diff(A,B) :- A\=B.
diff(A,B,C) :- diff(A,B), diff(B,C), A\=C.
diff(A,B,C,D) :- diff(A,B,C), diff(B,C,D), A\=D.
diff(A,B,C,D,E) :- diff(A,B,C,D), diff(B,C,D,E), A\=E.

check(A,B,C,D,E) :- pos(A), pos(B), pos(C), pos(D), pos(E), diff(A,B,C,D,E).

values([english, french, greek, brasilian, spanish, blue, black, green, red, white,
	tea, cacao, coffee, rice, grain, hamburg, manila, marseille, genua, port_said,
	five, six, seven, eight, nine]).

%solutions (from the output) of this formula
%1 french, blue, tea, genua, five
%2 greek, red, coffee, hamburg, six
%3 brasilian, black, cacao, manila, eight
%4 english, white, rice, marseille, nine
%5 spanish, green, grain, port_said, seven
solve(List) :-
	solve(English, French, Greek, Brasilian, Spanish, Blue, Black, Green, Red, White,
	Tea, Cacao, Coffee, Rice, Grain,
	Hamburg, Manila, Marseille, Genua, Port_Said,
	FiveOClock, SixOClock, SevenOClock, EightOClock, NineOClock),
	solve(English, French, Greek, Brasilian, Spanish, Blue, Black, Green, Red, White,
	Tea, Cacao, Coffee, Rice, Grain,
	Hamburg, Manila, Marseille, Genua, Port_Said,
	FiveOClock, SixOClock, SevenOClock, EightOClock, NineOClock)=..[_|List].
 
%first solution is correct, so disable backtracking.
main :- values(Values), write(Values),nl, solve(List), write(List),nl,
	write('Solution: '),nl,
	write('1: '),prt(List, 1, Values),nl,
	write('2: '),prt(List, 2, Values),nl,
	write('3: '),prt(List, 3, Values),nl,
	write('4: '),prt(List, 4, Values),nl,
	write('5: '),prt(List, 5, Values),nl,!.

prt([], Num, []).
prt(List, Num, Values) :- List=[List_First|List_Rest], Values=[Values_First|Values_Rest],
	List_First=:=Num, write(Values_First), write(' '),prt(List_Rest, Num, Values_Rest).
prt(List, Num, Values) :- List=[List_First|List_Rest], Values=[Values_First|Values_Rest],
	List_First\==Num, prt(List_Rest, Num, Values_Rest).
	
solve(English, French, Greek, Brasilian, Spanish,
	Blue, Black, Green, Red, White,
	Tea, Cacao, Coffee, Rice, Grain,
	Hamburg, Manila, Marseille, Genua, Port_Said,
	FiveOClock, SixOClock, SevenOClock, EightOClock, NineOClock) :-
	check(Blue, Black, Green, Red, White),
	Black = 3,
	check(Tea, Cacao, Coffee, Rice, Grain),
	(Grain = 1;Grain = 5),
	abs(Grain-Rice) =:= 1,
	abs(Green-Rice) =:= 1,
	check(English, French, Greek, Brasilian, Spanish),
	French = Blue,
	(French+1) =:= Coffee,
	Greek = Coffee,
	check(Hamburg, Manila, Marseille, Genua, Port_Said),
	(Cacao+1) =:= Marseille,
	Hamburg = Red,
	Brasilian = Manila,
	(Marseille+1) =:= Spanish,
	check(FiveOClock, SixOClock, SevenOClock, EightOClock, NineOClock),
	Greek = SixOClock,
	English = NineOClock,
	Genua = FiveOClock,
	Spanish = SevenOClock,
	abs(White-SevenOClock) =:= 1,
	Black = EightOClock,
	Hamburg = SixOClock.