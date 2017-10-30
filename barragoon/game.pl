:- include('gamePrinting.pl').
:- include('pieceHandling.pl').
:- include('barragoon.pl').
:- use_module(library(lists)).
:- dynamic aside/1.
:- dynamic board/1.
:- dynamic player/1.

board([	['  ','3W','3W','  ','3W','4W','  '],
				['  ','  ','2W','3W','2W','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','no','  ','  ','  ','no','  '],
				['no','  ','no','  ','no','  ','no'],
				['  ','no','  ','  ','  ','no','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','2B','3B','2B','  ','  '],
				['  ','4B','3B','  ','3B','4B','  ']]).

cleanBoard([	['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','  ','  ','  ','  ','  ']]).

aside(24).

player('W').

changePlayer('W', 'B').
changePlayer('B', 'W').

/* Subtrai duas unidades ao Aside*/
subAside:-
	retract(aside(InAside)),
	OutAside is InAside-2,
	assert(aside(OutAside)).

print:-board(Board),gamePrint(Board),nl,aside(Aside),printAside(Aside).

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

evaluateDown(BoardIn, BoardOut, Available, Nline, Ncolumn, Turned):-
	getPiece(BoardIn, Nline, Ncolumn, Piece),
	nl,
	(
/*	write('2 - Available= '),	write(Available), nl,*/
	Available = 1, Piece = '  ', /*write('2'), nl,*/
	write('Nline= '),
	write(Nline), nl,
	write('Ncolumn= '),
	write(Ncolumn), nl,
	setPiece(BoardIn, Nline, Ncolumn, 'F', BoardOut),
	gamePrint(BoardOut), nl,
	searchMoves(BoardOut, BoardOut, Available, Nline, Ncolumn, Turned, 'down')
	;
	/*write('3 - Available= '),	write(Available), nl,*/
	Available = 0, player(X), getColor(Piece, ColorPi),
		(X\=ColorPi, ColorPi\=' ',
		setPiece(BoardIn, Nline, Ncolumn, 'C', BoardOut)
		;
		Piece = '  ', /*write('3'), nl,*/
	/*	gamePrint(BoardIn),*/
		setPiece(BoardIn, Nline, Ncolumn, 'F', BoardOut)
		)
	;
	/*write('1 - Available= '),	write(Available), nl,*/
	Available > 0, Piece = '  ', /*write('1'), nl,*/
	searchMoves(BoardIn, BoardOut, Available, Nline, Ncolumn, Turned, 'down')
	).

searchMoves(BoardIn, BoardOut, Available, Nline, Ncolumn, Turned, From) :-
	/*write('BoardIn: '), nl,*/
	NewAvailable is Available - 1,
	/*write(Nline),*/
	(
	Nline < 8, NewNline is Nline + 1,
	evaluateDown(BoardIn, BoardOut, NewAvailable, NewNline, Ncolumn, Turned)
	/*;
	Nline < 8, NewNline is Nline - 1,	evaluateUp(BoardIn, BoardOut, NewAvailable, NewNline, Ncolumn, Turned)
	;
	Ncolumn > 1, NewNcolumn is Ncolumn - 1,	evaluateLeft(BoardIn, BoardOut, NewAvailable, Nline, NewNcolumn, Turned)
	;
	Ncolumn < 8, NewNcolumn is Ncolumn + 1,	evaluateRight(BoardIn, BoardOut, NewAvailable, Nline, NewNcolumn, Turned)*/
	).

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
			searchMoves(BoardIn, BoardOut, Number, Nline, Ncolumn, '0', 'null'),
			gamePrint(BoardOut).

play:-
      board(BoardIn),
			player(PlayerIn),
      assert(board(BoardIn)),             /* stores in the internal Prolog DB */
			assert(player(PlayerIn)),
			repeat,
        retract(board(BoardCurr)),     		/* retrieves from the DB */
				retract(player(PlayerCurr)),
				/*cleanBoard(BoardOut),*/
				once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
				changePlayer(PlayerCurr, NewPlayer),
				assert(player(NewPlayer)),
        assert(board(BoardIn)),						/* Change later to boardOut */
        gameOver(BoardIn, Loser),
      	showResult(Loser),
			!.
