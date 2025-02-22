unit SDL.guid;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

type
  TSDL_GUID = record
    data                        : array[0..15] of Uint8;
  end;
  PSDL_GUID = ^TSDL_GUID;

  /// <summary>
  ///  Get an ASCII string representation for a given SDL_GUID.
  /// </summary>
  TSDL_GUIDToString           = procedure (Aguid: TSDL_GUID; ApszGUID: PAnsiChar; AcbGUID: int); cdecl;

  /// <summary>
  ///  Convert a GUID string into a SDL_GUID structure.
  /// </summary>
  TSDL_StringToGUID           = function (const ApchGUID: PAnsiChar): TSDL_GUID; cdecl;

var
  SDL_GUIDToString            : TSDL_GUIDToString;
  SDL_StringToGUID            : TSDL_StringToGUID;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GUIDToString           := BindProcedure(AHandle, 'SDL_GUIDToString');
  @SDL_StringToGUID           := BindProcedure(AHandle, 'SDL_StringToGUID');
end;

end.
