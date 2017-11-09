/**
* Place the Barragoon with the desired symbol in the desired position, if it is free
*/
putBarragoon(InBoard, OutBoard):-
	repeat,
		write('Barragoon: '),
		read(Barragoon),
		barragoon(Barragoon),
		nl,
		write('Line: '),
		read(Nline),
		nl,
		write('Column: '),
		read(Ncolumn),
		nl,
		getPiece(InBoard, Nline, Ncolumn, '  '),
		setPiece(InBoard, Nline, Ncolumn, Barragoon, OutBoard).

putBarragoonPC(Level, InBoard, OutBoard):-
	repeat,

	!
	.
/* ---------------------------------------------------*/
