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
  get_code(X).

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
