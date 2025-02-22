unit SDL.locale;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.error;

type
  TSDL_Locale                 = record
    language                    : PAnsiChar;
    country                     : PAnsiChar;
  end;
  PSDL_Locale                 = ^TSDL_Locale;
  PPSDL_Locale                = ^PSDL_Locale;

  /// <summary>
  ///  Report the user's preferred locale.
  /// </summary>
  TSDL_GetPreferredLocales    = function (var Acount: int): PPSDL_Locale; cdecl;

var
  SDL_GetPreferredLocales     : TSDL_GetPreferredLocales;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetPreferredLocales    := BindProcedure(AHandle, 'SDL_GetPreferredLocales');
end;

end.
