:-include('gamePrinting.pl').
:-include('pieceHandling.pl').

currentBoard([	['  ','4W','3W','  ','3W','4W','  '],
								['  ','  ','2W','3W','2W','  ','  '],
								['  ','  ','  ','  ','  ','  ','  '],
								['  ',no,'  ','  ','  ',no,'  '],
								[no,'  ',no,'  ',no,'  ',no],
								['  ',no,'  ','  ','  ',no,'  '],
								['  ','  ','  ','  ','  ','  ','  '],
								['  ','  ','2B','3B','2B','  ','  '],
								['  ','4B','3B','  ','3B','4B','  ']]).

currentAside(24).

/* Subtrai duas unidades ao Aside - AINDA NÃO GUARDA*/
subAside(InAside, OutAside):-
	OutAside is InAside-2.
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
		/* Handles possible bad input */
		write('Line: '),
		read(Nline),
		nl,
		/* Handles possible bad input */
		write('Column: '),
		read(Ncolumn),
		nl,
		/* Handles possible bad input */
		getPiece(InBoard, Nline, Ncolumn, '  '),
		setPiece(InBoard, Nline, Ncolumn, Barragoon, OutBoard).
/* ---------------------------------------------------*/

barragoon:-currentBoard(Board),gamePrint(Board),nl,currentAside(Aside),printAside(Aside).

/* ----------------------- */
