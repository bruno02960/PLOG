/**
*	Board printing function
*/
gamePrint(Board) :-
	printRowByRow(Board).

/**
*	Prints row by row
*/
printRowByRow([]).
printRowByRow([Line|Rest]) :-
	printSingleRow(Line),
	printRowByRow(Rest).

/**
*	Prints single row
*/
printSingleRow([Cell]):-
	write(Cell),
	nl.
printSingleRow([Cell|More]):-
	write(Cell),
	printSingleRow(More).
