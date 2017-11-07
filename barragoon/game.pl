:- include('gamePrinting.pl').
:- include('pieceHandling.pl').
:- include('barragoon.pl').
:- include('piece2.pl').
:- include('piece3.pl').
:- include('piece4.pl').
:- include('pieceChecking.pl').
:- include('menu.pl').
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

subAside:-
	retract(aside(InAside)),
	OutAside is InAside-2,
	assert(aside(OutAside)).

noPiece(Board, Color) :-
		member(Line, Board),
		member(Piece, Line),
		name(Piece,[_|[Color|_]]),
		!, fail.

noPiece(_,_).

gameOver(Board, Loser):-
	(
	noPiece(Board, 66), Loser=66
	;
	noPiece(Board, 87), Loser=87
	).

readInteger(Prompt,Integer):-
  repeat,
      prompt(X, Prompt),
      read(Integer),
      number(Integer),
			prompt(Prompt, X).

readMove(PieceLine, PieceColumn, MoveLine, MoveColumn):-
	write('*** SELECT PIECE ***'),	nl,
	readInteger('Line: ', PieceLine), nl,
	readInteger('Column: ', PieceColumn), nl,
	nl,
	write('*** SELECT MOVE ***'),	nl,
	readInteger('Line: ', MoveLine), nl,
	readInteger('Column: ', MoveColumn), nl.

validateMove(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
	getPiece(BoardIn, PieceLine, PieceColumn, Piece),
	name(Piece,[_|[Color|_]]),
	name(CurrPlayer, [Color|_]),
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
			nl, write(CurrPlayer), write(' turn'), nl,
			once(readMove(PieceLine, PieceColumn, MoveLine, MoveColumn)),
			validateMove(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn),
			boardUpdate(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn, NewBoard),
			getPiece(BoardIn, MoveLine, MoveColumn, Piece),
			(
				gameOver(NewBoard, Loser),
				showResult(Loser),
				abort
			;
				barragoon(Piece),
				write(CurrPlayer), write(' puts barragoon:'), nl,
				copy_term(NewBoard, NewBoard),
				putBarragoon(NewBoard, Board1),
				copy_term(Board1, BoardOut)
			;
				getColor(Piece, Color),
				Color \= ' ',
				changePlayer(CurrPlayer, NewPlayer),
				write(NewPlayer), write(' puts barragoon:'), nl,
				putBarragoon(NewBoard, Board1),
				write(CurrPlayer), write(' puts barragoon:'), nl,
				putBarragoon(Board1, Board2),
				copy_term(Board2, BoardOut)
			;
				copy_term(NewBoard, BoardOut)
			).

playHvsH:-
      board1(BoardIn),
			player(PlayerIn),
			gameLoopHvsH(BoardIn, PlayerIn).

gameLoopHvsH(BoardCurr, PlayerCurr):-
				gamePrint(BoardCurr),
				once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
				once(changePlayer(PlayerCurr, NewPlayer)),
				gameLoopHvsH(BoardOut, NewPlayer).

playerCPU(PlayerCurr, Level, BoardCurr, BoardOut):-
			(
				PlayerCurr='W',
				repeat,
						print,
						write(CurrPlayer), write(' turn'), nl, nl,
						once(readMove(PieceLine, PieceColumn, MoveLine, MoveColumn)),
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
							putBarragoonPC(Level, NewBoard, BoardOut),
							get_single_char(X)
						;
							!
						)
			;
				PlayerCurr='B',
				print,
				write(CurrPlayer), write(' turn'), nl, nl,
				pcMove(CurrPlayer, Level, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn),
				boardUpdate(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn, BoardOut),
				getPiece(BoardOut, PieceLine, PieceColumn, Piece),
				(
					barragoon(Piece),
					write(CurrPlayer), write(' puts barragoon:'), nl,
					copy_term(BoardOut, NewBoard),
					putBarragoonPC(Level, NewBoard, BoardOut),
					get_single_char(X)
				;
					getColor(Piece, Color),
					Color \= ' ',
					changePlayer(CurrPlayer, NewPlayer),
					write(CurrPlayer), write(' puts barragoon:'), nl,
					putBarragoonPC(Level, NewBoard, BoardOut),
					get_single_char(X),
					write(NewPlayer), write(' puts barragoon:'), nl,
					putBarragoon(BoardOut, NewBoard)
				;
					!
				),
				get_single_char(X)
			;
				!
			).

playHvsCPU(Level):-
			board(BoardIn),
			player(PlayerIn),
			assert(board(BoardIn)),
			assert(player(PlayerIn)),
			repeat,
				retract(board(BoardCurr)),
				retract(player(PlayerCurr)),
				playerCPU(PlayerCurr, Level, BoardCurr, BoardOut),
				changePlayer(PlayerCurr, NewPlayer),
				assert(player(NewPlayer)),
				assert(board(BoardOut)),
				gameOver(BoardIn, Loser),
				showResult(Loser),
				!.

killCPU(CurrPlayer, Level, BoardIn, BoardOut):-
			repeat,
				print,
				write(CurrPlayer), write(' turn'), nl, nl,
				pcMove(CurrPlayer, Level, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn),
				boardUpdate(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn, BoardOut),
				getPiece(BoardOut, PieceLine, PieceColumn, Piece),
				(
					barragoon(Piece),
					write(CurrPlayer), write(' puts barragoon:'), nl,
					copy_term(BoardOut, NewBoard),
					putBarragoonPC(Level, NewBoard, BoardOut),
					get_single_char(X)
				;
					getColor(Piece, Color),
					Color \= ' ',
					changePlayer(CurrPlayer, NewPlayer),
					write(CurrPlayer), write(' puts barragoon:'), nl,
					putBarragoonPC(Level, NewBoard, BoardOut),
					get_single_char(X),
					write(NewPlayer), write(' puts barragoon:'), nl,
					putBarragoonPC(Level, BoardOut, NewBoard),
					get_single_char(X)
			;
				!
			),
			get_single_char(X).

playCPUvsCPU(Level):-
			board(BoardIn),
			player(PlayerIn),
			assert(board(BoardIn)),
			assert(player(PlayerIn)),
			repeat,
				retract(board(BoardCurr)),
				retract(player(PlayerCurr)),
				killCPU(PlayerCurr, Level, BoardCurr, BoardOut),
				changePlayer(PlayerCurr, NewPlayer),
				assert(player(NewPlayer)),
				assert(board(BoardOut)),
				gameOver(BoardIn, Loser),
				showResult(Loser),
				!.
