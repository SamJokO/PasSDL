unit SDL.clipboard;

interface

uses
  SDL.Types,
  SDL.stdinc;

type
  /// <summary>
  ///  Put UTF-8 text into the clipboard.
  /// </summary>
  TSDL_SetClipboardText       = function (const AText: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get UTF-8 text from the clipboard.
  /// </summary>
  TSDL_GetClipboardText       = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Query whether the clipboard exists and contains a non-empty text string.
  /// </summary>
  TSDL_HasClipboardText       = function (): bool; cdecl;

  /// <summary>
  ///  Put UTF-8 text into the primary selection.
  /// </summary>
  TSDL_SetPrimarySelectionText= function (const AText: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get UTF-8 text from the primary selection.
  /// </summary>
  TSDL_GetPrimarySelectionText= function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Query whether the primary selection exists and contains a non-empty text
  ///  string.
  /// </summary>
  TSDL_HasPrimarySelectionText= function (): bool; cdecl;

  TSDL_ClipboardDataCallback  = function (AUserData: Pointer; const AMime_type: PAnsiChar; Asize: Psize_t): Pointer; cdecl;

  TSDL_ClipboardCleanupCallback
                              = procedure (AUserData: Pointer); cdecl;

  /// <summary>
  ///  Offer clipboard data to the OS.
  /// </summary>
  TSDL_SetClipboardData       = function (ACallback: TSDL_ClipboardDataCallback; ACleanup: TSDL_ClipboardCleanupCallback; AUserData: Pointer; const AMime_types: PPAnsiChar; Anum_mime_types: size_t): bool; cdecl;

  /// <summary>
  ///  Clear the clipboard data.
  /// </summary>
  TSDL_ClearClipboardData     = function (): bool; cdecl;

  /// <summary>
  ///  Get the data from clipboard for a given mime type.
  /// </summary>
  TSDL_GetClipboardData       = function (const AMime_type: PAnsiChar; Asize: Psize_t): Pointer; cdecl;

  /// <summary>
  ///  Query whether there is data in the clipboard for the provided mime type.
  /// </summary>
  TSDL_HasClipboardData       = function (const AMime_type: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Retrieve the list of mime types available in the clipboard.
  /// </summary>
  TSDL_GetClipboardMimeTypes  = function (var Anum_mime_types: size_t): PPAnsiChar; cdecl;

var
  SDL_SetClipboardText        : TSDL_SetClipboardText;
  SDL_GetClipboardText        : TSDL_GetClipboardText;
  SDL_HasClipboardText        : TSDL_HasClipboardText;
  SDL_SetPrimarySelectionText : TSDL_SetPrimarySelectionText;
  SDL_GetPrimarySelectionText : TSDL_GetPrimarySelectionText;
  SDL_HasPrimarySelectionText : TSDL_HasPrimarySelectionText;
  SDL_SetClipboardData        : TSDL_SetClipboardData;
  SDL_ClearClipboardData      : TSDL_ClearClipboardData;
  SDL_GetClipboardData        : TSDL_GetClipboardData;
  SDL_HasClipboardData        : TSDL_HasClipboardData;
  SDL_GetClipboardMimeTypes   : TSDL_GetClipboardMimeTypes;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_SetClipboardText       := BindProcedure(AHandle, 'SDL_SetClipboardText');
  @SDL_GetClipboardText       := BindProcedure(AHandle, 'SDL_GetClipboardText');
  @SDL_HasClipboardText       := BindProcedure(AHandle, 'SDL_HasClipboardText');
  @SDL_SetPrimarySelectionText:= BindProcedure(AHandle, 'SDL_SetPrimarySelectionText');
  @SDL_GetPrimarySelectionText:= BindProcedure(AHandle, 'SDL_GetPrimarySelectionText');
  @SDL_HasPrimarySelectionText:= BindProcedure(AHandle, 'SDL_HasPrimarySelectionText');
  @SDL_SetClipboardData       := BindProcedure(AHandle, 'SDL_SetClipboardData');
  @SDL_ClearClipboardData     := BindProcedure(AHandle, 'SDL_ClearClipboardData');
  @SDL_GetClipboardData       := BindProcedure(AHandle, 'SDL_GetClipboardData');
  @SDL_HasClipboardData       := BindProcedure(AHandle, 'SDL_HasClipboardData');
  @SDL_GetClipboardMimeTypes  := BindProcedure(AHandle, 'SDL_GetClipboardMimeTypes');
end;

end.
