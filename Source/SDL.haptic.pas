unit SDL.haptic;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.joystick;

type
  TSDL_Haptic = record end;
  PSDL_Haptic = ^TSDL_Haptic;
  PPSDL_Haptic = ^PSDL_Haptic;

const
  SDL_HAPTIC_CONSTANT         = 1 shl 0;
  SDL_HAPTIC_SINE             = 1 shl 1;
  SDL_HAPTIC_SQUARE           = 1 shl 2;
  SDL_HAPTIC_TRIANGLE         = 1 shl 3;
  SDL_HAPTIC_SAWTOOTHUP       = 1 shl 4;
  SDL_HAPTIC_SAWTOOTHDOWN     = 1 shl 5;
  SDL_HAPTIC_RAMP             = 1 shl 6;
  SDL_HAPTIC_SPRING           = 1 shl 7;
  SDL_HAPTIC_DAMPER           = 1 shl 8;
  SDL_HAPTIC_INERTIA          = 1 shl 9;
  SDL_HAPTIC_FRICTION         = 1 shl 10;

  SDL_HAPTIC_LEFTRIGHT        = 1 shl 11;
  SDL_HAPTIC_RESERVED1        = 1 shl 12;
  SDL_HAPTIC_RESERVED2        = 1 shl 13;
  SDL_HAPTIC_RESERVED3        = 1 shl 14;
  SDL_HAPTIC_CUSTOM           = 1 shl 15;
  SDL_HAPTIC_GAIN             = 1 shl 16;
  SDL_HAPTIC_AUTOCENTER       = 1 shl 17;
  SDL_HAPTIC_STATUS           = 1 shl 18;
  SDL_HAPTIC_PAUSE            = 1 shl 19;

const
  SDL_HAPTIC_POLAR            = 0;
  SDL_HAPTIC_CARTESIAN        = 1;
  SDL_HAPTIC_SPHERICAL        = 2;
  SDL_HAPTIC_STEERING_AXIS    = 3;

const
  SDL_HAPTIC_INFINITY         = 4294967295;

type
  TSDL_HapticDirection = record
    &type                       : Uint8;
    dir                         : array[0..2] of Sint32;
  end;
  PSDL_HapticDirection = ^TSDL_HapticDirection;

  TSDL_HapticConstant = record
    &type                       : Uint16;
    direction                   : TSDL_HapticDirection;
    length                      : Uint32;
    delay                       : Uint16;
    button                      : Uint16;
    interval                    : Uint16;
    level                       : Sint16;

    attack_length               : Uint16;
    attack_level                : Uint16;
    fade_length                 : Uint16;
    fade_level                  : Uint16;
  end;
  PSDL_HapticConstant = ^TSDL_HapticConstant;

  TSDL_HapticPeriodic = record
    &type                       : Uint16;
    direction                   : TSDL_HapticDirection;
    length                      : Uint32;
    delay                       : Uint16;

    button                      : Uint16;
    interval                    : Uint16;

    period                      : Uint16;
    magnitude                   : Sint16;
    offset                      : Sint16;
    phase                       : Uint16;

    attack_length               : Uint16;
    attack_level                : Uint16;
    fade_length                 : Uint16;
    fade_level                  : Uint16;
  end;
  PSDL_HapticPeriodic = ^TSDL_HapticPeriodic;

  TSDL_HapticCondition = record
    &type                       : Uint16;
    direction                   : TSDL_HapticDirection;

    legnth                      : Uint32;
    delay                       : Uint16;

    button                      : Uint16;
    interval                    : Uint16;

    right_sat                   : array[0..2] of Uint16;
    left_sat                    : array[0..2] of Uint16;
    right_coeff                 : array[0..2] of Sint16;
    left_coeff                  : array[0..2] of Sint16;
    deadband                    : array[0..2] of Uint16;
    center                      : array[0..2] of Sint16;
  end;
  PSDL_HapticCondition = ^TSDL_HapticCondition;

  TSDL_HapticRamp = record
    &type                       : Uint16;
    direction                   : TSDL_HapticDirection;

    length                      : Uint32;
    delay                       : Uint16;

    button                      : Uint16;
    interval                    : Uint16;

    start                       : Sint16;
    &end                        : Sint16;

    attack_legnth               : Uint16;
    attack_level                : Uint16;
    fade_length                 : Uint16;
    fade_level                  : Uint16;
  end;
  PSDL_HapticRamp = ^TSDL_HapticRamp;

  TSDL_HapticLeftRight = record
    &type                       : Uint16;

    length                      : Uint32;

    large_magnitude             : Uint16;
    small_magnitude             : Uint16;
  end;
  PSDL_HapticLeftRight = ^TSDL_HapticLeftRight;

  TSDL_HapticCustom = record
    &type                       : Uint16;
    direction                   : TSDL_HapticDirection;

    length                      : Uint32;
    delay                       : Uint16;

    button                      : Uint16;
    interval                    : Uint16;

    channels                    : Uint8;
    period                      : Uint16;
    samples                     : Uint16;
    data                        : PUint16;

    attack_length               : Uint16;
    attack_level                : Uint16;
    fade_length                 : Uint16;
    fade_level                  : Uint16;
  end;
  PSDL_HapticCustom = ^TSDL_HapticCustom;

  TSDL_HapticEffect = record
    &type                       : Uint16;
    constant                    : TSDL_HapticConstant;
    periodic                    : TSDL_HapticPeriodic;
    condition                   : TSDL_HapticCondition;
    ramp                        : TSDL_HapticRamp;
    leftright                   : TSDL_HapticLeftRight;
    custom                      : TSDL_HapticCustom;
  end;
  PSDL_HapticEffect = ^TSDL_HapticEffect;

  TSDL_HapticID               = Uint32;
  PSDL_HapticID               = ^TSDL_HapticID;

  /// <summary>
  ///  Get a list of currently connected haptic devices.
  /// </summary>
  TSDL_GetHaptics             = function (var Acount: int): PSDL_HapticID; cdecl;

  /// <summary>
  ///  Get the implementation dependent name of a haptic device.
  /// </summary>
  TSDL_GetHapticNameForID     = function (Ainstance_id: TSDL_HapticID): PAnsiChar; cdecl;

  /// <summary>
  ///  Open a haptic device for use.
  /// </summary>
  TSDL_OpenHaptic             = function (Ainstance_id: TSDL_HapticID): PSDL_Haptic; cdecl;

  /// <summary>
  ///  Get the SDL_Haptic associated with an instance ID, if it has been opened.
  /// </summary>
  TSDL_GetHapticFromID        = function (Ainstance_id: TSDL_HapticID): PSDL_Haptic; cdecl;

  /// <summary>
  ///  Get the instance ID of an opened haptic device.
  /// </summary>
  TSDL_GetHapticID            = function (Ahaptic: PSDL_Haptic): TSDL_HapticID; cdecl;

  /// <summary>
  ///  Get the implementation dependent name of a haptic device.
  /// </summary>
  TSDL_GetHapticName          = function (Ahaptic: PSDL_Haptic): PAnsiChar; cdecl;

  /// <summary>
  ///  Query whether or not the current mouse has haptic capabilities.
  /// </summary>
  TSDL_IsMouseHaptic          = function (): bool; cdecl;

  /// <summary>
  ///  Try to open a haptic device from the current mouse.
  /// </summary>
  TSDL_OpenHapticFromMouse    = function (): PSDL_Haptic; cdecl;

  /// <summary>
  ///  Query if a joystick has haptic features.
  /// </summary>
  TSDL_IsJoystickHaptic       = function (Ajoystick: PSDL_Joystick): bool; cdecl;

  /// <summary>
  ///  Open a haptic device for use from a joystick device.
  /// </summary>
  TSDL_OpenHapticFromJoystick = function (Ajoystick: PSDL_Joystick): PSDL_Haptic; cdecl;

  /// <summary>
  ///  Close a haptic device previously opened with SDL_OpenHaptic().
  /// </summary>
  TSDL_CloseHaptic            = procedure (Ahaptic: PSDL_Haptic); cdecl;

  /// <summary>
  ///  Get the number of effects a haptic device can store.
  /// </summary>
  TSDL_GetMaxHapticEffects    = function (Ahaptic: PSDL_Haptic): int; cdecl;

  /// <summary>
  ///  Get the number of effects a haptic device can play at the same time.
  /// </summary>
  TSDL_GetMaxHapticEffectsPlaying
                              = function (Ahaptic: PSDL_Haptic): int; cdecl;

  /// <summary>
  ///  Get the haptic device's supported features in bitwise manner.
  /// </summary>
  TSDL_GetHapticFeatures      = function (Ahaptic: PSDL_Haptic): Uint32; cdecl;

  /// <summary>
  ///  Get the number of haptic axes the device has.
  /// </summary>
  TSDL_GetNumHapticAxes       = function (Ahaptic: PSDL_Haptic): int; cdecl;

  /// <summary>
  ///  Check to see if an effect is supported by a haptic device.
  /// </summary>
  TSDL_HapticEffectSupported  = function (Ahaptic: PSDL_Haptic; const Aeffect: PSDL_HapticEffect): bool; cdecl;

  /// <summary>
  ///  Create a new haptic effect on a specified device.
  /// </summary>
  TSDL_CreateHapticEffect     = function (Ahaptic: PSDL_Haptic; const Aeffect: PSDL_HapticEffect): int; cdecl;

  /// <summary>
  ///  Update the properties of an effect.
  /// </summary>
  TSDL_UpdateHapticEffect     = function (Ahaptic: PSDL_Haptic; Aeffect: int; const Adata: PSDL_HapticEffect): bool; cdecl;

  /// <summary>
  ///  Run the haptic effect on its associated haptic device.
  /// </summary>
  TSDL_RunHapticEffect        = function (Ahaptic: PSDL_Haptic; Aeffect: int; Aiterations: Uint32): bool; cdecl;

  /// <summary>
  ///  Stop the haptic effect on its associated haptic device.
  /// </summary>
  TSDL_StopHapticEffect       = function (Ahaptic: PSDL_Haptic; Aeffect: int): bool; cdecl;

  /// <summary>
  ///  Destroy a haptic effect on the device.
  /// </summary>
  TSDL_DestroyHapticEffect    = procedure (Ahaptic: PSDL_Haptic; Aeffect: int); cdecl;

  /// <summary>
  ///  Get the status of the current effect on the specified haptic device.
  /// </summary>
  TSDL_GetHapticEffectStatus  = function (Ahaptic: PSDL_Haptic; Aeffect: int): bool; cdecl;

  /// <summary>
  ///  Set the global gain of the specified haptic device.
  /// </summary>
  TSDL_SetHapticGain          = function (Ahaptic: PSDL_Haptic; Again: int): bool; cdecl;

  /// <summary>
  ///  Set the global autocenter of the device.
  /// </summary>
  TSDL_SetHapticAutocenter    = function (Ahaptic: PSDL_Haptic; Aautocenter: int): bool; cdecl;

  /// <summary>
  ///  Pause a haptic device.
  /// </summary>
  TSDL_PauseHaptic            = function (Ahaptic: PSDL_Haptic): bool; cdecl;

  /// <summary>
  ///  Resume a haptic device.
  /// </summary>
  TSDL_ResumeHaptic           = function (Ahaptic: PSDL_Haptic): bool; cdecl;

  /// <summary>
  ///  Stop all the currently playing effects on a haptic device.
  /// </summary>
  TSDL_StopHapticEffects      = function (Ahaptic: PSDL_Haptic): bool; cdecl;

  /// <summary>
  ///  Check whether rumble is supported on a haptic device.
  /// </summary>
  TSDL_HapticRumbleSupported  = function (Ahaptic: PSDL_Haptic): bool; cdecl;

  /// <summary>
  ///  Initialize a haptic device for simple rumble playback.
  /// </summary>
  TSDL_InitHapticRumble       = function (Ahaptic: PSDL_Haptic): bool; cdecl;

  /// <summary>
  ///  Run a simple rumble effect on a haptic device.
  /// </summary>
  TSDL_PlayHapticRumble       = function (Ahaptic: PSDL_Haptic; Astrength: float; Alength: Uint32): bool; cdecl;

  /// <summary>
  ///  Stop the simple rumble on a haptic device.
  /// </summary>
  TSDL_StopHapticRumble       = function (Ahaptic: PSDL_Haptic): bool; cdecl;

var
  SDL_GetHaptics              : TSDL_GetHaptics;
  SDL_GetHapticNameForID      : TSDL_GetHapticNameForID;
  SDL_OpenHaptic              : TSDL_OpenHaptic;
  SDL_GetHapticFromID         : TSDL_GetHapticFromID;
  SDL_GetHapticID             : TSDL_GetHapticID;
  SDL_GetHapticName           : TSDL_GetHapticName;
  SDL_IsMouseHaptic           : TSDL_IsMouseHaptic;
  SDL_OpenHapticFromMouse     : TSDL_OpenHapticFromMouse;
  SDL_IsJoystickHaptic        : TSDL_IsJoystickHaptic;
  SDL_OpenHapticFromJoystick  : TSDL_OpenHapticFromJoystick;
  SDL_CloseHaptic             : TSDL_CloseHaptic;
  SDL_GetMaxHapticEffects     : TSDL_GetMaxHapticEffects;
  SDL_GetMaxHapticEffectsPlaying
                              : TSDL_GetMaxHapticEffectsPlaying;
  SDL_GetHapticFeatures       : TSDL_GetHapticFeatures;
  SDL_GetNumHapticAxes        : TSDL_GetNumHapticAxes;
  SDL_HapticEffectSupported   : TSDL_HapticEffectSupported;
  SDL_CreateHapticEffect      : TSDL_CreateHapticEffect;
  SDL_UpdateHapticEffect      : TSDL_UpdateHapticEffect;
  SDL_RunHapticEffect         : TSDL_RunHapticEffect;
  SDL_StopHapticEffect        : TSDL_StopHapticEffect;
  SDL_DestroyHapticEffect     : TSDL_DestroyHapticEffect;
  SDL_GetHapticEffectStatus   : TSDL_GetHapticEffectStatus;
  SDL_SetHapticGain           : TSDL_SetHapticGain;
  SDL_SetHapticAutocenter     : TSDL_SetHapticAutocenter;
  SDL_PauseHaptic             : TSDL_PauseHaptic;
  SDL_ResumeHaptic            : TSDL_ResumeHaptic;
  SDL_StopHapticEffects       : TSDL_StopHapticEffects;
  SDL_HapticRumbleSupported   : TSDL_HapticRumbleSupported;
  SDL_InitHapticRumble        : TSDL_InitHapticRumble;
  SDL_PlayHapticRumble        : TSDL_PlayHapticRumble;
  SDL_StopHapticRumble        : TSDL_StopHapticRumble;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetHaptics             := BindProcedure(AHandle, 'SDL_GetHaptics');
  @SDL_GetHapticNameForID     := BindProcedure(AHandle, 'SDL_GetHapticNameForID');
  @SDL_OpenHaptic             := BindProcedure(AHandle, 'SDL_OpenHaptic');
  @SDL_GetHapticFromID        := BindProcedure(AHandle, 'SDL_GetHapticFromID');
  @SDL_GetHapticID            := BindProcedure(AHandle, 'SDL_GetHapticID');
  @SDL_GetHapticName          := BindProcedure(AHandle, 'SDL_GetHapticName');
  @SDL_IsMouseHaptic          := BindProcedure(AHandle, 'SDL_IsMouseHaptic');
  @SDL_OpenHapticFromMouse    := BindProcedure(AHandle, 'SDL_OpenHapticFromMouse');
  @SDL_IsJoystickHaptic       := BindProcedure(AHandle, 'SDL_IsJoystickHaptic');
  @SDL_OpenHapticFromJoystick := BindProcedure(AHandle, 'SDL_OpenHapticFromJoystick');
  @SDL_CloseHaptic            := BindProcedure(AHandle, 'SDL_CloseHaptic');
  @SDL_GetMaxHapticEffects    := BindProcedure(AHandle, 'SDL_GetMaxHapticEffects');
  @SDL_GetMaxHapticEffectsPlaying
                              := BindProcedure(AHandle, 'SDL_GetMaxHapticEffectsPlaying');
  @SDL_GetHapticFeatures      := BindProcedure(AHandle, 'SDL_GetHapticFeatures');
  @SDL_GetNumHapticAxes       := BindProcedure(AHandle, 'SDL_GetNumHapticAxes');
  @SDL_HapticEffectSupported  := BindProcedure(AHandle, 'SDL_HapticEffectSupported');
  @SDL_CreateHapticEffect     := BindProcedure(AHandle, 'SDL_CreateHapticEffect');
  @SDL_UpdateHapticEffect     := BindProcedure(AHandle, 'SDL_UpdateHapticEffect');
  @SDL_RunHapticEffect        := BindProcedure(AHandle, 'SDL_RunHapticEffect');
  @SDL_StopHapticEffect       := BindProcedure(AHandle, 'SDL_StopHapticEffect');
  @SDL_DestroyHapticEffect    := BindProcedure(AHandle, 'SDL_DestroyHapticEffect');
  @SDL_GetHapticEffectStatus  := BindProcedure(AHandle, 'SDL_GetHapticEffectStatus');
  @SDL_SetHapticGain          := BindProcedure(AHandle, 'SDL_SetHapticGain');
  @SDL_SetHapticAutocenter    := BindProcedure(AHandle, 'SDL_SetHapticAutocenter');
  @SDL_PauseHaptic            := BindProcedure(AHandle, 'SDL_PauseHaptic');
  @SDL_ResumeHaptic           := BindProcedure(AHandle, 'SDL_ResumeHaptic');
  @SDL_StopHapticEffects      := BindProcedure(AHandle, 'SDL_StopHapticEffects');
  @SDL_HapticRumbleSupported  := BindProcedure(AHandle, 'SDL_HapticRumbleSupported');
  @SDL_InitHapticRumble       := BindProcedure(AHandle, 'SDL_InitHapticRumble');
  @SDL_PlayHapticRumble       := BindProcedure(AHandle, 'SDL_PlayHapticRumble');
  @SDL_StopHapticRumble       := BindProcedure(AHandle, 'SDL_StopHapticRumble');
end;

end.
