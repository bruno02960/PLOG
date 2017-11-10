:- include('gamePrinting.pl').
:- include('pieceHandling.pl').
:- include('barragoon.pl').
:- include('piece2.pl').
:- include('piece3.pl').
:- include('piece4.pl').
:- include('pieceChecking.pl').
:- include('defs.pl').
:- include('menu.pl').
:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(system)).
:- dynamic board/1.
:- dynamic player/1.

/**
* Initial board
*/
initialBoard([	['  ','4W','3W','  ','3W','4W','  '],
				['  ','  ','2W','3W','2W','  ','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','no','  ','  ','  ','no','  '],
				['no','  ','no','  ','no','  ','no'],
				['  ','no','  ','  ','  ','no','  '],
				['  ','  ','  ','  ','  ','  ','  '],
				['  ','  ','2B','3B','2B','  ','  '],
				['  ','4B','3B','  ','3B','4B','  ']]).

/**
* Initial player
*/
initialPlayer('W').

/**
* Changes between players
*/
changePlayer('W', 'B').
changePlayer('B', 'W').

/**
* Checks if there are pieces of a given color on board
*/
noPiece(Board, Color) :-
		member(Line, Board),
		member(Piece, Line),
		name(Piece,[_|[Color|_]]),
		!, fail.
noPiece(_,_).

/**
* Game over condition checking
*/
gameOver(Board, Loser):-
	(
	noPiece(Board, 66), Loser=66
	;
	noPiece(Board, 87), Loser=87
	).

/**
* Reads an integer number, with a given prompt
*/
readInteger(Prompt,Integer):-
  repeat,
      prompt(X, Prompt),
      read(Integer),
      number(Integer),
			prompt(Prompt, X).

/**
* Read player move
*/
readMove(PieceLine, PieceColumn, MoveLine, MoveColumn):-
	nl,
  write('*** SELECT PIECE ***'),	nl,
	readInteger('Line: ', PieceLine), nl,
	readInteger('Column: ', PieceColumn), nl,
	nl,
	write('*** SELECT MOVE ***'),	nl,
	readInteger('Line: ', MoveLine), nl,
	readInteger('Column: ', MoveColumn), nl.

/**
* Move a piece from given coordinates to other given coordinates
*/
movePiece(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn, OutBoard):-
	line(PieceLine),
	col(PieceColumn),
	line(MoveLine),
	col(MoveColumn),
	getPiece(BoardIn, PieceLine, PieceColumn, Piece),
	piece(Piece),
	name(Piece,[_|[Color|_]]),
	name(CurrPlayer, [Color|_]),
	getNumber(Piece, Number),
	(
		Number=2, validateTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
	;
		Number=3, validateThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
	;
		Number=4, validateFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
	),
	getPiece(BoardIn, PieceLine, PieceColumn, Piece),
	setPiece(BoardIn, PieceLine, PieceColumn, '  ', NewBoard),
	setPiece(NewBoard, MoveLine, MoveColumn, Piece, OutBoard).

/**
* Ask and validate human player play
*/
askPlay(CurrPlayer, BoardIn, BoardOut):-
    findall(XBoard, A^B^C^D^movePiece(CurrPlayer, BoardIn, A, B, C, D, XBoard), PossiblePlays),
    (
    PossiblePlays \= []
    ;
    changePlayer(CurrPlayer, NewPlayer),
    gamePrint(BoardIn), nl,
    write(NewPlayer), write(' won!'),
    abort
    ),
    gamePrint(BoardIn),
	repeat,
			nl, write(CurrPlayer), write(' turn'), nl,
			once(readMove(PieceLine, PieceColumn, MoveLine, MoveColumn)),
			movePiece(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn, NewBoard),
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

setBarragoon(BoardIn, Line, Column, BoardOut):-
    line(Line),
    col(Column),
    random_permutation([no,or,ol,ot,ob,th,tv,rr,rl,rt,rb,lr,ll,lt,lb,at], [Barragoon|_]),
		getPiece(BoardIn, Line, Column, '  '),
		setPiece(BoardIn, Line, Column, Barragoon, BoardOut).

putBarragoonRandom(BoardIn, BoardOut):-
    now(X),
    setrand(X),
    findall(XBoard, A^B^setBarragoon(BoardIn, A, B, XBoard), Boards),
    random_permutation(Boards, [BoardOut|_]).


playCPUvsHrandom(CurrPlayer, BoardIn, BoardOut):-
    findall(XBoard-C-D, A^B^C^D^movePiece(CurrPlayer, BoardIn, A, B, C, D, XBoard), PossiblePlays),
    random_permutation(PossiblePlays, [NewBoard-MoveLine-MoveColumn|_]),
    getPiece(BoardIn, MoveLine, MoveColumn, Piece),
    (
      gameOver(NewBoard, Loser),
      showResult(Loser),
      abort
    ;
      barragoon(Piece),
      putBarragoonRandom(NewBoard, Board1),
      copy_term(Board1, BoardOut)
    ;
      getColor(Piece, Color),
      Color \= ' ',
      changePlayer(CurrPlayer, NewPlayer),
      (
      CurrPlayer = 'W',
      putBarragoonRandom(NewBoard, Board1),
      write(CurrPlayer), write(' puts barragoon:'), nl,
      putBarragoon(Board1, Board2),
      copy_term(Board2, BoardOut)
      ;
      CurrPlayer = 'B',
      write(NewPlayer), write(' puts barragoon:'), nl,
      putBarragoon(NewBoard, Board1),
      putBarragoonRandom(Board1, Board2),
      copy_term(Board2, BoardOut)
      )
    ;
      copy_term(NewBoard, BoardOut)
    ).

playCPUvsCPUrandom(CurrPlayer, BoardIn, BoardOut):-
		gamePrint(BoardIn),
		nl, write(CurrPlayer), write(' turn'), nl,
    findall(XBoard-C-D, A^B^C^D^movePiece(CurrPlayer, BoardIn, A, B, C, D, XBoard), PossiblePlays),
		random_permutation(PossiblePlays, [NewBoard-MoveLine-MoveColumn|_]),
    getPiece(BoardIn, MoveLine, MoveColumn, Piece),
    (
      gameOver(NewBoard, Loser),
      showResult(Loser),
      abort
    ;
      barragoon(Piece),
      putBarragoonRandom(NewBoard, Board1),
      copy_term(Board1, BoardOut)
    ;
      getColor(Piece, Color),
      Color \= ' ',
      putBarragoonRandom(NewBoard, Board1),
      putBarragoonRandom(Board1, Board2),
      copy_term(Board2, BoardOut)
    ;
      copy_term(NewBoard, BoardOut)
    ),
		read(X).


/**
* Human vs human game mode
*/
/*playHvsH:-
      initialBoard(BoardIn),
			player(PlayerIn),
			gameLoopHvsH(BoardIn, PlayerIn).

gameLoopHvsH(BoardCurr, PlayerCurr):-
      nl,
  		once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
  		once(changePlayer(PlayerCurr, NewPlayer)),
  		gameLoopHvsH(BoardOut, NewPlayer).*/

playHvsH:-
	initialBoard(BoardIn),
	initialPlayer(PlayerIn),
	assert(board(BoardIn)),
	assert(player(PlayerIn)),
	repeat,
		retract(board(BoardCurr)),
		retract(player(PlayerCurr)),
		once(askPlay(PlayerCurr,BoardCurr, BoardOut)),
		once(changePlayer(PlayerCurr, NewPlayer)),
		assert(player(NewPlayer)),
		assert(board(BoardOut)),
		gameOver(BoardOut, Loser),
		showResult(Loser),
	!.

playRandomCPUvsCPU:-
	initialBoard(BoardIn),
	initialPlayer(PlayerIn),
	assert(board(BoardIn)),
	assert(player(PlayerIn)),
	repeat,
		retract(board(BoardCurr)),
		retract(player(PlayerCurr)),
		once(playCPUvsCPUrandom(PlayerCurr,BoardCurr, BoardOut)),
		once(changePlayer(PlayerCurr, NewPlayer)),
		assert(player(NewPlayer)),
		assert(board(BoardOut)),
		gameOver(BoardOut, Loser),
		showResult(Loser),
	!.

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
