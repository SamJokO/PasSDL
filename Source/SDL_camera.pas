unit SDL_camera;

interface

uses
  SDL.Types,
  SDL_properties,
  SDL_pixels;

type
  TSDL_CameraID               = Uint32;
  PSDL_CameraID               = ^TSDL_CameraID;

  TSDL_Camera = record end;
  PSDL_Camera = ^TSDL_Camera;

  TSDL_CameraSpec = record
    format                      : TSDL_PixelFormat;
    colorspace                  : TSDL_Colorspace;
    width                       : int;
    height                      : int;
    framerate_numerator         : int;
    framerate_denominator       : int;
  end;
  PSDL_CameraSpec = ^TSDL_CameraSpec;
  PPSDL_CameraSpec = ^PSDL_CameraSpec;

  TSDL_CameraPosition         = (
                                  SDL_CAMERA_POSITION_UNKNOWN,
                                  SDL_CAMERA_POSITION_FRONT_FACING,
                                  SDL_CAMERA_POSITION_BACK_FACING
                                );
  PSDL_CameraPosition         = ^TSDL_CameraPosition;

  /// <summary>
  ///  Use this function to get the number of built-in camera drivers.
  /// </summary>
  TSDL_GetNumCameraDrivers    = function (): int; cdecl;

  /// <summary>
  ///  Use this function to get the name of a built in camera driver.
  /// </summary>
  TSDL_GetCameraDriver        = function (AIndex: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the name of the current camera driver.
  /// </summary>
  TSDL_GetCurrentCameraDriver = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Get a list of currently connected camera devices.
  /// </summary>
  TSDL_GetCameras             = function (var ACount: int): PSDL_CameraID; cdecl;

  /// <summary>
  ///  Get the list of native formats/sizes a camera supports.
  /// </summary>
  TSDL_GetCameraSupportedFormats
                              = function (ADevId: TSDL_CameraID; var ACount: int): PPSDL_CameraSpec; cdecl;

  /// <summary>
  ///  Get the human-readable device name for a camera.
  /// </summary>
  TSDL_GetCameraName          = function (AInstance_id: TSDL_CameraID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the position of the camera in relation to the system.
  /// </summary>
  TSDL_GetCameraPosition      = function (AInstance_id: TSDL_CameraID): TSDL_CameraPosition; cdecl;

  /// <summary>
  ///  Open a video recording device (a "camera").
  /// </summary>
  TSDL_OpenCamera             = function (AInstance_id: TSDL_CameraID; const ASpec: PSDL_CameraSpec): PSDL_Camera; cdecl;

  /// <summary>
  ///  Query if camera access has been approved by the user.
  /// </summary>
  TSDL_GetCameraPermissionState
                              = function (ACamera: PSDL_Camera): int; cdecl;

  /// <summary>
  ///  Get the instance ID of an opened camera.
  /// </summary>
  TSDL_GetCameraID            = function (ACamera: PSDL_Camera): TSDL_CameraID; cdecl;

  /// <summary>
  ///  Get the properties associated with an opened camera.
  /// </summary>
  TSDL_GetCameraProperties    = function (ACamera: PSDL_Camera): TSDL_PropertiesID; cdecl;

  /// <summary>
  ///  Get the spec that a camera is using when generating images.
  /// </summary>
  TSDL_GetCameraFormat        = function (ACamera: PSDL_Camera; ASpec: PSDL_CameraSpec): bool; cdecl;

  /// <summary>
  ///  Acquire a frame.
  /// </summary>
  TSDL_AcquireCameraFrame     = function (ACamera: PSDL_Camera; ATimestampNS: PUint64): PSDL_Surface; cdecl;


implementation

end.
