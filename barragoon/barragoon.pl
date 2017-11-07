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
		getPiece(InBoard, Nline, Ncolumn, '  '),
		setPiece(InBoard, Nline, Ncolumn, Barragoon, OutBoard).

putBarragoonPC(Level, InBoard, OutBoard):-
	repeat,

	!
	.
/* ---------------------------------------------------*/
