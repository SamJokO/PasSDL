unit SDL.rect;

interface

uses
  SDL.Types,
  SDL.stdinc;

type
  TSDL_Point = record
    x                           : int;
    y                           : int;
  end;
  PSDL_Point = ^TSDL_Point;

  TSDL_FPoint = record
    x                           : float;
    y                           : float;
  end;
  PSDL_FPoint = ^TSDL_FPoint;

  TSDL_Rect = record
    x, y                        : int;
    w, h                        : int;
  end;
  PSDL_Rect = ^TSDL_Rect;

  TSDL_FRect = record
    x                           : float;
    y                           : float;
    w                           : float;
    h                           : float;
  end;
  PSDL_FRect = ^TSDL_FRect;

  procedure SDL_RectToFRect(const Arect: PSDL_Rect; Afrect: PSDL_FRect); inline;
  function SDL_PointInRect(const Ap: PSDL_Point; const Ar: PSDL_Rect): bool; inline;
  function SDL_RectEmpty(const Ar: PSDL_Rect): bool; inline;
  function SDL_RectsEqual(const Aa: PSDL_Rect; const Ab: PSDL_Rect): bool; inline;

type
  /// <summary>
  ///  Determine whether two rectangles intersect.
  /// </summary>
  TSDL_HasRectIntersection    = function (const Aa: PSDL_Rect; const Ab: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Calculate the intersection of two rectangles.
  /// </summary>
  TSDL_GetRectIntersection    = function (const Aa: PSDL_Rect; const Ab: PSDL_Rect; var Aresult: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Calculate the union of two rectangles.
  /// </summary>
  TSDL_GetRectUnion           = function (const Aa: PSDL_Rect; const Ab: PSDL_Rect; var Aresult: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Calculate a minimal rectangle enclosing a set of points.
  /// </summary>
  TSDL_GetRectEnclosingPoints = function (const Apoints: PSDL_Point; const Aclip: PSDL_Rect; var Aresult: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Calculate the intersection of a rectangle and line segment.
  /// </summary>
  TSDL_GetRectAndLineIntersection
                              = function (const Arect: PSDL_Rect; AX1: Pint; AY1: Pint; AX2: Pint; AY2: Pint): bool; cdecl;

  function SDL_PointInRectFloat(const Ap: PSDL_FPoint; const Ar: PSDL_FRect): bool; inline;
  function SDL_RectEmptyFloat(const Ar: PSDL_FRect): bool; inline;
  function SDL_RectsEqualEpsilon(const Aa: PSDL_FRect; const Ab: PSDL_FRect; const Aepsilon: float): bool; inline;
  function SDL_RectsEqualFloat(const Aa: PSDL_FRect; const Ab: PSDL_FRect): bool; inline;

type
  /// <summary>
  ///  Determine whether two rectangles intersect with float precision.
  /// </summary>
  TSDL_HasRectIntersectionFloat
                              = function (const Aa: PSDL_FRect; const Ab: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Calculate the intersection of two rectangles with float precision.
  /// </summary>
  TSDL_GetRectIntersectionFloat
                              = function (const Aa: PSDL_FRect; const Ab: PSDL_FRect; var Aresult: TSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Calculate the union of two rectangles with float precision.
  /// </summary>
  TSDL_GetRectUnionFloat      = function (const Aa: PSDL_FRect; const Ab: PSDL_FRect; var Aresult: TSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Calculate a minimal rectangle enclosing a set of points with float
  /// </summary>
  TSDL_GetRectEnclosingPointsFloat
                              = function (const Apoints: PSDL_FPoint; Acount: int; const Aclip: PSDL_FRect; var Aresult: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Calculate the intersection of a rectangle and line segment with float
  /// </summary>
  TSDL_GetRectAndLineIntersectionFloat
                              = function (const Arect: PSDL_FRect; AX1: Pfloat; AY1: Pfloat; AX2: Pfloat; AY2: Pfloat): bool; cdecl;

var
  SDL_HasRectIntersection     : TSDL_HasRectIntersection;
  SDL_GetRectIntersection     : TSDL_GetRectIntersection;
  SDL_GetRectUnion            : TSDL_GetRectUnion;
  SDL_GetRectEnclosingPoints  : TSDL_GetRectEnclosingPoints;
  SDL_GetRectAndLineIntersection
                              : TSDL_GetRectAndLineIntersection;
  SDL_HasRectIntersectionFloat
                              : TSDL_HasRectIntersectionFloat;
  SDL_GetRectIntersectionFloat
                              : TSDL_GetRectIntersectionFloat;
  SDL_GetRectUnionFloat       : TSDL_GetRectUnionFloat;
  SDL_GetRectEnclosingPointsFloat
                              : TSDL_GetRectEnclosingPointsFloat;
  SDL_GetRectAndLineIntersectionFloat
                              : TSDL_GetRectAndLineIntersectionFloat;


procedure InitLibrary(const AHandle: THandle);

implementation

procedure SDL_RectToFRect(const Arect: PSDL_Rect; Afrect: PSDL_FRect);
begin
  Afrect^.x                   := Arect^.x;
  Afrect^.y                   := Arect^.y;
  Afrect^.w                   := Arect^.w;
  Afrect^.h                   := Arect^.h;
end;

function SDL_PointInRect(const Ap: PSDL_Point; const Ar: PSDL_Rect): bool;
begin
  Result                      := False;

  if (Ap <> nil) and (Ar <> nil) then
  begin
    if (Ap^.x >= Ar^.x) and (Ap^.x < (Ar^.x + Ar^.w)) then
    begin
      if (Ap^.y >= Ar^.y) and (Ap^.y < (Ar^.y + Ar^.h)) then
        Exit(True);
    end;
  end;
end;

function SDL_RectEmpty(const Ar: PSDL_Rect): bool;
begin
  Result                      := True;

  if (Ar <> nil) then
  begin
    if (Ar^.w > 0) and (Ar^.h > 0) then
      Exit(False);
  end;
end;

function SDL_RectsEqual(const Aa: PSDL_Rect; const Ab: PSDL_Rect): bool;
begin
  Result                      := False;
  if (Aa <> nil) and (Ab <> nil) then
  begin
    if (Aa^.x = Ab^.x) and (Aa^.y = Ab^.y) and (Aa^.w = Ab^.w) and (Aa^.h = Ab^.h) then
      Exit(True);
  end;
end;

function SDL_PointInRectFloat(const Ap: PSDL_FPoint; const Ar: PSDL_FRect): bool;
begin
  Result                      := False;

  if (Ap <> nil) and (Ar <> nil) then
  begin
    if (Ap^.x >= Ar^.x) and (Ap^.x <= (Ar^.x + Ar^.w)) then
    begin
      if (Ap^.y >= Ar^.y) and (Ap^.y <= (Ar^.y + Ar^.h)) then
        Exit(True);
    end;
  end;
end;

function SDL_RectEmptyFloat(const Ar: PSDL_FRect): bool;
begin
  Result                      := True;

  if (Ar <> nil) then
  begin
    if (Ar^.w > 0.0) and (Ar^.h > 0.0) then
      Exit(False);
  end;
end;

function SDL_RectsEqualEpsilon(const Aa: PSDL_FRect; const Ab: PSDL_FRect; const Aepsilon: float): bool;
begin
  Result                      := False;

  if (Aa <> nil) and (Ab <> nil) then
  begin
    if (Aa = Ab) or ((SDL_fabsf(Aa^.x - Ab^.x) <= Aepsilon)
        and (SDL_fabsf(Aa^.y - Ab^.y) <= Aepsilon)
        and (SDL_fabsf(Aa^.w - Ab^.w) <= Aepsilon)
        and (SDL_fabsf(Aa^.h - Ab^.h) <= Aepsilon)
      ) then
    begin
      Exit(True);
    end;
  end;
end;

function SDL_RectsEqualFloat(const Aa: PSDL_FRect; const Ab: PSDL_FRect): bool;
begin
  Result                      := SDL_RectsEqualEpsilon(Aa, Ab, SDL_FLT_EPSILON);
end;

procedure InitLibrary(const AHandle: THandle);
begin
  SDL_HasRectIntersection     := BindProcedure(AHandle, 'SDL_HasRectIntersection');
  SDL_GetRectIntersection     := BindProcedure(AHandle, 'SDL_GetRectIntersection');
  SDL_GetRectUnion            := BindProcedure(AHandle, 'SDL_GetRectUnion');
  SDL_GetRectEnclosingPoints  := BindProcedure(AHandle, 'SDL_GetRectEnclosingPoints');
  SDL_GetRectAndLineIntersection
                              := BindProcedure(AHandle, 'SDL_GetRectAndLineIntersection');
  SDL_HasRectIntersectionFloat
                              := BindProcedure(AHandle, 'SDL_HasRectIntersectionFloat');
  SDL_GetRectIntersectionFloat
                              := BindProcedure(AHandle, 'SDL_GetRectIntersectionFloat');
  SDL_GetRectUnionFloat       := BindProcedure(AHandle, 'SDL_GetRectUnionFloat');
  SDL_GetRectEnclosingPointsFloat
                              := BindProcedure(AHandle, 'SDL_GetRectEnclosingPointsFloat');
  SDL_GetRectAndLineIntersectionFloat
                              := BindProcedure(AHandle, 'SDL_GetRectAndLineIntersectionFloat');
end;

end.
