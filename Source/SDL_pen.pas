unit SDL_pen;

interface

uses
  SDL.Types,
  SDL_stdinc,
  SDL_mouse,
  SDL_touch;

type
  TSDL_PenID                  = Uint32;
  PSDL_PenID                  = ^TSDL_PenID;

  function SDL_PEN_MOUSEID: TSDL_MouseID; inline;
  function SDL_PEN_TOUCHID: TSDL_TouchID; inline;

type
  TSDL_PenInputFlags          = Uint32;
  PSDL_PenInputFlags          = ^TSDL_PenInputFlags;

const
  SDL_PEN_INPUT_DOWN          = 1 shl 0;
  SDL_PEN_INPUT_BUTTON_1      = 1 shl 1;
  SDL_PEN_INPUT_BUTTON_2      = 1 shl 2;
  SDL_PEN_INPUT_BUTTON_3      = 1 shl 3;
  SDL_PEN_INPUT_BUTTON_4      = 1 shl 4;
  SDL_PEN_INPUT_BUTTON_5      = 1 shl 5;
  SDL_PEN_INPUT_ERASER_TIP    = 1 shl 30;

type
  TSDL_PenAxis                = (
                                  SDL_PEN_AXIS_PRESSURE,
                                  SDL_PEN_AXIS_XTILT,
                                  SDL_PEN_AXIS_YTILT,
                                  SDL_PEN_AXIS_DISTANCE,
                                  SDL_PEN_AXIS_ROTATION,
                                  SDL_PEN_AXIS_SLIDER,
                                  SDL_PEN_AXIS_TANGENTIAL_PRESSURE,
                                  SDL_PEN_AXIS_COUNT
                                );
  PSDL_PenAxis                = ^TSDL_PenAxis;

implementation

function SDL_PEN_MOUSEID: TSDL_MouseID;
begin
  Result                      := High(TSDL_MouseID) - 1;
end;

function SDL_PEN_TOUCHID: TSDL_TouchID;
begin
  Result                      := High(TSDL_TouchID) - 1;
end;

end.
