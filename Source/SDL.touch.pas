unit SDL.touch;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.mouse;

type
  TSDL_TouchID                = Uint64;
  PSDL_TouchID                = ^TSDL_TouchID;

  TSDL_FingerID               = Uint64;
  PSDL_FingerID               = ^TSDL_FingerID;

  TSDL_TouchDeviceType        = (
                                  SDL_TOUCH_DEVICE_INVALID = -1,
                                  SDL_TOUCH_DEVICE_DIRECT,
                                  SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
                                  SDL_TOUCH_DEVICE_INDIRECT_RELATIVE
                                );
  PSDL_TouchDeviceType        = ^TSDL_TouchDeviceType;

  TSDL_Finger = record
    id                          : TSDL_FingerID;
    x                           : float;
    y                           : float;
    pressure                    : float;
  end;
  PSDL_Finger = ^TSDL_Finger;

  function SDL_TOUCH_MOUSEID: TSDL_MouseID; inline;
  function SDL_MOUSE_TOUCHID: TSDL_TouchID; inline;

type
  /// <summary>
  ///  Get a list of registered touch devices.
  /// </summary>
  TSDL_GetTouchDevices        = function (var Acount: int): PSDL_TouchID; cdecl;

  /// <summary>
  ///  Get the touch device name as reported from the driver.
  /// </summary>
  TSDL_GetTouchDeviceName     = function (AtouchID: TSDL_TouchID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the type of the given touch device.
  /// </summary>
  TSDL_GetTouchDeviceType     = function (AtouchID: TSDL_TouchID): TSDL_TouchDeviceType; cdecl;

  /// <summary>
  ///  Get a list of active fingers for a given touch device.
  /// </summary>
  TSDL_GetTouchFingers        = function (AtouchID: TSDL_TouchID; var Acount: int): PSDL_Finger; cdecl;

var
  SDL_GetTouchDevices         : TSDL_GetTouchDevices;
  SDL_GetTouchDeviceName      : TSDL_GetTouchDeviceName;
  SDL_GetTouchDeviceType      : TSDL_GetTouchDeviceType;
  SDL_GetTouchFingers         : TSDL_GetTouchFingers;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_TOUCH_MOUSEID: TSDL_MouseID;
begin
  Result                      := High(TSDL_MouseID);
end;

function SDL_MOUSE_TOUCHID: TSDL_TouchID;
begin
  Result                      := High(TSDL_TouchID);
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetTouchDevices        := BindProcedure(AHandle, 'SDL_GetTouchDevices');
  @SDL_GetTouchDeviceName     := BindProcedure(AHandle, 'SDL_GetTouchDeviceName');
  @SDL_GetTouchDeviceType     := BindProcedure(AHandle, 'SDL_GetTouchDeviceType');
  @SDL_GetTouchFingers        := BindProcedure(AHandle, 'SDL_GetTouchFingers');
end;

end.
