:- include('gamePrinting.pl').
:- include('pieceHandling.pl').
:- include('barragoon.pl').
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
				['  ','  ','2B','3B','2B','  ','  '],
				['  ','4B','3B','  ','3B','4B','  ']]).

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
			write(Ascii),
			nl,
			write(Color),
			nl,
			Ascii=Color,															/* Fail condition */
			getNumber(Piece, Number).

play:-
      board(BoardIn),
			player(PlayerIn),
      assert(board(BoardIn)),             /* stores in the internal Prolog DB */
			assert(player(PlayerIn)),
			repeat,
				write('HERE'),
				nl,
        retract(board(BoardCurr)),     		/* retrieves from the DB */
				retract(player(PlayerCurr)),
				once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
        assert(board(BoardIn)),						/* Change later to boardOut */
				changePlayer(PlayerCurr, NewPlayer),
				assert(player(NewPlayer)),
        gameOver(BoardIn, Loser),
      	showResult(Loser).
