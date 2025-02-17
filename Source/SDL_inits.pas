unit SDL_inits;

interface

uses
  SDL.Types,
  SDL_stdinc,
  SDL_events;

type
  TSDL_InitFlags              = Uint32;
  PSDL_InitFlags              = ^TSDL_InitFlags;

const
  SDL_INIT_AUDIO              = $00000010;
  SDL_INIT_VIDEO              = $00000020;
  SDL_INIT_JOYSTICK           = $00000200;
  SDL_INIT_HAPTIC             = $00001000;
  SDL_INIT_GAMEPAD            = $00002000;
  SDL_INIT_EVENTS             = $00004000;
  SDL_INIT_SENSOR             = $00008000;
  SDL_INIT_CAMERA             = $00010000;

type
  TSDL_AppResult              = (
                                  SDL_APP_CONTINUE,
                                  SDL_APP_SUCCESS,
                                  SDL_APP_FAILURE
                                );
  PSDL_AppResult              = ^TSDL_AppResult;

  /// <summary>
  ///  Function pointer typedef for SDL_AppInit.
  /// </summary>
  TSDL_AppInit_func           = function (AAppstate: PPointer; AArgc: int; AArgv: array of PAnsiChar): TSDL_AppResult; cdecl;

  /// <summary>
  ///  Function pointer typedef for SDL_AppIterate.
  /// </summary>
  TSDL_AppIterate_func        = function (AAppstate: Pointer): TSDL_AppResult; cdecl;

  /// <summary>
  ///  Function pointer typedef for SDL_AppEvent.
  /// </summary>
  TSDL_AppEvent_func          = function (AAppstate: Pointer; AEvent: PSDL_Event): TSDL_AppResult; cdecl;

  /// <summary>
  ///  Function pointer typedef for SDL_AppQuit.
  /// </summary>
  TSDL_AppQuit_func           = procedure (AAppstate: Pointer; AResult: TSDL_AppResult); cdecl;

  /// <summary>
  ///  Function pointer typedef for SDL_AppQuit.
  /// </summary>
  TSDL_Init                   = function (AFlags: TSDL_InitFlags): bool; cdecl;

  /// <summary>
  ///  Compatibility function to initialize the SDL library.
  /// </summary>
  TSDL_InitSubSystem          = function (AFlags: TSDL_InitFlags): bool; cdecl;

  /// <summary>
  ///  Shut down specific SDL subsystems.
  /// </summary>
  TSDL_QuitSubSystem          = procedure (AFlags: TSDL_InitFlags); cdecl;

  /// <summary>
  ///  Get a mask of the specified subsystems which are currently initialized.
  /// </summary>
  TSDL_WasInit                = function (AFlags: TSDL_InitFlags): TSDL_InitFlags; cdecl;

  /// <summary>
  ///  Clean up all initialized subsystems.
  /// </summary>
  TSDL_Quit                   = procedure (); cdecl;

  /// <summary>
  ///  Return whether this is the main thread.
  /// </summary>
  TSDL_IsMainThread           = function (): bool; cdecl;

  /// <summary>
  ///  Callback run on the main thread.
  /// </summary>
  TSDL_MainThreadCallback     = procedure (AUserData: Pointer); cdecl;

  /// <summary>
  ///  Call a function on the main thread during event processing.
  /// </summary>
  TSDL_RunOnMainThread        = function (ACallback: TSDL_MainThreadCallback; AUserData: Pointer; AWait_complete: bool): bool; cdecl;

  /// <summary>
  ///  Specify basic metadata about your app.
  /// </summary>
  TSDL_SetAppMetadata         = function (const AAppname: PAnsiChar; const AAppversion: PAnsiChar; const AAppidentifier: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Specify metadata about your app through a set of properties.
  /// </summary>
  TSDL_SetAppMetadataProperty = function (const AName: PAnsiChar; const AValue: PAnsiChar): bool; cdecl;

const
  SDL_PROP_APP_METADATA_NAME_STRING       = 'SDL.app.metadata.name';
  SDL_PROP_APP_METADATA_VERSION_STRING    = 'SDL.app.metadata.version';
  SDL_PROP_APP_METADATA_IDENTIFIER_STRING = 'SDL.app.metadata.identifier';
  SDL_PROP_APP_METADATA_CREATOR_STRING    = 'SDL.app.metadata.creator';
  SDL_PROP_APP_METADATA_COPYRIGHT_STRING  = 'SDL.app.metadata.copyright';
  SDL_PROP_APP_METADATA_URL_STRING        = 'SDL_app.metadata.url';
  SDL_PROP_APP_METADATA_TYPE_STRING       = 'SDL.app.metadata.type';

type
  /// <summary>
  ///  Get metadata about your app.
  /// </summary>
  TSDL_GetAppMetadataProperty = function (const AName: string): PAnsiChar; cdecl;

var
  SDL_Init                    : TSDL_Init;
  SDL_InitSubSystem           : TSDL_InitSubSystem;
  SDL_QuitSubSystem           : TSDL_QuitSubSystem;
  SDL_WasInit                 : TSDL_WasInit;
  SDL_Quit                    : TSDL_Quit;
  SDL_IsMainThread            : TSDL_IsMainThread;
  SDL_RunOnMainThread         : TSDL_RunOnMainThread;
  SDL_SetAppMetadata          : TSDL_SetAppMetadata;
  SDL_SetAppMetadataProperty  : TSDL_SetAppMetadataProperty;
  SDL_GetAppMetadataProperty  : TSDL_GetAppMetadataProperty;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_Init                   := BindProcedure(AHandle, 'SDL_Init');
  @SDL_InitSubSystem          := BindProcedure(AHandle, 'SDL_InitSubSystem');
  @SDL_QuitSubSystem          := BindProcedure(AHandle, 'SDL_QuitSubSystem');
  @SDL_WasInit                := BindProcedure(AHandle, 'SDL_WasInit');
  @SDL_Quit                   := BindProcedure(AHandle, 'SDL_Quit');
  @SDL_IsMainThread           := BindProcedure(AHandle, 'SDL_IsMainThread');
  @SDL_RunOnMainThread        := BindProcedure(AHandle, 'SDL_RunOnMainThread');
  @SDL_SetAppMetadata         := BindProcedure(AHandle, 'SDL_SetAppMetadata');
  @SDL_SetAppMetadataProperty := BindProcedure(AHandle, 'SDL_SetAppMetadataProperty');
  @SDL_GetAppMetadataProperty := BindProcedure(AHandle, 'SDL_GetAppMetadataProperty');
end;

end.
