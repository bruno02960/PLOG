shortMoveDownFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
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
  getPiece(BoardIn, PieceLine + 3, PieceColumn, '  ')
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
  getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, '  ')
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
    write('HERE1'),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'rt')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'at')
  ),
  getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, '  ')
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
  getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, '  ')
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
  getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, '  ')
).

moveDownFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveLine =:= PieceLine + 4,
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
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 4, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 4, PieceColumn, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 3,
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
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn, 'lt')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn + 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 3,
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
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn, 'rt')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn - 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 2,
  MoveColumn =:= PieceColumn - 2,
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
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 2,
  MoveColumn =:= PieceColumn + 2,
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
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn + 3,
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
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, 'or')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 3, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
    MoveLine =:= PieceLine + 1,
    MoveColumn =:= PieceColumn - 3,
    (
      getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn, 'lt')
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
    (
      getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, 'ol')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, 'th')
    ),
    (
      getPiece(BoardIn, PieceLine + 1, PieceColumn - 3, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn - 3, Piece),
      name(Piece,[_|[Color|_]]),
      name(CurrPlayer, [Ascii|_]),
      Ascii \= Color
    )
).

shortMoveUpFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
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
  getPiece(BoardIn, PieceLine - 3, PieceColumn, '  ')
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
  getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, '  ')
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
  getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, '  ')
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
  getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, Piece)
;

  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 2,
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'lt')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, 'rb')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, 'th')
  ),
  /* Capture piece or barragoon */
  getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, Piece)
).

moveUpFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveLine =:= PieceLine - 4,
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
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 4, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 4, PieceColumn, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 3,
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
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn, 'rb')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn + 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 3,
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
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn, 'lb')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn - 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 2,
  MoveColumn =:= PieceColumn - 2,
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
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, 'ol')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 2,
  MoveColumn =:= PieceColumn + 2,
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
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, 'or')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 3,
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
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, 'or')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 3, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
    MoveLine =:= PieceLine - 1,
    MoveColumn =:= PieceColumn - 3,
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
    (
      getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, '  ')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, 'ol')
      ;
      getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, 'th')
    ),
    (
      getPiece(BoardIn, PieceLine - 1, PieceColumn - 3, '  ')
      ;
      getPiece(BoardIn, PieceLine + 1, PieceColumn - 3, Piece),
      name(Piece,[_|[Color|_]]),
      name(CurrPlayer, [Ascii|_]),
      Ascii \= Color
    )
).

shortMoveRightFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
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
  getPiece(BoardIn, PieceLine, PieceColumn + 3, '  ')
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
  getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, '  ')
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
  getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, '  ')
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
  getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, '  ')
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
  getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, '  ')
).

moveRightFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveColumn =:= PieceColumn + 4,
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
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 3, 'or')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 3, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 4, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 4, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 3,
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
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 3, 'll')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 3, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 3, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn + 3,
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
  (
    getPiece(BoardIn, PieceLine, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 3, 'rl')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn + 3, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 3, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 3, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 2,
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
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 2, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 2,
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
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 2, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 3,
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
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn + 1, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn + 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 3,
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
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn + 1, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn + 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn + 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
).

shortMoveLeftFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
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
  getPiece(BoardIn, PieceLine, PieceColumn - 3, '  ')
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
  getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, '  ')
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
  getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, '  ')
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
  getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, '  ')
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
  getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, '  ')
).

moveLeftFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveColumn =:= PieceColumn - 4,
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
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 3, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 3, 'ol')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 3, 'th')
  ),
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 4, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 4, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 3,
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
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 3, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 3, 'rr')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 3, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 3, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 3, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn - 3,
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
  (
    getPiece(BoardIn, PieceLine, PieceColumn - 3, '  ')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 3, 'lr')
    ;
    getPiece(BoardIn, PieceLine, PieceColumn - 3, 'at')
  ),
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 3, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 3, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 2,
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
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 2, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 2,
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
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, 'ob')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 2, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 2, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 2, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 3,
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
  (
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, 'ot')
    ;
    getPiece(BoardIn, PieceLine + 2, PieceColumn - 1, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine + 3, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 3, PieceColumn - 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 3,
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
  (
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, 'ot')
    ;
    getPiece(BoardIn, PieceLine - 2, PieceColumn - 1, 'tv')
  ),
  (
    getPiece(BoardIn, PieceLine - 3, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 3, PieceColumn - 1, Piece),
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
).

validateFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  moveDownFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveUpFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveRightFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveLeftFour(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveUpFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveDownFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveLeftFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveRightFour(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
),
write('Validated!'), nl.
