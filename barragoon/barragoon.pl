:-include('gamePrinting.pl').
:-include('pieceHandling.pl').
:- use_module(library(lists)).
:- dynamic aside/1.
:- dynamic board/1.
:- dynamic player/1.

board([	['  ','4W','3W','  ','3W','4W','  '],
				['  ','  ','2W','3W','2W','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','no','  ','  ','  ','no','  '],
				['no','  ','no','  ','no','  ','no'],
				['  ','no','  ','  ','  ','no','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','2A','3A','2A','  ','  '],
				['  ','4A','3A','  ','3A','4A','  ']]).

aside(24).

player('W').

changePlayer('W', 'B').
changePlayer('B', 'W').

/* Subtrai duas unidades ao Aside*/
subAside:-
	retract(aside(InAside)),
	OutAside is InAside-2,
	assert(aside(OutAside)).

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

barragoon:-board(Board),gamePrint(Board),nl,aside(Aside),printAside(Aside).

/* ----------------------- */

showResult(Loser):-
	(
	Loser=66, name(X,[87]), write(X)
	;
	Loser=87, name(X,[66]), write(X)
	),
	write(' won! Congrats!'),
	nl.

/* ----------------------- */

getNumber(Piece, Number):-
	name(Piece,[Head|_]),
	name(Number,[Head]).

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

makeMove(Piece, Number):-


askPlay(CurrPlayer, BoardIn, BoardOut):-
	write(CurrPlayer),
	write(' turn'),
	nl,
		repeat,
			write('Select piece:'),
			nl,
			write('Line:'),
			read(Nline),
			nl,
			write('Column:'),
			read(Ncolumn),
			nl,
			getPiece(BoardIn, Nline, Ncolumn, Piece),
			name(Piece,[_|[Color|_]]),
			name(CurrPlayer, [Ascii|_]),
			Ascii=Color,															/* Fail condition */
			getNumber(Piece, Number),
			write(Number).

/*
makesPlay(Player, BoardIn, BoardOut):-
	askPlay(Player, BoardIn, BoardOut),*/

play:-
      board(BoardIn),
			player(PlayerIn),
      assert(board(BoardIn)),             /* stores in the internal Prolog DB */
			assert(player(PlayerIn)),
			repeat,
        retract(board(BoardCurr)),     		/* retrieves from the DB */
				retract(player(PlayerCurr)),
				once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
        assert(board(BoardOut)),
				changePlayer(PlayerCurr, NewPlayer),
				assert(player(NewPlayer)).
        gameOver(BoardIn, Loser),
      	showResult(Loser).
