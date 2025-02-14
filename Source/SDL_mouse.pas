unit SDL_mouse;

interface

uses
  SDL.Types,
  SDL_stdinc,
  SDL_surface,
  SDL_video;

type
  TSDL_MouseID                = Uint32;
  PSDL_MouseID                = ^TSDL_MouseID;

  TSDL_Cursor = record end;
  PSDL_Cursor = ^TSDL_Cursor;

  TSDL_SystemCursor           = (
                                  SDL_SYSTEM_CURSOR_DEFAULT,      // Default cursor. Usually an arrow.
                                  SDL_SYSTEM_CURSOR_TEXT,         // Text selection. Usually an I-beam.
                                  SDL_SYSTEM_CURSOR_WAIT,         // Wait. Usually an hourglass or watch or spinning ball.
                                  SDL_SYSTEM_CURSOR_CROSSHAIR,    // Crosshair.
                                  SDL_SYSTEM_CURSOR_PROGRESS,     // Program is busy but still interactive. Usually it's WAIT with an arrow.
                                  SDL_SYSTEM_CURSOR_NWSE_RESIZE,  // Double arrow pointing northwest and southeast.
                                  SDL_SYSTEM_CURSOR_NESW_RESIZE,  // Double arrow pointing northeast and southwest.
                                  SDL_SYSTEM_CURSOR_EW_RESIZE,    // Double arrow pointing west and east.
                                  SDL_SYSTEM_CURSOR_NS_RESIZE,    // Double arrow pointing north and south.
                                  SDL_SYSTEM_CURSOR_MOVE,         // Four pointed arrow pointing north, south, east, and west.
                                  SDL_SYSTEM_CURSOR_NOT_ALLOWED,  // Not permitted. Usually a slashed circle or crossbones.
                                  SDL_SYSTEM_CURSOR_POINTER,      // Pointer that indicates a link. Usually a pointing hand.
                                  SDL_SYSTEM_CURSOR_NW_RESIZE,    // Window resize top-left. This may be a single arrow or a double arrow like NWSE_RESIZE.
                                  SDL_SYSTEM_CURSOR_N_RESIZE,     // Window resize top. May be NS_RESIZE.
                                  SDL_SYSTEM_CURSOR_NE_RESIZE,    // Window resize top-right. May be NESW_RESIZE.
                                  SDL_SYSTEM_CURSOR_E_RESIZE,     // Window resize right. May be EW_RESIZE.
                                  SDL_SYSTEM_CURSOR_SE_RESIZE,    // Window resize bottom-right. May be NWSE_RESIZE.
                                  SDL_SYSTEM_CURSOR_S_RESIZE,     // Window resize bottom. May be NS_RESIZE.
                                  SDL_SYSTEM_CURSOR_SW_RESIZE,    // Window resize bottom-left. May be NESW_RESIZE.
                                  SDL_SYSTEM_CURSOR_W_RESIZE,     // Window resize left. May be EW_RESIZE.
                                  SDL_SYSTEM_CURSOR_COUNT
                                );
  PSDL_SystemCursor           = TSDL_SystemCursor;

  TSDL_MouseWheelDirection    = (
                                  SDL_MOUSEWHEEL_NORMAL,
                                  SDL_MOUSEWHEEL_FLIPPED
                                );
  PSDL_MouseWheelDirection    = ^TSDL_MouseWheelDirection;

  TSDL_MouseButtonFlags       = Uint32;
  PSDL_MouseButtonFlags       = ^TSDL_MouseButtonFlags;

const
  SDL_BUTTON_LEFT             = 1;
  SDL_BUTTON_MIDDLE           = 2;
  SDL_BUTTON_RIGHT            = 3;
  SDL_BUTTON_X1               = 4;
  SDL_BUTTON_X2               = 5;

  // Not sure data type - TODO
  function SDL_BUTTON_MASK(AValue: TSDL_MouseButtonFlags): TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_LMASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_MMASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_RMASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_X1MASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_X2MASK: TSDL_MouseButtonFlags; inline;

type
  /// <summary>
  ///  Return whether a mouse is currently connected.
  /// </summary>
  TSDL_HasMouse               = function (): bool; cdecl;

  /// <summary>
  ///  Get a list of currently connected mice.
  /// </summary>
  TSDL_GetMice                = function (var Acount: int): PSDL_MouseID; cdecl;

  /// <summary>
  ///  Get the name of a mouse.
  /// </summary>
  TSDL_GetMouseNameForID      = function (Ainstance_id: TSDL_MouseID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the window which currently has mouse focus.
  /// </summary>
  TSDL_GetMouseFocus          = function (): PSDL_Window; cdecl;

  /// <summary>
  ///  Query SDL's cache for the synchronous mouse button state and the
  ///  window-relative SDL-cursor position.
  /// </summary>
  TSDL_GetMouseState          = function (var Ax: float; var Ay: float): TSDL_MouseButtonFlags; cdecl;

  /// <summary>
  ///  Query the platform for the asynchronous mouse button state and the
  ///  desktop-relative platform-cursor position.
  /// </summary>
  TSDL_GetGlobalMouseState    = function (var Ax: float; var Ay: float): TSDL_MouseButtonFlags; cdecl;

  /// <summary>
  ///  Query SDL's cache for the synchronous mouse button state and accumulated
  ///  mouse delta since last call.
  /// </summary>
  TSDL_GetRelativeMouseState  = function (var Ax: float; var Ay: float): TSDL_MouseButtonFlags; cdecl;

  /// <summary>
  ///  Move the mouse cursor to the given position within the window.
  /// </summary>
  TSDL_WarpMouseInWindow      = procedure (Awindow: PSDL_Window; Ax: float; Ay: float); cdecl;

  /// <summary>
  ///  Move the mouse to the given position in global screen space.
  /// </summary>
  TSDL_WarpMouseGlobal        = function (Ax: float; Ay: float): bool; cdecl;

  /// <summary>
  ///  Set relative mouse mode for a window.
  /// </summary>
  TSDL_SetWindowRelativeMouseMode
                              = function (Awindow: PSDL_Window; Aenabled: bool): bool; cdecl;

  /// <summary>
  ///  Query whether relative mouse mode is enabled for a window.
  /// </summary>
  TSDL_GetWindowRelativeMouseMode
                              = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Capture the mouse and to track input outside an SDL window.
  /// </summary>
  TSDL_CaptureMouse           = function (Aenabled: bool): bool; cdecl;

  /// <summary>
  ///  Create a cursor using the specified bitmap data and mask (in MSB format).
  /// </summary>
  TSDL_CreateCursor           = function (const Adata: PUint8; const Amask: PUint8; Aw: int; Ah: int; Ahot_x: int; Ahot_y: int): PSDL_Cursor; cdecl;

  /// <summary>
  ///  Create a color cursor.
  /// </summary>
  TSDL_CreateColorCursor      = function (Asurface: PSDL_Surface; Ahot_x: int; Ahot_y: int): PSDL_Cursor; cdecl;

  /// <summary>
  ///  Create a system cursor.
  /// </summary>
  TSDL_CreateSystemCursor     = function (Aid: TSDL_SystemCursor): PSDL_Cursor; cdecl;

  /// <summary>
  ///  Set the active cursor.
  /// </summary>
  TSDL_SetCursor              = function (Acursor: PSDL_Cursor): bool; cdecl;

  /// <summary>
  ///  Get the active cursor.
  /// </summary>
  TSDL_GetCursor              = function (): PSDL_Cursor; cdecl;

  /// <summary>
  ///  Get the default cursor.
  /// </summary>
  TSDL_GetDefaultCursor       = function (): PSDL_Cursor; cdecl;

  /// <summary>
  ///  Free a previously-created cursor.
  /// </summary>
  TSDL_DestroyCursor          = procedure (Acursor: PSDL_Cursor); cdecl;

  /// <summary>
  ///  Show the cursor.
  /// </summary>
  TSDL_ShowCursor             = function (): bool; cdecl;

  /// <summary>
  ///  Hide the cursor.
  /// </summary>
  TSDL_HideCursor             = function (): bool; cdecl;

  /// <summary>
  ///  Return whether the cursor is currently being shown.
  /// </summary>
  TSDL_CursorVisible          = function (): bool; cdecl;

var
  SDL_HasMouse                : TSDL_HasMouse;
  SDL_GetMice                 : TSDL_GetMice;
  SDL_GetMouseNameForID       : TSDL_GetMouseNameForID;
  SDL_GetMouseFocus           : TSDL_GetMouseFocus;
  SDL_GetMouseState           : TSDL_GetMouseState;
  SDL_GetGlobalMouseState     : TSDL_GetGlobalMouseState;
  SDL_GetRelativeMouseState   : TSDL_GetRelativeMouseState;
  SDL_WarpMouseInWindow       : TSDL_WarpMouseInWindow;
  SDL_WarpMouseGlobal         : TSDL_WarpMouseGlobal;
  SDL_SetWindowRelativeMouseMode
                              : TSDL_SetWindowRelativeMouseMode;
  SDL_GetWindowRelativeMouseMode
                              : TSDL_GetWindowRelativeMouseMode;
  SDL_CaptureMouse            : TSDL_CaptureMouse;
  SDL_CreateCursor            : TSDL_CreateCursor;
  SDL_CreateColorCursor       : TSDL_CreateColorCursor;
  SDL_CreateSystemCursor      : TSDL_CreateSystemCursor;
  SDL_SetCursor               : TSDL_SetCursor;
  SDL_GetCursor               : TSDL_GetCursor;
  SDL_GetDefaultCursor        : TSDL_GetDefaultCursor;
  SDL_DestroyCursor           : TSDL_DestroyCursor;
  SDL_ShowCursor              : TSDL_ShowCursor;
  SDL_HideCursor              : TSDL_HideCursor;
  SDL_CursorVisible           : TSDL_CursorVisible;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_BUTTON_MASK(AValue: TSDL_MouseButtonFlags): TSDL_MouseButtonFlags;
begin
  Result                      := 1 shl (AValue - 1);
end;

function SDL_BUTTON_LMASK: TSDL_MouseButtonFlags;
begin
  Result                      := SDL_BUTTON_MASK(SDL_BUTTON_LEFT);
end;

function SDL_BUTTON_MMASK: TSDL_MouseButtonFlags;
begin
  Result                      := SDL_BUTTON_MASK(SDL_BUTTON_MIDDLE);
end;

function SDL_BUTTON_RMASK: TSDL_MouseButtonFlags;
begin
  Result                      := SDL_BUTTON_MASK(SDL_BUTTON_RIGHT);
end;

function SDL_BUTTON_X1MASK: TSDL_MouseButtonFlags;
begin
  Result                      := SDL_BUTTON_MASK(SDL_BUTTON_X1);
end;

function SDL_BUTTON_X2MASK: TSDL_MouseButtonFlags;
begin
  Result                      := SDL_BUTTON_MASK(SDL_BUTTON_X2);
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_HasMouse               := BindProcedure(AHandle, 'SDL_HasMouse');
  @SDL_GetMice                := BindProcedure(AHandle, 'SDL_GetMice');
  @SDL_GetMouseNameForID      := BindProcedure(AHandle, 'SDL_GetMouseNameForID');
  @SDL_GetMouseFocus          := BindProcedure(AHandle, 'SDL_GetMouseFocus');
  @SDL_GetMouseState          := BindProcedure(AHandle, 'SDL_GetMouseState');
  @SDL_GetGlobalMouseState    := BindProcedure(AHandle, 'SDL_GetGlobalMouseState');
  @SDL_GetRelativeMouseState  := BindProcedure(AHandle, 'SDL_GetRelativeMouseState');
  @SDL_WarpMouseInWindow      := BindProcedure(AHandle, 'SDL_WarpMouseInWindow');
  @SDL_WarpMouseGlobal        := BindProcedure(AHandle, 'SDL_WarpMouseGlobal');
  @SDL_SetWindowRelativeMouseMode
                              := BindProcedure(AHandle, 'SDL_SetWindowRelativeMouseMode');
  @SDL_GetWindowRelativeMouseMode
                              := BindProcedure(AHandle, 'SDL_GetWindowRelativeMouseMode');
  @SDL_CaptureMouse           := BindProcedure(AHandle, 'SDL_CaptureMouse');
  @SDL_CreateCursor           := BindProcedure(AHandle, 'SDL_CreateCursor');
  @SDL_CreateColorCursor      := BindProcedure(AHandle, 'SDL_CreateColorCursor');
  @SDL_CreateSystemCursor     := BindProcedure(AHandle, 'SDL_CreateSystemCursor');
  @SDL_SetCursor              := BindProcedure(AHandle, 'SDL_SetCursor');
  @SDL_GetCursor              := BindProcedure(AHandle, 'SDL_GetCursor');
  @SDL_GetDefaultCursor       := BindProcedure(AHandle, 'SDL_GetDefaultCursor');
  @SDL_DestroyCursor          := BindProcedure(AHandle, 'SDL_DestroyCursor');
  @SDL_ShowCursor             := BindProcedure(AHandle, 'SDL_ShowCursor');
  @SDL_HideCursor             := BindProcedure(AHandle, 'SDL_HideCursor');
  @SDL_CursorVisible          := BindProcedure(AHandle, 'SDL_CursorVisible');
end;

end.
