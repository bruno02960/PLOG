gamePrint(Board) :-
	printBlackLine,
	printRowByRow(Board).

printBlackLine :-
	write('------------------------------------'),
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