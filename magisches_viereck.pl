%Martin Braun (1249080)
%File: ki_uebung_10_martin_braun_1249080.pro
%Magisches Viereck solver.
%Um alles auszugeben, einfach
%? - print. ausführen.

%Fakten
istZiffer(1).
istZiffer(2).
istZiffer(3).
istZiffer(4).
istZiffer(5).
istZiffer(6).
istZiffer(7).
istZiffer(8).
istZiffer(9).

%Regeln
alleVerschieden([First|Rest]) :- alleVerschieden(First, Rest).
alleVerschieden(Cur, List) :- 
	List=[First|Rest],not(member(Cur, List)),
	alleVerschieden(First, Rest).
alleVerschieden(Cur, []).

isFifteen(X,Y,Z) :- (X + Y + Z) =:= 15.

%Ziele
magischesQuadrat(A, B, C, D, E, F, G, H, I) :-
	istZiffer(A),
	istZiffer(B),
	istZiffer(C),
	isFifteen(A,B,C),
	
	istZiffer(D),
	istZiffer(E),
	istZiffer(F),
	isFifteen(D,E,F),
	
	istZiffer(G),
	isFifteen(A,D,G),
	isFifteen(C,E,G),
	
	istZiffer(H),
	isFifteen(B,E,H),
	
	istZiffer(I),
	isFifteen(C,F,I),
	isFifteen(G,H,I),
	isFifteen(A,E,I),
	
	%Liste zusammenbauen
	List = [A,B,C,D,E,F,G,H,I],
	alleVerschieden(List),
	write(List),
	nl.

print :- write('All Solutions are:'),nl,
	magischesQuadrat(A, B, C, D, E, F, G, H, I), fail; true.