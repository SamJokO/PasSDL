unit SDL.messagebox;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error,
  SDL.video;

type
  TSDL_MessageBoxFlags        = Uint32;
  PSDL_MessageBoxFlags        = ^TSDL_MessageBoxFlags;

const
  SDL_MESSAGEBOX_ERROR        = $00000010;
  SDL_MESSAGEBOX_WARNING      = $00000020;
  SDL_MESSAGEBOX_INFORMATION  = $00000040;
  SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT    = $00000080;
  SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT    = $00000100;

type
  TSDL_MessageBoxButtonFlags  = Uint32;
  PSDL_MessageBoxButtonFlags  = ^TSDL_MessageBoxButtonFlags;

const
  SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT     = $00000001;
  SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT     = $00000002;

type
  TSDL_MessageBoxButtonData = record
    flags                       : TSDL_MessageBoxButtonFlags;
    buttonID                    : int;
    text                        : PAnsiChar;
  end;
  PSDL_MessageBoxButtonData = ^TSDL_MessageBoxButtonData;

  TSDL_MessageBoxColor = record
    r, g, b                     : Uint8;
  end;
  PSDL_MessageBoxColor = ^TSDL_MessageBoxColor;

  TSDL_MessageBoxColorType    = (
                                  SDL_MESSAGEBOX_COLOR_BACKGROUND,
                                  SDL_MESSAGEBOX_COLOR_TEXT,
                                  SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
                                  SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
                                  SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
                                  SDL_MESSAGEBOX_COLOR_COUNT
                                );
  PSDL_MessageBoxColorType    = ^TSDL_MessageBoxColorType;

  TSDL_MessageBoxColorScheme = record
    colors                      : array[0..Ord(SDL_MESSAGEBOX_COLOR_COUNT) - 1] of TSDL_MessageBoxColor;
  end;
  PSDL_MessageBoxColorScheme = ^TSDL_MessageBoxColorScheme;

  TSDL_MessageBoxData = record
    flags                       : TSDL_MessageBoxFlags;
    window                      : PSDL_Window;
    title                       : PAnsiChar;
    &message                    : PAnsiChar;
    numbuttons                  : int;
    buttons                     : PSDL_MessageBoxButtonData;
    colorScheme                 : PSDL_MessageBoxColorScheme;
  end;
  PSDL_MessageBoxData = ^TSDL_MessageBoxData;

  /// <summary>
  ///  Create a modal message box.
  /// </summary>
  TSDL_ShowMessageBox         = function (const Amessageboxdata: PSDL_MessageBoxData; Abuttonid: Pint): bool; cdecl;

  /// <summary>
  ///  Display a simple modal message box.
  /// </summary>
  TSDL_ShowSimpleMessageBox   = function (Aflags: TSDL_MessageBoxFlags; const Atitle: PAnsiChar; const Amessage: PAnsiChar; Awindow: PSDL_Window): bool; cdecl;

var
  SDL_ShowMessageBox          : TSDL_ShowMessageBox;
  SDL_ShowSimpleMessageBox    : TSDL_ShowSimpleMessageBox;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_ShowMessageBox         := BindProcedure(AHandle, 'SDL_ShowMessageBox');
  @SDL_ShowSimpleMessageBox   := BindProcedure(AHandle, 'SDL_ShowSimpleMessageBox');
end;

end.
