printing(Lines, _, LineNo):-
	dimensions(NoLines, _),
	LineNo = NoLines,
	nth1(LineNo, Lines, Line),
	replace(1, '---', Line, NewLine),
	replace(0, '   ', NewLine, ParsedLine),
	printSingleLine(ParsedLine).

printing(Lines, Columns, I):-
	nth1(I, Lines, Line),
	replace(1, '---', Line, NewLine),
	replace(0, '   ', NewLine, ParsedLine),
	printSingleLine(ParsedLine),
	nth1(I, Columns, Column),
	replace(1, '|', Column, NewColumn),
	replace(0, ' ', NewColumn, ParsedColumn),
	printSingleColumn(ParsedColumn, I, 1),
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
	printSingleLine(Line),
	printRowByRow(Rest).

/**
*	Prints single line
*/
printSingleLine([Cell]):-
	write('+'),
	write(Cell),
	write('+'),
	nl.
printSingleLine([Cell|More]):-
	write('+'),
	write(Cell),
	printSingleLine(More).


/**
*	Prints single column
*/
printSingleColumn([Cell], _, _):-
	write(Cell),
	nl.
printSingleColumn([Cell|More], I, J):-
	write(Cell),
	(
		cell(Digit, I, J),
		write(' '),
		write(Digit),
		write(' ')
		;
		write('   ')
	),
	NewJ is J + 1,
	printSingleColumn(More, I, NewJ).