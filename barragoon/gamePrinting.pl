print :-
	board(Board),
	gamePrint(Board), nl,
	aside(Aside),
	printAside(Aside), nl.

gamePrint(Board) :-
	write('    1  2  3  4  5  6  7  '),	nl,
	printBlackLine,
	printRowByRow(1, Board).

printBlackLine :-
	write('  +--+--+--+--+--+--+--+'),
	nl.

printRowByRow(NoLine, []).
printRowByRow(NoLine, [Line|Rest]) :-
	write(NoLine),
	write(' |'),
	printSingleRow(Line),
	NewNoLine is NoLine + 1,
	printRowByRow(NewNoLine, Rest).

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
	write('Aside = '),
	write(Aside),
	nl.

showResult(Loser):-
	(
		Loser=66, name(X,[87]), write(X)
		;
		Loser=87, name(X,[66]), write(X)
	),
	write(' won! Congrats!'),	nl.
