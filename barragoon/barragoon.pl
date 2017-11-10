/**
* Place the Barragoon with the desired symbol in the desired position, if it is free
*/
putBarragoon(InBoard, OutBoard):-
	repeat,
		nl, write('*** SELECT BARRAOON ***'), nl,
	  prompt(X, 'Barragoon: '),
		read(Barragoon),
	  prompt('Barragoon: ', X),
		barragoon(Barragoon),
		nl,
		write('*** SELECT MOVE ***'),	nl,
		readInteger('Line: ', Nline), nl,
		readInteger('Column: ', Ncolumn), nl,
		getPiece(InBoard, Nline, Ncolumn, '  '),
		setPiece(InBoard, Nline, Ncolumn, Barragoon, OutBoard).

putBarragoonPC(Level, InBoard, OutBoard):-
	repeat,

	!
	.
/* ---------------------------------------------------*/
