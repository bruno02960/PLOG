gamePrint(Board, Type) :-
	printBlackLine(Type),
	printRowByRow(Board,Type).

printBlackLine(board) :-
	write('-------------------------------------------'),
	nl.

printBlackLine(aside) :-
	write('--------------------------------------------------------------------------'),
	nl.

printRowByRow([], Type).
printRowByRow([Line|Rest],Type) :-
	write('|'),
	printSingleRow(Line, Type),
	printRowByRow(Rest, Type).

printSingleRow([Cell],Type):-
	write(Cell),
	write('|'),
	nl,
	printBlackLine(Type).

printSingleRow([Cell|More], Type):-
	write(Cell),
	write('|'),
	printSingleRow(More, Type).