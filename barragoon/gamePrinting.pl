gamePrint(Board) :-
	printBlackLine,
	printRowByRow(Board).

printBlackLine :-
	write('----------------------'),
	nl.

printRowByRow([]).
printRowByRow([Line|Rest]) :-
	write('|'),
	printSingleRow(Line),
	printRowByRow(Rest).

printSingleRow([Cell]):-
	write(Cell),
	write('|'),
	nl,
	printBlackLine.

printSingleRow([Cell|More]):-
	write(Cell),
	write('|'),
	printSingleRow(More).

printAside(Aside) :-
	write('Aside='),
	write(Aside),
	nl.

/* ----------------------- */

showResult(Loser):-
	(
	Loser=66, name(X,[87]), write(X)
	;
	Loser=87, name(X,[66]), write(X)
	),
	write(' won! Congrats!'),
	nl.
