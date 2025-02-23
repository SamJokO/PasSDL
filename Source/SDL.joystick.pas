unit SDL.joystick;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.guid,
  SDL.power,
  SDL.sensor,
  SDL.properties;

type
  TSDL_Joystick = record end;
  PSDL_Joystick = ^TSDL_Joystick;

  TSDL_JoystickID             = Uint32;
  PSDL_JoystickID             = ^TSDL_JoystickID;

  TSDL_JoystickType           = (
                                  SDL_JOYSTICK_TYPE_UNKNOWN,
                                  SDL_JOYSTICK_TYPE_GAMEPAD,
                                  SDL_JOYSTICK_TYPE_WHEEL,
                                  SDL_JOYSTICK_TYPE_ARCADE_STICK,
                                  SDL_JOYSTICK_TYPE_FLIGHT_STICK,
                                  SDL_JOYSTICK_TYPE_DANCE_PAD,
                                  SDL_JOYSTICK_TYPE_GUITAR,
                                  SDL_JOYSTICK_TYPE_DRUM_KIT,
                                  SDL_JOYSTICK_TYPE_ARCADE_PAD,
                                  SDL_JOYSTICK_TYPE_THROTTLE,
                                  SDL_JOYSTICK_TYPE_COUNT
                                );
  PSDL_JoystickType           = ^TSDL_JoystickType;

  TSDL_JoystickConnectionState= (
                                  SDL_JOYSTICK_CONNECTION_INVALID = -1,
                                  SDL_JOYSTICK_CONNECTION_UNKNOWN,
                                  SDL_JOYSTICK_CONNECTION_WIRED,
                                  SDL_JOYSTICK_CONNECTION_WIRELESS
                                );
  PSDL_JoystickConnectionState= ^TSDL_JoystickConnectionState;

const
  SDL_JOYSTICK_AXIS_MAX       = 32767;
  SDL_JOYSTICK_AXIS_MIN       = -32768;

type
  /// <summary>
  ///  Locking for atomic access to the joystick API.
  /// </summary>
  TSDL_LockJoysticks          = procedure (); cdecl;

  /// <summary>
  ///  Unlocking for atomic access to the joystick API.
  /// </summary>
  TSDL_UnlockJoysticks        = procedure (); cdecl;

  /// <summary>
  ///  Return whether a joystick is currently connected.
  /// </summary>
  TSDL_HasJoystick            = function (): bool; cdecl;

  /// <summary>
  ///  Get a list of currently connected joysticks.
  /// </summary>
  TSDL_GetJoysticks           = function (var Acount: int): PSDL_JoystickID; cdecl;

  /// <summary>
  ///  Get the implementation dependent name of a joystick.
  /// </summary>
  TSDL_GetJoystickNameForID   = function (Ainstance_id: TSDL_JoystickID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the implementation dependent path of a joystick.
  /// </summary>
  TSDL_GetJoystickPathForID   = function (Ainstance_id: TSDL_JoystickID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the player index of a joystick.
  /// </summary>
  TSDL_GetJoystickPlayerIndexForID
                              = function (Ainstance_id: TSDL_JoystickID): int; cdecl;

  /// <summary>
  ///  Get the implementation-dependent GUID of a joystick.
  /// </summary>
  TSDL_GetJoystickGUIDForID   = function (Ainstance_id: TSDL_JoystickID): TSDL_GUID; cdecl;

  /// <summary>
  ///  Get the USB vendor ID of a joystick, if available.
  /// </summary>
  TSDL_GetJoystickVendorForID = function (Ainstance_id: TSDL_JoystickID): Uint16; cdecl;

  /// <summary>
  ///  Get the USB product ID of a joystick, if available.
  /// </summary>
  TSDL_GetJoystickProductForID= function (Ainstnace_id: TSDL_JoystickID): Uint16; cdecl;

  /// <summary>
  ///  Get the product version of a joystick, if available.
  /// </summary>
  TSDL_GetJoystickProductVersionForID
                              = function (Ainstance_id: TSDL_JoystickID): Uint16; cdecl;

  /// <summary>
  ///  Get the type of a joystick, if available.
  /// </summary>
  TSDL_GetJoystickTypeForID   = function (Ainstance_id: TSDL_JoystickID): TSDL_JoystickType; cdecl;

  /// <summary>
  ///  Open a joystick for use.
  /// </summary>
  TSDL_OpenJoystick           = function (Ainstance_id: TSDL_JoystickID): PSDL_Joystick; cdecl;

  /// <summary>
  ///  Get the SDL_Joystick associated with an instance ID, if it has been opened.
  /// </summary>
  TSDL_GetJoystickFromID      = function (Ainstance_id: TSDL_JoystickID): PSDL_Joystick; cdecl;

  /// <summary>
  ///  Get the SDL_Joystick associated with a player index.
  /// </summary>
  TSDL_GetJoystickFromPlayerIndex
                              = function (Aplayer_index: int): PSDL_Joystick; cdecl;

  TSDL_VirtualJoystickTouchpadDesc = record
    nfingers                    : Uint16;
    padding                     : array[0..2] of Uint16;
  end;
  PSDL_VirtualJoystickTouchpadDesc = ^TSDL_VirtualJoystickTouchpadDesc;

  TSDL_VirtualJoystickSensorDesc = record
    &type                       : TSDL_SensorType;
    rate                        : float;
  end;
  PSDL_VirtualJoystickSensorDesc = ^TSDL_VirtualJoystickSensorDesc;

  TSDL_VirtualJoystickDesc = record
    version                     : Uint32;
    &type                       : Uint16;
    padding                     : Uint16;
    vendor_id                   : Uint16;
    product_id                  : Uint16;
    naxes                       : Uint16;
    nbuttons                    : Uint16;
    nballs                      : Uint16;
    nhats                       : Uint16;
    ntouchpads                  : Uint16;
    nsensors                    : Uint16;
    padding2                    : array[0..1] of Uint16;
    button_mask                 : Uint32;

    axis_mask                   : Uint32;

    name                        : PAnsiChar;
    touchpads                   : PSDL_VirtualJoystickTouchpadDesc;
    sensors                     : PSDL_VirtualJoystickSensorDesc;

    userdata                    : Pointer;

    Update                      : procedure (Auserdata: Pointer); cdecl;
    SetPlayerIndex              : procedure (Auserdata: Pointer; Aplayer_index: int); cdecl;
    Rumble                      : procedure (Auserdata: Pointer; Alow_frequency_rumble: Uint16; Ahigh_frequency_rumble: Uint16); cdecl;
    RumbleTriggers              : procedure (Auserdata: Pointer; Aleft_rumble: Uint16; Aright_rumble: Uint16); cdecl;
    SetLED                      : procedure (Auserdata: Pointer; Ared: Uint8; Agreen: Uint8; Ablue: Uint8); cdecl;
    SendEffect                  : procedure (Auserdata: Pointer; const Adata: Pointer; Asize: int); cdecl;
    SetSensorEnabled            : procedure (Auserdata: Pointer; Aenabled: bool); cdecl;
    Cleanup                     : procedure (Auserdata: Pointer); cdecl;
  end;
  PSDL_VirtualJoystickDesc = ^TSDL_VirtualJoystickDesc;

  /// <summary>
  ///  Attach a new virtual joystick.
  /// </summary>
  TSDL_AttachVirtualJoystick  = function (const Adesc: PSDL_VirtualJoystickDesc): TSDL_JoystickID; cdecl;

  /// <summary>
  ///  Detach a virtual joystick.
  /// </summary>
  TSDL_DetachVirtualJoystick  = function (Ainstance_id: TSDL_JoystickID): bool; cdecl;

  /// <summary>
  ///  Query whether or not a joystick is virtual.
  /// </summary>
  TSDL_IsJoystickVirtual      = function (Ainstance_id: TSDL_JoystickID): bool; cdecl;

  /// <summary>
  ///  Set the state of an axis on an opened virtual joystick.
  /// </summary>
  TSDL_SetJoystickVirtualAxis = function (Ajoystick: PSDL_Joystick; Aaxis: int; Avalue: Sint16): bool; cdecl;

  /// <summary>
  ///  Generate ball motion on an opened virtual joystick.
  /// </summary>
  TSDL_SetJoystickVirtualBall = function (Ajoystick: PSDL_Joystick; Aball: int; Axrel: Sint16; Ayrel: Sint16): bool; cdecl;

  /// <summary>
  ///  Set the state of a button on an opened virtual joystick.
  /// </summary>
  TSDL_SetJoystickVirtualButton
                              = function (Ajoystick: PSDL_Joystick; Abutton: int; Adown: bool): bool; cdecl;

  /// <summary>
  ///  Set the state of a hat on an opened virtual joystick.
  /// </summary>
  TSDL_SetJoystickVirtualHat  = function (Ajoystick: PSDL_Joystick; Ahat: int; Avalue: Uint8): bool; cdecl;

  /// <summary>
  ///  Set touchpad finger state on an opened virtual joystick.
  /// </summary>
  TSDL_SetJoystickVirtualTouchpad
                              = function (Ajoystick: PSDL_Joystick; Atouchpad: int; Afinger: int; Adown: bool; Ax: float; Ay: float; Apressure: float): bool; cdecl;

  /// <summary>
  ///  Send a sensor update for an opened virtual joystick.
  /// </summary>
  TSDL_SendJoystickVirtualSensorData
                              = function (Ajoystick: PSDL_Joystick; Atype: TSDL_SensorType; Asensor_timestamp: Uint64; const Adata: Pfloat; Anum_values: int): bool; cdecl;

  /// <summary>
  ///  Get the properties associated with a joystick.
  /// </summary>
  TSDL_GetJoystickProperties  = function (Ajoystick: PSDL_Joystick): TSDL_PropertiesID; cdecl;

const
  SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN          = 'SDL.joystick.cap.mono_led';
  SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN           = 'SDL.joystick.cap.rgb_led';
  SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN        = 'SDL.joystick.cap.player_led';
  SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN            = 'SDL.joystick.cap.rumble';
  SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN    = 'SDL.joystick.cap.trigger_rumble';

type
  /// <summary>
  ///  Get the implementation dependent name of a joystick.
  /// </summary>
  TSDL_GetJoystickName        = function (Ajoystick: PSDL_Joystick): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the implementation dependent path of a joystick.
  /// </summary>
  TSDL_GetJoystickPath        = function (Ajoystick: PSDL_Joystick): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the player index of an opened joystick.
  /// </summary>
  TSDL_GetJoystickPlayerIndex = function (Ajoystick: PSDL_Joystick): int; cdecl;

  /// <summary>
  ///  Set the player index of an opened joystick.
  /// </summary>
  TSDL_SetJoystickPlayerIndex = function (Ajoystick: PSDL_Joystick; Aplayer_index: int): bool; cdecl;

  /// <summary>
  ///  Get the implementation-dependent GUID for the joystick.
  /// </summary>
  TSDL_GetJoystickGUID        = function (Ajoystick: PSDL_Joystick): TSDL_GUID; cdecl;

  /// <summary>
  ///  Get the USB vendor ID of an opened joystick, if available.
  /// </summary>
  TSDL_GetJoystickVendor      = function (Ajoystick: PSDL_Joystick): Uint16; cdecl;

  /// <summary>
  ///  Get the USB product ID of an opened joystick, if available.
  /// </summary>
  TSDL_GetJoystickProduct     = function (Ajoystick: PSDL_Joystick): Uint16; cdecl;

  /// <summary>
  ///  Get the product version of an opened joystick, if available.
  /// </summary>
  TSDL_GetJoystickProductVersion
                              = function (Ajoystick: PSDL_Joystick): Uint16; cdecl;

  /// <summary>
  ///  Get the firmware version of an opened joystick, if available.
  /// </summary>
  TSDL_GetJoystickFirmwareVersion
                              = function (Ajoystick: PSDL_Joystick): Uint16; cdecl;

  /// <summary>
  ///  Get the serial number of an opened joystick, if available.
  /// </summary>
  TSDL_GetJoystickSerial      = function (Ajoystick: PSDL_Joystick): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the type of an opened joystick.
  /// </summary>
  TSDL_GetJoystickType        = function (Ajoystick: PSDL_Joystick): TSDL_JoystickType; cdecl;

  /// <summary>
  ///  Get the device information encoded in a SDL_GUID structure.
  /// </summary>
  TSDL_GetJoystickGUIDInfo    = procedure (Aguid: TSDL_GUID; var Avendor: Uint16; var Aproduct: Uint16; Aversion: Uint16; Acrc16: Uint16); cdecl;

  /// <summary>
  ///  Get the status of a specified joystick.
  /// </summary>
  TSDL_JoystickConnected      = function (Ajoystick: PSDL_Joystick): bool; cdecl;

  /// <summary>
  ///  Get the instance ID of an opened joystick.
  /// </summary>
  TSDL_GetJoystickID          = function (Ajoystick: PSDL_Joystick): TSDL_JoystickID; cdecl;

  /// <summary>
  ///  Get the number of general axis controls on a joystick.
  /// </summary>
  TSDL_GetNumJoystickAxes     = function (Ajoystick: PSDL_Joystick): int; cdecl;

  /// <summary>
  ///  Get the number of trackballs on a joystick.
  /// </summary>
  TSDL_GetNumJoystickBalls    = function (Ajoystick: PSDL_Joystick): int; cdecl;

  /// <summary>
  ///  Get the number of POV hats on a joystick.
  /// </summary>
  TSDL_GetNumJoystickHats     = function (Ajoystick: PSDL_Joystick): int; cdecl;

  /// <summary>
  ///  Get the number of buttons on a joystick.
  /// </summary>
  TSDL_GetNumJoystickButtons  = function (Ajoystick: PSDL_Joystick): int; cdecl;

  /// <summary>
  ///  Set the state of joystick event processing.
  /// </summary>
  TSDL_SetJoystickEventsEnabled
                              = procedure (Aenabled: bool); cdecl;

  /// <summary>
  ///  Query the state of joystick event processing.
  /// </summary>
  TSDL_JoystickEventsEnabled  = function (): bool; cdecl;

  /// <summary>
  ///  Update the current state of the open joysticks.
  /// </summary>
  TSDL_UpdateJoysticks        = procedure (); cdecl;

  /// <summary>
  ///  Get the current state of an axis control on a joystick.
  /// </summary>
  TSDL_GetJoystickAxis        = function (Ajoystick: PSDL_Joystick; Aaxis: int): Sint16; cdecl;

  /// <summary>
  ///  Get the initial state of an axis control on a joystick.
  /// </summary>
  TSDL_GetJoystickAxisInitialState
                              = function (Ajoystick: PSDL_Joystick; Aasix: int; var Astate: Sint16): bool; cdecl;

  /// <summary>
  ///  Get the ball axis change since the last poll.
  /// </summary>
  TSDL_GetJoystickBall        = function (Ajoystick: PSDL_Joystick; Aball: int; var Adx: int; var Ady: int): bool; cdecl;

  /// <summary>
  ///  Get the current state of a POV hat on a joystick.
  /// </summary>
  TSDL_GetJoystickHat         = function (Ajoystick: PSDL_Joystick; Ahat: int): Uint8; cdecl;

const
  SDL_HAT_CENTERED            = $00;
  SDL_HAT_UP                  = $01;
  SDL_HAT_RIGHT               = $02;
  SDL_HAT_DOWN                = $04;
  SDL_HAT_LEFT                = $08;
  SDL_HAT_RIGHTUP             = SDL_HAT_RIGHT or SDL_HAT_UP;
  SDL_HAT_RIGHTDOWN           = SDL_HAT_RIGHT or SDL_HAT_DOWN;
  SDL_HAT_LEFTUP              = SDL_HAT_LEFT or SDL_HAT_UP;
  SDL_HAT_LEFTDOWN            = SDL_HAT_LEFT or SDL_HAT_DOWN;

type
  /// <summary>
  ///  Get the current state of a button on a joystick.
  /// </summary>
  TSDL_GetJoystickButton      = function (Ajoystick: PSDL_Joystick; Abutton: int): bool; cdecl;

  /// <summary>
  ///  Start a rumble effect.
  /// </summary>
  TSDL_RumbleJoystick         = function (Ajoystick: PSDL_Joystick; Alow_frequency_rumble: Uint16; Ahigh_frequency_rumble: Uint16; Aduration_ms: Uint32): bool; cdecl;

  /// <summary>
  ///  Start a rumble effect in the joystick's triggers.
  /// </summary>
  TSDL_RumbleJoystickTriggers = function (Ajoystick: PSDL_Joystick; Aleft_rumble: Uint16; Aright_rumble: Uint16; Aduration_ms: Uint32): bool; cdecl;

  /// <summary>
  ///  Update a joystick's LED color.
  /// </summary>
  TSDL_SetJoystickLED         = function (Ajoystick: PSDL_Joystick; Ared: Uint8; Agreen: Uint8; Ablue: Uint8): bool; cdecl;

  /// <summary>
  ///  Send a joystick specific effect packet.
  /// </summary>
  TSDL_SendJoystickEffect     = function (Ajoystick: PSDL_Joystick; const Adata: Pointer; Asize: int): bool; cdecl;

  /// <summary>
  ///  Close a joystick previously opened with SDL_OpenJoystick().
  /// </summary>
  TSDL_CloseJoystick          = procedure (Ajoystick: PSDL_Joystick); cdecl;

  /// <summary>
  ///  Get the connection state of a joystick.
  /// </summary>
  TSDL_GetJoystickConnectionState
                              = function (Ajoystick: PSDL_Joystick): TSDL_JoystickConnectionState; cdecl;

  /// <summary>
  ///  Get the battery state of a joystick.
  /// </summary>
  TSDL_GetJoystickPowerInfo   = function (Ajoystick: PSDL_Joystick; var Apercent: int): TSDL_PowerState; cdecl;

var
  SDL_LockJoysticks           : TSDL_LockJoysticks;
  SDL_UnlockJoysticks         : TSDL_UnlockJoysticks;
  SDL_HasJoystick             : TSDL_HasJoystick;
  SDL_GetJoysticks            : TSDL_GetJoysticks;
  SDL_GetJoystickNameForID    : TSDL_GetJoystickNameForID;
  SDL_GetJoystickPathForID    : TSDL_GetJoystickPathForID;
  SDL_GetJoystickPlayerIndexForID
                              : TSDL_GetJoystickPlayerIndexForID;
  SDL_GetJoystickGUIDForID    : TSDL_GetJoystickGUIDForID;
  SDL_GetJoystickVendorForID  : TSDL_GetJoystickVendorForID;
  SDL_GetJoystickProductForID : TSDL_GetJoystickProductForID;
  SDL_GetJoystickProductVersionForID
                              : TSDL_GetJoystickProductVersionForID;
  SDL_GetJoystickTypeForID    : TSDL_GetJoystickTypeForID;
  SDL_OpenJoystick            : TSDL_OpenJoystick;
  SDL_GetJoystickFromID       : TSDL_GetJoystickFromID;
  SDL_GetJoystickFromPlayerIndex
                              : TSDL_GetJoystickFromPlayerIndex;
  SDL_AttachVirtualJoystick   : TSDL_AttachVirtualJoystick;
  SDL_DetachVirtualJoystick   : TSDL_DetachVirtualJoystick;
  SDL_IsJoystickVirtual       : TSDL_IsJoystickVirtual;
  SDL_SetJoystickVirtualAxis  : TSDL_SetJoystickVirtualAxis;
  SDL_SetJoystickVirtualBall  : TSDL_SetJoystickVirtualBall;
  SDL_SetJoystickVirtualButton
                              : TSDL_SetJoystickVirtualButton;
  SDL_SetJoystickVirtualHat   : TSDL_SetJoystickVirtualHat;
  SDL_SetJoystickVirtualTouchpad
                              : TSDL_SetJoystickVirtualTouchpad;
  SDL_SendJoystickVirtualSensorData
                              : TSDL_SendJoystickVirtualSensorData;
  SDL_GetJoystickProperties   : TSDL_GetJoystickProperties;
  SDL_GetJoystickName         : TSDL_GetJoystickName;
  SDL_GetJoystickPath         : TSDL_GetJoystickPath;
  SDL_GetJoystickPlayerIndex  : TSDL_GetJoystickPlayerIndex;
  SDL_SetJoystickPlayerIndex  : TSDL_SetJoystickPlayerIndex;
  SDL_GetJoystickGUID         : TSDL_GetJoystickGUID;
  SDL_GetJoystickVendor       : TSDL_GetJoystickVendor;
  SDL_GetJoystickProduct      : TSDL_GetJoystickProduct;
  SDL_GetJoystickProductVersion
                              : TSDL_GetJoystickProductVersion;
  SDL_GetJoystickFirmwareVersion
                              : TSDL_GetJoystickFirmwareVersion;
  SDL_GetJoystickSerial       : TSDL_GetJoystickSerial;
  SDL_GetJoystickType         : TSDL_GetJoystickType;
  SDL_GetJoystickGUIDInfo     : TSDL_GetJoystickGUIDInfo;
  SDL_JoystickConnected       : TSDL_JoystickConnected;
  SDL_GetJoystickID           : TSDL_GetJoystickID;
  SDL_GetNumJoystickAxes      : TSDL_GetNumJoystickAxes;
  SDL_GetNumJoystickBalls     : TSDL_GetNumJoystickBalls;
  SDL_GetNumJoystickHats      : TSDL_GetNumJoystickHats;
  SDL_GetNumJoystickButtons   : TSDL_GetNumJoystickButtons;
  SDL_SetJoystickEventsEnabled
                              : TSDL_SetJoystickEventsEnabled;
  SDL_JoystickEventsEnabled   : TSDL_JoystickEventsEnabled;
  SDL_UpdateJoysticks         : TSDL_UpdateJoysticks;
  SDL_GetJoystickAxis         : TSDL_GetJoystickAxis;
  SDL_GetJoystickAxisInitialState
                              : TSDL_GetJoystickAxisInitialState;
  SDL_GetJoystickBall         : TSDL_GetJoystickBall;
  SDL_GetJoystickHat          : TSDL_GetJoystickHat;
  SDL_GetJoystickButton       : TSDL_GetJoystickButton;
  SDL_RumbleJoystick          : TSDL_RumbleJoystick;
  SDL_RumbleJoystickTriggers  : TSDL_RumbleJoystickTriggers;
  SDL_SetJoystickLED          : TSDL_SetJoystickLED;
  SDL_SendJoystickEffect      : TSDL_SendJoystickEffect;
  SDL_CloseJoystick           : TSDL_CloseJoystick;
  SDL_GetJoystickConnectionState
                              : TSDL_GetJoystickConnectionState;
  SDL_GetJoystickPowerInfo    : TSDL_GetJoystickPowerInfo;


procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_LockJoysticks          := BindProcedure(AHandle, 'SDL_LockJoysticks');
  @SDL_UnlockJoysticks        := BindProcedure(AHandle, 'SDL_UnlockJoysticks');
  @SDL_HasJoystick            := BindProcedure(AHandle, 'SDL_HasJoystick');
  @SDL_GetJoysticks           := BindProcedure(AHandle, 'SDL_GetJoysticks');
  @SDL_GetJoystickNameForID   := BindProcedure(AHandle, 'SDL_GetJoystickNameForID');
  @SDL_GetJoystickPathForID   := BindProcedure(AHandle, 'SDL_GetJoystickPathForID');
  @SDL_GetJoystickPlayerIndexForID
                              := BindProcedure(AHandle, 'SDL_GetJoystickPlayerIndexForID');
  @SDL_GetJoystickGUIDForID   := BindProcedure(AHandle, 'SDL_GetJoystickGUIDForID');
  @SDL_GetJoystickVendorForID := BindProcedure(AHandle, 'SDL_GetJoystickVendorForID');
  @SDL_GetJoystickProductForID:= BindProcedure(AHandle, 'SDL_GetJoystickProductForID');
  @SDL_GetJoystickProductVersionForID
                              := BindProcedure(AHandle, 'SDL_GetJoystickProductVersionForID');
  @SDL_GetJoystickTypeForID   := BindProcedure(AHandle, 'SDL_GetJoystickTypeForID');
  @SDL_OpenJoystick           := BindProcedure(AHandle, 'SDL_OpenJoystick');
  @SDL_GetJoystickFromID      := BindProcedure(AHandle, 'SDL_GetJoystickFromID');
  @SDL_GetJoystickFromPlayerIndex
                              := BindProcedure(AHandle, 'SDL_GetJoystickFromPlayerIndex');
  @SDL_AttachVirtualJoystick  := BindProcedure(AHandle, 'SDL_AttachVirtualJoystick');
  @SDL_DetachVirtualJoystick  := BindProcedure(AHandle, 'SDL_DetachVirtualJoystick');
  @SDL_IsJoystickVirtual      := BindProcedure(AHandle, 'SDL_IsJoystickVirtual');
  @SDL_SetJoystickVirtualAxis := BindProcedure(AHandle, 'SDL_SetJoystickVirtualAxis');
  @SDL_SetJoystickVirtualBall := BindProcedure(AHandle, 'SDL_SetJoystickVirtualBall');
  @SDL_SetJoystickVirtualButton
                              := BindProcedure(AHandle, 'SDL_SetJoystickVirtualButton');
  @SDL_SetJoystickVirtualHat  := BindProcedure(AHandle, 'SDL_SetJoystickVirtualHat');
  @SDL_SetJoystickVirtualTouchpad
                              := BindProcedure(AHandle, 'SDL_SetJoystickVirtualTouchpad');
  @SDL_SendJoystickVirtualSensorData
                              := BindProcedure(AHandle, 'SDL_GetWindowRelativeMouseMode');
  @SDL_GetJoystickProperties  := BindProcedure(AHandle, 'SDL_GetJoystickProperties');
  @SDL_GetJoystickName        := BindProcedure(AHandle, 'SDL_GetJoystickName');
  @SDL_GetJoystickPath        := BindProcedure(AHandle, 'SDL_GetJoystickPath');
  @SDL_GetJoystickPlayerIndex := BindProcedure(AHandle, 'SDL_GetJoystickPlayerIndex');
  @SDL_SetJoystickPlayerIndex := BindProcedure(AHandle, 'SDL_SetJoystickPlayerIndex');
  @SDL_GetJoystickGUID        := BindProcedure(AHandle, 'SDL_GetJoystickGUID');
  @SDL_GetJoystickVendor      := BindProcedure(AHandle, 'SDL_GetJoystickVendor');
  @SDL_GetJoystickProduct     := BindProcedure(AHandle, 'SDL_GetJoystickProduct');
  @SDL_GetJoystickProductVersion
                              := BindProcedure(AHandle, 'SDL_GetJoystickProductVersion');
  @SDL_GetJoystickFirmwareVersion
                              := BindProcedure(AHandle, 'SDL_GetJoystickFirmwareVersion');
  @SDL_GetJoystickSerial      := BindProcedure(AHandle, 'SDL_GetJoystickSerial');
  @SDL_GetJoystickType        := BindProcedure(AHandle, 'SDL_GetJoystickType');
  @SDL_GetJoystickGUIDInfo    := BindProcedure(AHandle, 'SDL_GetJoystickGUIDInfo');
  @SDL_JoystickConnected      := BindProcedure(AHandle, 'SDL_JoystickConnected');
  @SDL_GetJoystickID          := BindProcedure(AHandle, 'SDL_GetJoystickID');
  @SDL_GetNumJoystickAxes     := BindProcedure(AHandle, 'SDL_GetNumJoystickAxes');
  @SDL_GetNumJoystickBalls    := BindProcedure(AHandle, 'SDL_GetNumJoystickBalls');
  @SDL_GetNumJoystickHats     := BindProcedure(AHandle, 'SDL_GetNumJoystickHats');
  @SDL_GetNumJoystickButtons  := BindProcedure(AHandle, 'SDL_GetNumJoystickButtons');
  @SDL_SetJoystickEventsEnabled
                              := BindProcedure(AHandle, 'SDL_SetJoystickEventsEnabled');
  @SDL_JoystickEventsEnabled  := BindProcedure(AHandle, 'SDL_JoystickEventsEnabled');
  @SDL_UpdateJoysticks        := BindProcedure(AHandle, 'SDL_UpdateJoysticks');
  @SDL_GetJoystickAxis        := BindProcedure(AHandle, 'SDL_GetJoystickAxis');
  @SDL_GetJoystickAxisInitialState
                              := BindProcedure(AHandle, 'SDL_GetJoystickAxisInitialState');
  @SDL_GetJoystickBall        := BindProcedure(AHandle, 'SDL_GetJoystickBall');
  @SDL_GetJoystickHat         := BindProcedure(AHandle, 'SDL_GetJoystickHat');
  @SDL_GetJoystickButton      := BindProcedure(AHandle, 'SDL_GetJoystickButton');
  @SDL_RumbleJoystick         := BindProcedure(AHandle, 'SDL_RumbleJoystick');
  @SDL_RumbleJoystickTriggers := BindProcedure(AHandle, 'SDL_RumbleJoystickTriggers');
  @SDL_SetJoystickLED         := BindProcedure(AHandle, 'SDL_SetJoystickLED');
  @SDL_SendJoystickEffect     := BindProcedure(AHandle, 'SDL_SendJoystickEffect');
  @SDL_CloseJoystick          := BindProcedure(AHandle, 'SDL_CloseJoystick');
  @SDL_GetJoystickConnectionState
                              := BindProcedure(AHandle, 'SDL_GetJoystickConnectionState');
  @SDL_GetJoystickPowerInfo   := BindProcedure(AHandle, 'SDL_GetJoystickPowerInfo');
end;

end.
