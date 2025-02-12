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

  function SDL_BUTTON_MASK(AValue: TSDL_MouseButtonFlags): TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_LMASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_MMASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_RMASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_X1MASK: TSDL_MouseButtonFlags; inline;
  function SDL_BUTTON_X2MASK: TSDL_MouseButtonFlags; inline;

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

end.
