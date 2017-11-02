:- include('gamePrinting.pl').
:- include('pieceHandling.pl').
:- include('barragoon.pl').
:- include('piece2.pl').
:- include('piece3.pl').
:- include('piece4.pl').
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

readMove(PieceLine, PieceColumn, MoveLine, MoveColumn):-
	write('Select piece:'),	nl,
	write('Line:'),	read(PieceLine), nl,
	write('Column:'),	read(PieceColumn), nl,
	write('--------------'), nl,
	write('Select where to move:'),	nl,
	write('Line:'),	read(MoveLine), nl,
	write('Column:'),	read(MoveColumn), nl.

validateMove(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
	getPiece(BoardIn, PieceLine, PieceColumn, Piece),
	name(Piece,[_|[Color|_]]),
	name(CurrPlayer, [Color|_]),							/* Fail condition */
	getNumber(Piece, Number),
	(
		Number=2, validateTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
	;
		Number=3, validateThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
	;
		Number=4, validateFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
	).

boardUpdate(InBoard, PieceLine, PieceColumn, MoveLine, MoveColumn, OutBoard):-
	getPiece(InBoard, PieceLine, PieceColumn, Piece),
	setPiece(InBoard, PieceLine, PieceColumn, '  ', NewBoard),
	setPiece(NewBoard, MoveLine, MoveColumn, Piece, OutBoard).

askPlay(CurrPlayer, BoardIn, BoardOut):-
	repeat,
			print,
			write(CurrPlayer), write(' turn'), nl,	/* Says who's next playing */
			readMove(PieceLine, PieceColumn, MoveLine, MoveColumn),
			validateMove(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn),
			boardUpdate(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn, BoardOut),
			getPiece(BoardOut, PieceLine, PieceColumn, Piece),
			(
				barragoon(Piece),
				write(CurrPlayer), write(' puts barragoon:'), nl,
				copy_term(BoardOut, NewBoard),
				putBarragoon(NewBoard, BoardOut)
			;
				getColor(Piece, Color),
				Color \= ' ',
				changePlayer(CurrPlayer, NewPlayer),
				write(NewPlayer), write(' puts barragoon:'), nl,
				putBarragoon(BoardOut, NewBoard),
				write(CurrPlayer), write(' puts barragoon:'), nl,
				putBarragoon(NewBoard, BoardOut)
			;
				!
			).

			/*getNumber(Piece, Number),
			searchMoves(BoardIn, BoardOut, Number, Nline, Ncolumn, '0', 'null'),
			gamePrint(BoardOut).*/

playHvsH:-
      board(BoardIn),
			player(PlayerIn),
      assert(board(BoardIn)),             /* stores in the internal Prolog DB */
			assert(player(PlayerIn)),
			repeat,
        retract(board(BoardCurr)),     		/* retrieves from the DB */
				retract(player(PlayerCurr)),
				/*cleanBoard(BoardOut),*/
				once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
				once(changePlayer(PlayerCurr, NewPlayer)),
				assert(player(NewPlayer)),
        assert(board(BoardOut)),						/* Change later to boardOut */
				/*write(BoardOut),*/
				/*print,*/
        gameOver(BoardIn, Loser),
      	showResult(Loser),
			!.
