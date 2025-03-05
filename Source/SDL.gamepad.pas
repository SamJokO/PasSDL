unit SDL.gamepad;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

{
  Delphi not support Nintendo or some gaming os.
  That is why did not porting.
  Base - 3.2.0
}

interface

uses
  SDL.PascalEntry,
  SDL.error,
  SDL.guid,
  SDL.iostream,
  SDL.joystick,
  SDL.power,
  SDL.properties,
  SDL.sensor,
  SDL.stdinc;

type
  TSDL_Gamepad = record end;
  PSDL_Gamepad = ^TSDL_Gamepad;

  TSDL_GamepadType            = (
                                  SDL_GAMEPAD_TYPE_UNKNOWN = 0,
                                  SDL_GAMEPAD_TYPE_STANDARD,
                                  SDL_GAMEPAD_TYPE_XBOX360,
                                  SDL_GAMEPAD_TYPE_XBOXONE,
                                  SDL_GAMEPAD_TYPE_PS3,
                                  SDL_GAMEPAD_TYPE_PS4,
                                  SDL_GAMEPAD_TYPE_PS5,
                                  SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO,
                                  SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
                                  SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
                                  SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR
                                );
  PSDL_GamepadType            = ^TSDL_GamepadType;

  TSDL_GamepadButton          = (
                                  SDL_GAMEPAD_BUTTON_INVALID = -1,
                                  SDL_GAMEPAD_BUTTON_SOUTH,
                                  SDL_GAMEPAD_BUTTON_EAST,
                                  SDL_GAMEPAD_BUTTON_WEST,
                                  SDL_GAMEPAD_BUTTON_NORTH,
                                  SDL_GAMEPAD_BUTTON_BACK,
                                  SDL_GAMEPAD_BUTTON_GUIDE,
                                  SDL_GAMEPAD_BUTTON_START,
                                  SDL_GAMEPAD_BUTTON_LEFT_STICK,
                                  SDL_GAMEPAD_BUTTON_RIGHT_STICK,
                                  SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
                                  SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
                                  SDL_GAMEPAD_BUTTON_DPAD_UP,
                                  SDL_GAMEPAD_BUTTON_DPAD_DOWN,
                                  SDL_GAMEPAD_BUTTON_DPAD_LEFT,
                                  SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
                                  SDL_GAMEPAD_BUTTON_MISC1,
                                  SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1,
                                  SDL_GAMEPAD_BUTTON_LEFT_PADDLE1,
                                  SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2,
                                  SDL_GAMEPAD_BUTTON_LEFT_PADDLE2,
                                  SDL_GAMEPAD_BUTTON_TOUCHPAD,
                                  SDL_GAMEPAD_BUTTON_MISC2,
                                  SDL_GAMEPAD_BUTTON_MISC3,
                                  SDL_GAMEPAD_BUTTON_MISC4,
                                  SDL_GAMEPAD_BUTTON_MISC5,
                                  SDL_GAMEPAD_BUTTON_MISC6,
                                  SDL_GAMEPAD_BUTTON_COUNT
                                );
  PSDL_GamepadButton          = ^TSDL_GamepadButton;

  TSDL_GamepadButtonLabel     = (
                                  SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN,
                                  SDL_GAMEPAD_BUTTON_LABEL_A,
                                  SDL_GAMEPAD_BUTTON_LABEL_B,
                                  SDL_GAMEPAD_BUTTON_LABEL_X,
                                  SDL_GAMEPAD_BUTTON_LABEL_Y,
                                  SDL_GAMEPAD_BUTTON_LABEL_CROSS,
                                  SDL_GAMEPAD_BUTTON_LABEL_CIRCLE,
                                  SDL_GAMEPAD_BUTTON_LABEL_SQUARE,
                                  SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE
                                );
  PSDL_GamepadButtonLabel     = ^TSDL_GamepadButtonLabel;

  TSDL_GamepadAxis            = (
                                  SDL_GAMEPAD_AXIS_INVALID = -1,
                                  SDL_GAMEPAD_AXIS_LEFTX,
                                  SDL_GAMEPAD_AXIS_LEFTY,
                                  SDL_GAMEPAD_AXIS_RIGHTX,
                                  SDL_GAMEPAD_AXIS_RIGHTY,
                                  SDL_GAMEPAD_AXIS_LEFT_TRIGGER,
                                  SDL_GAMEPAD_AXIS_RIGHT_TRIGGER,
                                  SDL_GAMEPAD_AXIS_COUNT
                                );
  PSDL_GamepadAxis            = ^TSDL_GamepadAxis;

  TSDL_GamepadBindingType     = (
                                  SDL_GAMEPAD_BINDTYPE_NONE = 0,
                                  SDL_GAMEPAD_BINDTYPE_BUTTON,
                                  SDL_GAMEPAD_BINDTYPE_AXIS,
                                  SDL_GAMEPAD_BINDTYPE_HAT
                                );
  PSDL_GamepadBindingType     = ^TSDL_GamepadBindingType;

  TSDL_InnerRecord_001 = record
    axis                        : int;
    axis_min                    : int;
    axis_max                    : int;
  end;
  PSDL_InnerRecord_001 = ^TSDL_InnerRecord_001;

  TSDL_InnerRecord_002 = record
    hat                         : int;
    hat_mask                    : int;
  end;
  PSDL_InnerRecord_002 = ^TSDL_InnerRecord_002;

  TSDL_InnerGroup = record
    case Integer of
      0: (button: int);
      1: (axis: TSDL_InnerRecord_001);
      2: (hat: TSDL_InnerRecord_002);
  end;

  TSDL_OutRecord_001 = record
    axis                        : TSDL_GamepadAxis;
    axis_min                    : int;
    axis_max                    : int;
  end;

  TSDL_OutGroup = record
    case Integer of
      0: (button: TSDL_GamepadButton);
      1: (axis: TSDL_OutRecord_001);
  end;

  TSDL_GamepadBinding = record
    input_type                  : TSDL_GamepadBindingType;
    input                       : TSDL_InnerGroup;
    output_type                 : TSDL_GamepadBindingType;
    output                      : TSDL_OutGroup;
  end;
  PSDL_GamepadBindind = ^TSDL_GamepadBinding;

  TSDL_AddGamepadMapping      = function (const Amapping: PAnsiChar): int; cdecl;


implementation

end.
