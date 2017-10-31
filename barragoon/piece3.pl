shortMoveDownThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
    /* FINISHED CONDITION */
    MoveLine =:= PieceLine + 2,
    MoveColumn = PieceColumn,
    (
      getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'ob')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'tv')
    ),
    getPiece(BoardIn, PieceLine + 2, PieceColumn, '  ')
;

    /* FINISHED CONDITION */
    MoveLine =:= PieceLine + 1,
    MoveColumn =:= PieceColumn + 1,
    (
      getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'lt')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'at')
    ),
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, '  ')
;

    MoveLine =:= PieceLine + 1,
    MoveColumn =:= PieceColumn - 1,
    (
      getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'rt')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'at')
    ),
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, '  ')
).

moveDownThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveLine =:= PieceLine + 3,
  MoveColumn = PieceColumn,
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'tv')
  ),
  getPiece(BoardIn, PieceLine + 3, PieceColumn, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 3, PieceColumn, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine + 2,
  MoveColumn =:= PieceColumn + 1,
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'lt')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'at')
  ),
  getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine + 2,
  MoveColumn =:= PieceColumn - 1,
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'rt')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'at')
  ),
  write('LINE= '), write(PieceLine + 2), nl,
  write('COLUMN= '), write(PieceColumn - 1), nl,
  getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, Piece),
  write(Piece), nl,
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn - 2,
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'rt')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, 'th')
  ),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn + 2,
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'lt')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, 'th')
  ),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
).

shortMoveUpThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
    /* FINISHED CONDITION */
    MoveLine =:= PieceLine - 2,
    MoveColumn = PieceColumn,
    (
      getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn, 'ot')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn, 'tv')
    ),
    getPiece(BoardIn, PieceLine - 2, PieceColumn, '  ')
;

    /* FINISHED CONDITION */
    MoveLine =:= PieceLine - 1,
    MoveColumn =:= PieceColumn + 1,
    (
      getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn, 'rb')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn, 'at')
    ),
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, '  ')
;

    MoveLine =:= PieceLine - 1,
    MoveColumn =:= PieceColumn - 1,
    (
      getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn, 'lb')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn, 'at')
    ),
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, '  ')
).

moveUpThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveLine =:= PieceLine - 3,
  MoveColumn = PieceColumn,
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'tv')
  ),
  getPiece(BoardIn, PieceLine - 3, PieceColumn, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 3, PieceColumn, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine - 2,
  MoveColumn =:= PieceColumn + 1,
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'rb')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'at')
  ),
  getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine - 2,
  MoveColumn =:= PieceColumn - 1,
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'lb')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'at')
  ),
  getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn - 2,
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'lb')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, 'th')
  ),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;

  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 2,
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'rb')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, 'th')
  ),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
).

shortMoveRightThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
    /* FINISHED CONDITION */
    MoveColumn =:= PieceColumn + 2,
    MoveLine = PieceLine,
    (
      getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn + 1, 'or')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn + 1, 'th')
    ),
    getPiece(BoardIn, PieceLine, PieceColumn + 2, '  ')
;

    /* FINISHED CONDITION */
    MoveLine =:= PieceLine + 1,
    MoveColumn =:= PieceColumn + 1,
    (
      getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn + 1, 'rl')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn + 1, 'at')
    ),
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, '  ')
;
    /* FINISHED CONDITION */
    MoveLine =:= PieceLine - 1,
    MoveColumn =:= PieceColumn + 1,
    (
      getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn + 1, 'll')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn + 1, 'at')
    ),
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, '  ')
).

moveRightThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveColumn =:= PieceColumn + 3,
  MoveLine = PieceLine,
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 2, 'or')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 2, 'th')
  ),
  getPiece(BoardIn, PieceLine, PieceColumn + 3, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine, PieceColumn + 3, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 2,
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 2, 'll')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 2, 'at')
  ),
  getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn + 2,
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 2, 'rl')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 2, 'at')
  ),
  getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine - 2,
  MoveColumn =:= PieceColumn + 1,
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'll')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, 'tv')
  ),
  getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine + 2,
  MoveColumn =:= PieceColumn + 1,
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'rl')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 1, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, 'tv')
  ),
  getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
).


shortMoveLeftThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
    /* FINISHED CONDITION */
    MoveColumn =:= PieceColumn - 2,
    MoveLine = PieceLine,
    (
      getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn - 1, 'ol')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn - 1, 'th')
    ),
    getPiece(BoardIn, PieceLine, PieceColumn - 2, '  ')
;

    /* FINISHED CONDITION */
    MoveLine =:= PieceLine - 1,
    MoveColumn =:= PieceColumn - 1,
    (
      getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn - 1, 'rr')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn - 1, 'at')
    ),
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, '  ')
;
    /* FINISHED CONDITION */
    MoveLine =:= PieceLine + 1,
    MoveColumn =:= PieceColumn - 1,
    (
      getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn - 1, 'lr')
      ;
      getPiece(BoardIn, PieceLine, PieceColumn - 1, 'at')
    ),
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, '  ')
).

moveLeftThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveColumn =:= PieceColumn - 3,
  MoveLine = PieceLine,
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 2, 'ol')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 2, 'th')
  ),
  getPiece(BoardIn, PieceLine, PieceColumn - 3, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine, PieceColumn - 3, Piece),
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn - 2,
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 2, 'rr')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 2, 'at')
  ),
  getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn - 2,
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 2, 'lr')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 2, 'at')
  ),
  getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine - 2,
  MoveColumn =:= PieceColumn - 1,
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'rr')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, 'tv')
  ),
  getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
;
  MoveLine =:= PieceLine + 2,
  MoveColumn =:= PieceColumn - 1,
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'lr')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 1, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, 'tv')
  ),
  getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, '  '),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, Piece),
  Piece \= 'at',
  name(Piece,[_|[Color|_]]),
  name(CurrPlayer, [Ascii|_]),
  Ascii \= Color
).

validateThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  moveDownThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveUpThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveRightThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveLeftThree(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveUpThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveDownThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveLeftThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveRightThree(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
),
write('Validated!'), nl.
