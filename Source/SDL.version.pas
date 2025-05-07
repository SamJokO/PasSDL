unit SDL.version;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

const
  SDL_MAJOR_VERSION           = 3;
  SDL_MINOR_VERSION           = 2;
  SDL_MICRO_VERSION           = 12;


  function SDL_VERSIONNUM(Amajor: int; Aminor: int; Apatch: int): int; inline;
  function SDL_VERSIONNUM_MAJOR(Aversion: int): int; inline;
  function SDL_VERSIONNUM_MINOR(Aversion: int): int; inline;
  function SDL_VERSIONNUM_MICRO(Aversion: int): int; inline;
  function SDL_VERSION(): int; inline;
  function SDL_VERSION_ATLEAST(Ax, Ay, Az: int): bool; inline;

type
  /// <summary>
  ///  Get the version of SDL that is linked against your program.
  /// </summary>
  TSDL_GetVersion             = function (): int; cdecl;

  /// <summary>
  ///  Get the code revision of SDL that is linked against your program.
  /// </summary>
  TSDL_GetRevision            = function (): PAnsiChar; cdecl;

var
  SDL_GetVersion              : TSDL_GetVersion;
  SDL_GetRevision             : TSDL_GetRevision;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_VERSIONNUM(Amajor: int; Aminor: int; Apatch: int): int;
begin
  Result                      := Amajor * 1000000 + Aminor * 1000 + Apatch;
end;

function SDL_VERSIONNUM_MAJOR(Aversion: int): int;
begin
  Result                      := Aversion div 1000000;
end;

function SDL_VERSIONNUM_MINOR(Aversion: int): int;
begin
  Result                      := (Aversion div 1000) mod 1000;
end;

function SDL_VERSIONNUM_MICRO(Aversion: int): int;
begin
  Result                      := Aversion mod 1000;
end;

function SDL_VERSION(): int;
begin
  Result                      := SDL_VERSIONNUM(SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_MICRO_VERSION);
end;

function SDL_VERSION_ATLEAST(Ax, Ay, Az: int): bool;
begin
  Result                      := SDL_VERSION >= SDL_VERSIONNUM(Ax, Ay, Az);
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetVersion             := BindProcedure(AHandle, 'SDL_GetVersion');
  @SDL_GetRevision            := BindProcedure(AHandle, 'SDL_GetRevision');
end;

end.
