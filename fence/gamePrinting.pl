printing(Lines, Columns, 7):-
	write(' '),
	nth1(7, Lines, Line),
	replace(1, '-', Line, NewLine),
	replace(0, ' ', NewLine, ParsedLine),
	printSingleRow(ParsedLine).

printing(Lines, Columns, I):-
	write(' '),
	nth1(I, Lines, Line),
	replace(1, '-', Line, NewLine),
	replace(0, ' ', NewLine, ParsedLine),
	printSingleRow(ParsedLine),
	nth1(I, Columns, Column),
	replace(1, '|', Column, NewColumn),
	replace(0, ' ', NewColumn, ParsedColumn),
	printSingleRow(ParsedColumn),
	NewI is I+1,
	printing(Lines, Columns, NewI).

replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- H \= O, replace(O, R, T, T2).

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
