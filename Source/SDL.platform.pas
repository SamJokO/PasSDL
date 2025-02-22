unit SDL.platform;

interface

uses
  SDL.PascalEntry;

type
  /// <summary>
  ///  Get the name of the platform.
  /// </summary>
  TSDL_GetPlatform            = function (): PAnsiChar; cdecl;

var
  SDL_GetPlatform             : TSDL_GetPlatform;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetPlatform            := BindProcedure(AHandle, 'SDL_GetPlatform');
end;

end.
