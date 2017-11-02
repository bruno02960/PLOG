shortMoveTwo(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
  (
    
    MoveLine =:= PieceLine + 1,
    MoveColumn = PieceColumn,
    getPiece(BoardIn, PieceLine + 1, PieceColumn, '  ')
  ;
    
    MoveLine =:= PieceLine - 1,
    MoveColumn = PieceColumn,
    getPiece(BoardIn, PieceLine - 1, PieceColumn, '  ')
  ;
    
    MoveColumn =:= PieceColumn - 1,
    MoveLine = PieceLine,
    getPiece(BoardIn, PieceLine, PieceColumn - 1, '  ')
  ;
    
    MoveColumn =:= PieceColumn + 1,
    MoveLine = PieceLine,
    getPiece(BoardIn, PieceLine, PieceColumn + 1, '  ')
  ).

moveDownTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveLine =:= PieceLine + 2,
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
    getPiece(BoardIn, PieceLine + 2, PieceColumn, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 1,
  MoveColumn =:= PieceColumn + 1,
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
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
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
  (
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
).

moveUpTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveLine =:= PieceLine - 2,
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
    getPiece(BoardIn, PieceLine - 2, PieceColumn, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
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
  (
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, '  ')
    ;
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 1,
  MoveColumn =:= PieceColumn + 1,
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
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
).

moveRightTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveColumn =:= PieceColumn + 2,
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
    getPiece(BoardIn, PieceLine, PieceColumn + 2, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 1,
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
    getPiece(BoardIn, PieceLine + 1, PieceColumn + 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 1,
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
    getPiece(BoardIn, PieceLine - 1, PieceColumn + 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
).

moveLeftTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  MoveColumn =:= PieceColumn - 2,
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
    getPiece(BoardIn, PieceLine, PieceColumn - 2, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine - 1,
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
    getPiece(BoardIn, PieceLine - 1, PieceColumn - 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
;
  MoveLine =:= PieceLine + 1,
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
    getPiece(BoardIn, PieceLine + 1, PieceColumn - 1, Piece),
    Piece \= 'at',
    name(Piece,[_|[Color|_]]),
    name(CurrPlayer, [Ascii|_]),
    Ascii \= Color
  )
).

validateTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn):-
(
  moveDownTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveUpTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveRightTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  moveLeftTwo(CurrPlayer, BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
;
  shortMoveTwo(BoardIn, PieceLine, PieceColumn, MoveLine, MoveColumn)
),
write('Validated!'), nl.
