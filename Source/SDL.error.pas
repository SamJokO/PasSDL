unit SDL.error;

interface

uses
  SDL.Types,
  SDL.stdinc;

type
  TSDL_GetError               = function (): PAnsiChar; cdecl;
  TSDL_ClearError             = function (): bool; cdecl;

var
  SDL_GetError                : TSDL_GetError;
  SDL_ClearError              : TSDL_ClearError;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetError               := BindProcedure(AHandle, 'SDL_GetError');
  @SDL_ClearError             := BindProcedure(AHandle, 'SDL_ClearError');
end;

end.
