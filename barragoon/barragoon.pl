:-include('gamePrinting.pl').
:-include('pieceHandling.pl').
:- use_module(library(lists)).
:- dynamic currentAside/1.

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

/* Subtrai duas unidades ao Aside*/
subAside:-
	retract(currentAside(InAside)),
	OutAside is InAside-2,
	assert(currentAside(OutAside)).

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
/* ---------------------------------------------------*/

barragoon:-currentBoard(Board),gamePrint(Board),nl,currentAside(Aside),printAside(Aside).

/* ----------------------- */

round:-
	assert(currentAside(X)),
	retract(currentAside(X)),
	subAside(X,Y),
	assert(currentAside(Y)).

/* ----------------------- */

showResult(Player):-
	write(Player),
	write(' won! Congrats!'),
	nl.

/* ----------------------- */

noPiece(Board, Color) :-
		member(Line, Board),
		member(Piece, Line),
		name(Piece,[_|[Color|_]]),
		!, fail.

noPiece(_,_).

/* By using name(?Atomic, ?CodeList) we can retrieve ascii code list and,
therefore, piece's player and value */

gameOver(Board, Loser):-
	(
	noPiece(Board, 66), Loser=66
	;
	noPiece(Board, 87), Loser=87
	).

/*Checks if all pieces in game have or only W or only B */
