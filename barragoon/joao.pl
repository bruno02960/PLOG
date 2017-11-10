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
