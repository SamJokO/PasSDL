unit SDL.keyboard;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.keycode,
  SDL.scancode,
  SDL.rect,
  SDL.properties,
  SDL.video;

type
  TSDL_KeyboardID             = Uint32;
  PSDL_KeyboardID             = ^TSDL_KeyboardID;

  /// <summary>
  ///  Return whether a keyboard is currently connected.
  /// </summary>
  TSDL_HasKeyboard            = function(): bool; cdecl;

  /// <summary>
  ///  Get a list of currently connected keyboards.
  /// </summary>
  TSDL_GetKeyboards           = function (var Acount: int): PSDL_KeyboardID; cdecl;

  /// <summary>
  ///  Get the name of a keyboard.
  /// </summary>
  TSDL_GetKeyboardNameForID   = function (Ainstance_id: TSDL_KeyboardID): PAnsiChar; cdecl;

  /// <summary>
  ///  Query the window which currently has keyboard focus.
  /// </summary>
  TSDL_GetKeyboardFocus       = function (): PSDL_Window; cdecl;

  /// <summary>
  ///  Get a snapshot of the current state of the keyboard.
  /// </summary>
  TSDL_GetKeyboardState       = function (var Anumkeys: int): Pbool; cdecl;

  /// <summary>
  ///  Clear the state of the keyboard.
  /// </summary>
  TSDL_ResetKeyboard          = procedure (); cdecl;

  /// <summary>
  ///  Get the current key modifier state for the keyboard.
  /// </summary>
  TSDL_GetModState            = function (): TSDL_Keymod; cdecl;

  /// <summary>
  ///  Set the current key modifier state for the keyboard.
  /// </summary>
  TSDL_SetModState            = procedure (Amodstate: TSDL_keymod); cdecl;

  /// <summary>
  ///  Get the key code corresponding to the given scancode according to the
  ///  current keyboard layout.
  /// </summary>
  TSDL_GetKeyFromScancode     = function (Ascancode: TSDL_Scancode; Amodstate: TSDL_Keymod; Akey_event: bool): TSDL_Keycode; cdecl;

  /// <summary>
  ///  Get the scancode corresponding to the given key code according to the
  ///  current keyboard layout.
  /// </summary>
  TSDL_GetScancodeFromKey     = function (Akey: TSDL_Keycode; var Amodstate: TSDL_Keymod): TSDL_Scancode; cdecl;

  /// <summary>
  ///  Set a human-readable name for a scancode.
  /// </summary>
  TSDL_SetScancodeName        = function (Ascancode: TSDL_Scancode; const Aname: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get a human-readable name for a scancode.
  /// </summary>
  TSDL_GetScancodeName        = function (Ascancode: TSDL_Scancode): PAnsiChar; cdecl;

  /// <summary>
  ///  Get a scancode from a human-readable name.
  /// </summary>
  TSDL_GetScancodeFromName    = function (const Aname: PAnsiChar): TSDL_Scancode; cdecl;

  /// <summary>
  ///  Get a human-readable name for a key.
  /// </summary>
  TSDL_GetKeyName             = function (Akey: TSDL_Keycode): PAnsiChar; cdecl;

  /// <summary>
  ///  Get a key code from a human-readable name.
  /// </summary>
  TSDL_GetKeyFromName         = function (const Aname: PAnsiChar): TSDL_Keycode; cdecl;

  /// <summary>
  ///  Start accepting Unicode text input events in a window.
  /// </summary>
  TSDL_StartTextInput         = function (Awindow: PSDL_Window): bool; cdecl;

  TSDL_TextInputType          = (
                                  SDL_TEXTINPUT_TYPE_TEXT,
                                  SDL_TEXTINPUT_TYPE_TEXT_NAME,
                                  SDL_TEXTINPUT_TYPE_TEXT_EMAIL,
                                  SDL_TEXTINPUT_TYPE_TEXT_USERNAME,
                                  SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN,
                                  SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE,
                                  SDL_TEXTINPUT_TYPE_NUMBER,
                                  SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN,
                                  SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE
                                );
  PSDL_TextInputType          = ^TSDL_TextInputType;

  TSDL_Capitalization         = (
                                  SDL_CAPITALIZE_NONE,
                                  SDL_CAPITALIZE_SENTENCES,
                                  SDL_CAPITALIZE_WORDS,
                                  SDL_CAPITALIZE_LETTERS
                                );
  PSDL_Capitalization         = ^TSDL_Capitalization;

  /// <summary>
  ///  Start accepting Unicode text input events in a window, with properties
  ///  describing the input.
  /// </summary>
  TSDL_StartTextInputWithProperties
                              = function (Awindow: PSDL_Window; Aprops: TSDL_PropertiesID): bool; cdecl;

const
  SDL_PROP_TEXTINPUT_TYPE_NUMBER                 = 'SDL.textinput.type';
  SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER       = 'SDL.textinput.capitalization';
  SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN         = 'SDL.textinput.autocorrect';
  SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN           = 'SDL.textinput.multiline';
  SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER    = 'SDL.textinput.android.inputtype';

type
  /// <summary>
  ///  Check whether or not Unicode text input events are enabled for a window.
  /// </summary>
  TSDL_TextInputActive        = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Stop receiving any text input events in a window.
  /// </summary>
  TSDL_StopTextInput          = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Dismiss the composition window/IME without disabling the subsystem.
  /// </summary>
  TSDL_ClearComposition       = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Set the area used to type Unicode text input.
  /// </summary>
  TSDL_SetTextInputArea       = function (Awindow: PSDL_Window; const Arect: PSDL_Rect; Acursor: int): bool; cdecl;

  /// <summary>
  ///  Get the area used to type Unicode text input.
  /// </summary>
  TSDL_GetTextInputArea       = function (Awindow: PSDL_Window; var Arect: TSDL_Rect; var Acursor: int): bool; cdecl;

  /// <summary>
  ///  Check whether the platform has screen keyboard support.
  /// </summary>
  TSDL_HasScreenKeyboardSupport
                              = function (): bool; cdecl;
  /// <summary>
  ///  Check whether the screen keyboard is shown for given window.
  /// </summary>
  TSDL_ScreenKeyboardShown    = function (Awindow: PSDL_Window): bool; cdecl;

var
  SDL_HasKeyboard             : TSDL_HasKeyboard;
  SDL_GetKeyboards            : TSDL_GetKeyboards;
  SDL_GetKeyboardNameForID    : TSDL_GetKeyboardNameForID;
  SDL_GetKeyboardFocus        : TSDL_GetKeyboardFocus;
  SDL_GetKeyboardState        : TSDL_GetKeyboardState;
  SDL_ResetKeyboard           : TSDL_ResetKeyboard;
  SDL_GetModState             : TSDL_GetModState;
  SDL_SetModState             : TSDL_SetModState;
  SDL_GetKeyFromScancode      : TSDL_GetKeyFromScancode;
  SDL_GetScancodeFromKey      : TSDL_GetScancodeFromKey;
  SDL_SetScancodeName         : TSDL_SetScancodeName;
  SDL_GetScancodeName         : TSDL_GetScancodeName;
  SDL_GetScancodeFromName     : TSDL_GetScancodeFromName;
  SDL_GetKeyName              : TSDL_GetKeyName;
  SDL_GetKeyFromName          : TSDL_GetKeyFromName;
  SDL_StartTextInput          : TSDL_StartTextInput;
  SDL_StartTextInputWithProperties
                              : TSDL_StartTextInputWithProperties;
  SDL_TextInputActive         : TSDL_TextInputActive;
  SDL_StopTextInput           : TSDL_StopTextInput;
  SDL_ClearComposition        : TSDL_ClearComposition;
  SDL_SetTextInputArea        : TSDL_SetTextInputArea;
  SDL_GetTextInputArea        : TSDL_GetTextInputArea;
  SDL_HasScreenKeyboardSupport
                              : TSDL_HasScreenKeyboardSupport;
  SDL_ScreenKeyboardShown     : TSDL_ScreenKeyboardShown;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_HasKeyboard            := BindProcedure(AHandle, 'SDL_HasKeyboard');
  @SDL_GetKeyboards           := BindProcedure(AHandle, 'SDL_GetKeyboards');
  @SDL_GetKeyboardNameForID   := BindProcedure(AHandle, 'SDL_GetKeyboardNameForID');
  @SDL_GetKeyboardFocus       := BindProcedure(AHandle, 'SDL_GetKeyboardFocus');
  @SDL_GetKeyboardState       := BindProcedure(AHandle, 'SDL_GetKeyboardState');
  @SDL_ResetKeyboard          := BindProcedure(AHandle, 'SDL_ResetKeyboard');
  @SDL_GetModState            := BindProcedure(AHandle, 'SDL_GetModState');
  @SDL_SetModState            := BindProcedure(AHandle, 'SDL_SetModState');
  @SDL_GetKeyFromScancode     := BindProcedure(AHandle, 'SDL_GetKeyFromScancode');
  @SDL_GetScancodeFromKey     := BindProcedure(AHandle, 'SDL_GetScancodeFromKey');
  @SDL_SetScancodeName        := BindProcedure(AHandle, 'SDL_SetScancodeName');
  @SDL_GetScancodeName        := BindProcedure(AHandle, 'SDL_GetScancodeName');
  @SDL_GetScancodeFromName    := BindProcedure(AHandle, 'SDL_GetScancodeFromName');
  @SDL_GetKeyName             := BindProcedure(AHandle, 'SDL_GetKeyName');
  @SDL_GetKeyFromName         := BindProcedure(AHandle, 'SDL_GetKeyFromName');
  @SDL_StartTextInput         := BindProcedure(AHandle, 'SDL_StartTextInput');
  @SDL_StartTextInputWithProperties
                              := BindProcedure(AHandle, 'SDL_StartTextInputWithProperties');
  @SDL_TextInputActive        := BindProcedure(AHandle, 'SDL_TextInputActive');
  @SDL_StopTextInput          := BindProcedure(AHandle, 'SDL_StopTextInput');
  @SDL_ClearComposition       := BindProcedure(AHandle, 'SDL_ClearComposition');
  @SDL_SetTextInputArea       := BindProcedure(AHandle, 'SDL_SetTextInputArea');
  @SDL_GetTextInputArea       := BindProcedure(AHandle, 'SDL_GetTextInputArea');
  @SDL_HasScreenKeyboardSupport
                              := BindProcedure(AHandle, 'SDL_HasScreenKeyboardSupport');
  @SDL_ScreenKeyboardShown    := BindProcedure(AHandle, 'SDL_ScreenKeyboardShown');
end;

end.
