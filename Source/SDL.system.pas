unit SDL.system;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error,
  SDL.keyboard,
  SDL.video;

type
{$IF DEFINED(SDL_PLATFORM_WINDOWS)}
  TMsg = record end;
  PMsg = ^TMsg;

  /// <summary>
  ///  A callback to be used with SDL_SetWindowsMessageHook.
  /// </summary>
  TSDL_WindowsMessageHook     = function (Auserdata: Pointer; Amsg: TMsg): bool; cdecl;

  /// <summary>
  ///  Set a callback for every Windows message, run before TranslateMessage().
  /// </summary>
  TSDL_SetWindowsMessageHook  = procedure (Acallback: TSDL_WindowsMessageHook; Auserdata: Pointer); cdecl;

{$ENDIF}
{$IF DEFINED(SDL_PLATFORM_WIN32) or DEFINED(SDL_PLATFORM_WINGDK)}

  /// <summary>
  ///  Get the D3D9 adapter index that matches the specified display.
  /// </summary>
  TSDL_GetDirect3D9AdapterIndex
                              = function (AdisplayID: TSDL_DisplayID): int; cdecl;

  /// <summary>
  ///  Get the DXGI Adapter and Output indices for the specified display.
  /// </summary>
  TSDL_GetDXGIOutputInfo      = function (AdisplayID: TSDL_DisplayID; AadapterIndex: Pint; AoutputIndex: Pint): bool; cdecl;
{$ENDIF}

  TXEvent = record end;
  PXEvent = ^TXEvent;

  /// <summary>
  ///  A callback to be used with SDL_SetX11EventHook.
  /// </summary>
  TSDL_X11EventHook           = function (Auserdata: Pointer; Axevent: PXEvent): bool; cdecl;

  /// <summary>
  ///  Set a callback for every X11 event.
  /// </summary>
  TSDL_SetX11EventHook        = procedure (Acallback: TSDL_X11EventHook; Auserdata: Pointer); cdecl;

{$IF DEFINED(SDL_PLATFORM_LINUX)}

  /// <summary>
  ///  Sets the UNIX nice value for a thread.
  /// </summary>
  TSDL_SetLinuxThreadPriority = function (AthreadID: Sint64; Apriority: int): bool; cdecl;

  /// <summary>
  ///  Sets the priority (not nice level) and scheduling policy for a thread.
  /// </summary>
  TSDL_SetLinuxThreadPriorityAndPolicy
                              = function (AthreadID: Sint64; AsdlPriority: int; AschedPolicy: int): bool; cdecl;
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_IOS)}

  /// <summary>
  ///  The prototype for an Apple iOS animation callback.
  /// </summary>
  TSDL_iOSAnimationCallback   = procedure (Auserdata: Pointer); cdecl;

  /// <summary>
  ///  Use this function to set the animation callback on Apple iOS.
  /// </summary>
  TSDL_SetiOSAnimationCallback= function (Awindow: PSDL_Window; Ainterval: int; Acallback: TSDL_iOSAnimationCallback; AcallbackParam: Pointer): bool; cdecl;

  /// <summary>
  ///  Use this function to enable or disable the SDL event pump on Apple iOS.
  /// </summary>
  TSDL_SetiOSEventPump        = procedure (Aenabled: bool); cdecl;
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_ANDROID)}

  /// <summary>
  ///  Get the Android Java Native Interface Environment of the current thread.
  /// </summary>
  TSDL_GetAndroidJNIEnv       = function (): Pointer; cdecl;

  /// <summary>
  ///  Retrieve the Java instance of the Android activity class.
  /// </summary>
  TSDL_GetAndroidActivity     = function (): Pointer; cdecl;

  /// <summary>
  ///  Query Android API level of the current device.
  /// </summary>
  TSDL_GetAndroidSDKVersion   = function (): int; cdecl;

  /// <summary>
  ///  Query if the application is running on a Chromebook.
  /// </summary>
  TSDL_IsChromebook           = function (): bool; cdecl;

  /// <summary>
  ///  Query if the application is running on a Samsung DeX docking station.
  /// </summary>
  TSDL_IsDeXMode              = function (): bool; cdecl;

  /// <summary>
  ///  Trigger the Android system back button behavior.
  /// </summary>
  TSDL_SendAndroidBackButton  = procedure (); cdecl;

const
  SDL_ANDROID_EXTERNAL_STORAGE_READ         = $01;
  SDL_ANDROID_EXTERNAL_STORAGE_WRITE        = $02;

type
  /// <summary>
  ///  Get the path used for internal storage for this Android application.
  /// </summary>
  TSDL_GetAndroidInternalStoragePath
                              = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the current state of external storage for this Android application.
  /// </summary>
  TSDL_GetAndroidExternalStorageState
                              = function (): Uint32; cdecl;

  /// <summary>
  ///  Get the path used for external storage for this Android application.
  /// </summary>
  TSDL_GetAndroidExternalStoragePath
                              = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the path used for caching data for this Android application.
  /// </summary>
  TSDL_GetAndroidCachePath    = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Callback that presents a response from a SDL_RequestAndroidPermission call.
  /// </summary>
  TSDL_RequestAndroidPermissionCallback
                              = procedure (Auserdata: Pointer; const Apermission: PAnsiChar; Agranted: bool); cdecl;

  /// <summary>
  ///  Request permissions at runtime, asynchronously.
  /// </summary>
  TSDL_RequestAndroidPermission
                              = function (const Apermission: PAnsiChar; Acb: TSDL_RequestAndroidPermissionCallback; Auserdata: Pointer): bool; cdecl;

  /// <summary>
  ///  Shows an Android toast notification.
  /// </summary>
  TSDL_ShowAndroidToast       = function (const Amessage: PAnsiChar; Aduraion: int; Agravity: int; Axoffset: int; AyoffsetL int): bool; cdecl;

  /// <summary>
  ///  Send a user command to SDLActivity.
  /// </summary>
  TSDL_SendAndroidMessage     = function (Acommand: Uint32; Aparam: int): bool; cdecl;
{$ENDIF}

  /// <summary>
  ///  Query if the current device is a tablet.
  /// </summary>
  TSDL_IsTablet               = function (): bool; cdecl;

  /// <summary>
  ///  Query if the current device is a TV.
  /// </summary>
  TSDL_IsTV                   = function (): bool; cdecl;

  TSDL_Sandbox                = (
                                  SDL_SANDBOX_NONE = 0,
                                  SDL_SANDBOX_UNKNOWN_CONTAINER,
                                  SDL_SANDBOX_FLATPAK,
                                  SDL_SANDBOX_SNAP,
                                  SDL_SANDBOX_MACOS
                                );
  PSDL_Sandbox                = ^TSDL_Sandbox;

  /// <summary>
  ///  Get the application sandbox environment, if any.
  /// </summary>
  TSDL_GetSandbox             = function (): TSDL_Sandbox; cdecl;

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationWillTerminate.
  /// </summary>
  TSDL_OnApplicationWillTerminate
                              = procedure (); cdecl;

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationDidReceiveMemoryWarning.
  /// </summary>
  TSDL_OnApplicationDidReceiveMemoryWarning
                              = procedure (); cdecl;

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationWillResignActive.
  /// </summary>
  TSDL_OnApplicationWillEnterBackground
                              = procedure (); cdecl;

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationDidEnterBackground.
  /// </summary>
  TSDL_OnApplicationDidEnterBackground
                              = procedure (); cdecl;

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationWillEnterForeground.
  /// </summary>
  TSDL_OnApplicationWillEnterForeground
                              = procedure (); cdecl;

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationDidBecomeActive.
  /// </summary>
  TSDL_OnApplicationDidEnterForeground
                              = procedure (); cdecl;

{$IF DEFINED(SDL_PLATFORM_IOS)}

  /// <summary>
  ///  Let iOS apps with external event handling report
  ///  onApplicationDidChangeStatusBarOrientation.
  /// </summary>
  TSDL_OnApplicationDidChangeStatusBarOrientation
                              = procedure (); cdecl;
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_GDK)}
  TXTaskQueueObject = record end;
  TXTaskQueueHandle = ^TXTaskQueueObject;
  PXTaskQueueHandle = ^TXTaskQueueHandle;

  TXUser = record end;
  TXUserHandle = ^TXUser;
  PXUserHandle = ^TXUserHandle;

  /// <summary>
  ///  Gets a reference to the global async task queue handle for GDK,
  ///  initializing if needed.
  /// </summary>
  TSDL_GetGDKTaskQueue        = function (AoutTaskQueue: PXTaskQueueHandle): bool; cdecl;

  /// <summary>
  ///  Gets a reference to the default user handle for GDK.
  /// </summary>
  TSDL_GetGDKDefaultUser      = function (AoutUserHandle: PXUserHandle): bool; cdecl;
{$ENDIF}

var
{$IF DEFINED(SDL_PLATFORM_WINDOWS)}
  SDL_WindowsMessageHook      : TSDL_WindowsMessageHook;
  SDL_SetWindowsMessageHook   : TSDL_SetWindowsMessageHook;
{$ENDIF}
{$IF DEFINED(SDL_PLATFORM_WIN32) or DEFINED(SDL_PLATFORM_WINGDK)}
  SDL_GetDirect3D9AdapterIndex
                              : TSDL_GetDirect3D9AdapterIndex;
  SDL_GetDXGIOutputInfo       : TSDL_GetDXGIOutputInfo;
{$ENDIF}
  SDL_SetX11EventHook         : TSDL_SetX11EventHook;
{$IF DEFINED(SDL_PLATFORM_LINUX)}
  SDL_SetLinuxThreadPriority  : TSDL_SetLinuxThreadPriority;
  SDL_SetLinuxThreadPriorityAndPolicy
                              : TSDL_SetLinuxThreadPriorityAndPolicy;
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_IOS)}
  SDL_SetiOSAnimationCallback : TSDL_SetiOSAnimationCallback;
  SDL_SetiOSEventPump         : TSDL_SetiOSEventPump;
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_ANDROID)}
  SDL_GetAndroidJNIEnv        : TSDL_GetAndroidJNIEnv;
  SDL_GetAndroidActivity      : TSDL_GetAndroidActivity;
  SDL_GetAndroidSDKVersion    : TSDL_GetAndroidSDKVersion;
  SDL_IsChromebook            : TSDL_IsChromebook;
  SDL_IsDeXMode               : TSDL_IsDeXMode;
  SDL_SendAndroidBackButton   : TSDL_SendAndroidBackButton;
  SDL_GetAndroidInternalStoragePath
                              : TSDL_GetAndroidInternalStoragePath;
  SDL_GetAndroidExternalStorageState
                              : TSDL_GetAndroidExternalStorageState;
  SDL_GetAndroidExternalStoragePath
                              : TSDL_GetAndroidExternalStoragePath;
  SDL_GetAndroidCachePath     : TSDL_GetAndroidCachePath;
  SDL_RequestAndroidPermission
                              : TSDL_RequestAndroidPermission;
  SDL_ShowAndroidToast        : TSDL_ShowAndroidToast;
  SDL_SendAndroidMessage      : TSDL_SendAndroidMessage;
{$ENDIF}
  SDL_IsTablet                : TSDL_IsTablet;
  SDL_IsTV                    : TSDL_IsTV;
  SDL_GetSandbox              : TSDL_GetSandbox;
  SDL_OnApplicationWillTerminate
                              : TSDL_OnApplicationWillTerminate;
  SDL_OnApplicationDidReceiveMemoryWarning
                              : TSDL_OnApplicationDidReceiveMemoryWarning;
  SDL_OnApplicationWillEnterBackground
                              : TSDL_OnApplicationWillEnterBackground;
  SDL_OnApplicationDidEnterBackground
                              : TSDL_OnApplicationDidEnterBackground;
  SDL_OnApplicationWillEnterForeground
                              : TSDL_OnApplicationWillEnterForeground;
  SDL_OnApplicationDidEnterForeground
                              : TSDL_OnApplicationDidEnterForeground;
{$IF DEFINED(SDL_PLATFORM_IOS)}
  SDL_OnApplicationDidChangeStatusBarOrientation
                              : TSDL_OnApplicationDidChangeStatusBarOrientation;
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_GDK)}
  SDL_GetGDKTaskQueue         : TSDL_GetGDKTaskQueue;
  SDL_GetGDKDefaultUser       : TSDL_GetGDKDefaultUser;
{$ENDIF}

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
{$IF DEFINED(SDL_PLATFORM_WINDOWS)}
  @SDL_WindowsMessageHook     := BindProcedure(AHandle, 'SDL_WindowsMessageHook');
  @SDL_SetWindowsMessageHook  := BindProcedure(AHandle, 'SDL_SetWindowsMessageHook');
{$ENDIF}
{$IF DEFINED(SDL_PLATFORM_WIN32) or DEFINED(SDL_PLATFORM_WINGDK)}
  @SDL_GetDirect3D9AdapterIndex
                              := BindProcedure(AHandle, 'SDL_GetDirect3D9AdapterIndex');
  @SDL_GetDXGIOutputInfo      := BindProcedure(AHandle, 'SDL_GetDXGIOutputInfo');
{$ENDIF}
  @SDL_SetX11EventHook        := BindProcedure(AHandle, 'SDL_SetX11EventHook');
{$IF DEFINED(SDL_PLATFORM_LINUX)}
  @SDL_SetLinuxThreadPriority := BindProcedure(AHandle, 'SDL_SetLinuxThreadPriority');
  @SDL_SetLinuxThreadPriorityAndPolicy
                              := BindProcedure(AHandle, 'SDL_SetLinuxThreadPriorityAndPolicy');
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_IOS)}
  @SDL_SetiOSAnimationCallback:= BindProcedure(AHandle, 'SDL_SetiOSAnimationCallback');
  @SDL_SetiOSEventPump        := BindProcedure(AHandle, 'SDL_SetiOSEventPump');
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_ANDROID)}
  @SDL_GetAndroidJNIEnv       := BindProcedure(AHandle, 'SDL_GetAndroidJNIEnv');
  @SDL_GetAndroidActivity     := BindProcedure(AHandle, 'SDL_GetAndroidActivity');
  @SDL_GetAndroidSDKVersion   := BindProcedure(AHandle, 'SDL_GetAndroidSDKVersion');
  @SDL_IsChromebook           := BindProcedure(AHandle, 'SDL_IsChromebook');
  @SDL_IsDeXMode              := BindProcedure(AHandle, 'SDL_IsDeXMode');
  @SDL_SendAndroidBackButton  := BindProcedure(AHandle, 'SDL_SendAndroidBackButton');
  @SDL_GetAndroidInternalStoragePath
                              := BindProcedure(AHandle, 'SDL_GetAndroidInternalStoragePath');
  @SDL_GetAndroidExternalStorageState
                              := BindProcedure(AHandle, 'SDL_GetAndroidExternalStorageState');
  @SDL_GetAndroidExternalStoragePath
                              := BindProcedure(AHandle, 'SDL_GetAndroidExternalStoragePath');
  @SDL_GetAndroidCachePath    := BindProcedure(AHandle, 'SDL_GetAndroidCachePath');
  @SDL_RequestAndroidPermission
                              := BindProcedure(AHandle, 'SDL_RequestAndroidPermission');
  @SDL_ShowAndroidToast       := BindProcedure(AHandle, 'SDL_ShowAndroidToast');
  @SDL_SendAndroidMessage     := BindProcedure(AHandle, 'SDL_SendAndroidMessage');
{$ENDIF}
  @SDL_IsTablet               := BindProcedure(AHandle, 'SDL_IsTablet');
  @SDL_IsTV                   := BindProcedure(AHandle, 'SDL_IsTV');
  @SDL_GetSandbox             := BindProcedure(AHandle, 'SDL_GetSandbox');
  @SDL_OnApplicationWillTerminate
                              := BindProcedure(AHandle, 'SDL_OnApplicationWillTerminate');
  @SDL_OnApplicationDidReceiveMemoryWarning
                              := BindProcedure(AHandle, 'SDL_OnApplicationDidReceiveMemoryWarning');
  @SDL_OnApplicationWillEnterBackground
                              := BindProcedure(AHandle, 'SDL_OnApplicationWillEnterBackground');
  @SDL_OnApplicationDidEnterBackground
                              := BindProcedure(AHandle, 'SDL_OnApplicationDidEnterBackground');
  @SDL_OnApplicationWillEnterForeground
                              := BindProcedure(AHandle, 'SDL_OnApplicationWillEnterForeground');
  @SDL_OnApplicationDidEnterForeground
                              := BindProcedure(AHandle, 'SDL_OnApplicationDidEnterForeground');
{$IF DEFINED(SDL_PLATFORM_IOS)}
  @SDL_OnApplicationDidChangeStatusBarOrientation
                              := BindProcedure(AHandle, 'SDL_OnApplicationDidChangeStatusBarOrientation');
{$ENDIF}

{$IF DEFINED(SDL_PLATFORM_GDK)}
  @SDL_GetGDKTaskQueue        := BindProcedure(AHandle, 'SDL_GetGDKTaskQueue');
  @SDL_GetGDKDefaultUser      := BindProcedure(AHandle, 'SDL_GetGDKDefaultUser');
{$ENDIF}

end;

end.
