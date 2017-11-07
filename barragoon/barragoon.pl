/* ------------------------------------------------*/
barragoon(no).
barragoon(or).
barragoon(ol).
barragoon(ot).
barragoon(ob).
barragoon(th).
barragoon(tv).
barragoon(rr).
barragoon(rl).
barragoon(rt).
barragoon(rb).
barragoon(lr).
barragoon(ll).
barragoon(lt).
barragoon(lb).
barragoon(at).

/* Coloca o barragoon com o símbolo desejado na posição desejada, caso esta esteja livre */
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
<<<<<<< HEAD
		getPiece(InBoard, Nline, Ncolumn, Piece),
		write('PIECE = '), write(Piece), nl,
		Piece = '  ',
		write('UNIFIES'),
		setPiece(InBoard, Nline, Ncolumn, Barragoon, OutBoard),
		write('PIECE SET').
=======
		getPiece(InBoard, Nline, Ncolumn, '  '),
		setPiece(InBoard, Nline, Ncolumn, Barragoon, OutBoard).

putBarragoonPC(Level, InBoard, OutBoard):-
	repeat,
	
	!
	.
>>>>>>> 3199a3c9a80ad2853c655fd9507013b294194f59
/* ---------------------------------------------------*/
