playCPUvsHrandom(CurrPlayer, BoardIn, BoardOut):-
		nl, write(CurrPlayer), write(' turn'), nl, nl,
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

playRandomCPUvsH:-
initialBoard(BoardIn),
initialPlayer(PlayerIn),
assert(board(BoardIn)),
assert(player(PlayerIn)),
repeat,
  retract(board(BoardCurr)),
  retract(player(PlayerCurr)),
  once(askPlay(PlayerCurr,BoardCurr, NewBoard)),
  once(changePlayer(PlayerCurr, NewPlayer)),
  once(playCPUvsHrandom(NewPlayer, NewBoard, BoardOut)),
  once(changePlayer(NewPlayer, PlayerCurr)),
  assert(player(PlayerCurr)),
  assert(board(BoardOut)),
  gameOver(BoardIn, Loser),
  showResult(Loser),
!.
