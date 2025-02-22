unit SDL.misc;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.error;

type
  /// <summary>
  ///  Report the user's preferred locale.
  /// </summary>
  TSDL_OpenURL                = function (const Aurl: PAnsiChar): bool; cdecl;

var
  SDL_OpenURL                 : TSDL_OpenURL;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_OpenURL                := BindProcedure(AHandle, 'SDL_OpenURL');
end;

end.
