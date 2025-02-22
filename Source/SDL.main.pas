unit SDL.main;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.init,
  SDL.error,
  SDL.events;

// TODO
type
  /// <summary>
  ///  The prototype for the application's main() function
  /// </summary>
  TSDL_main_func              = function (Aargc: int; Aargv: PPAnsiChar): int; cdecl;

  /// <summary>
  ///  An app-supplied function for program entry.
  /// </summary>
  TSDL_main                   = function (Aargc: int; Aargv: PPAnsiChar): int; cdecl;

  /// <summary>
  ///  Circumvent failure of SDL_Init() when not using SDL_main() as an entry
  ///  point.
  /// </summary>
  TSDL_SetMainReady           = procedure (); cdecl;

  /// <summary>
  ///  Initializes and launches an SDL application, by doing platform-specific
  ///  initialization before calling your mainFunction and cleanups after it
  ///  returns, if that is needed for a specific platform, otherwise it just calls
  ///  mainFunction.
  /// </summary>
  TSDL_RunApp                 = function (Aargc: int; Aargv: PPAnsiChar; AmainFunction: TSDL_main_func; Areserved: Pointer): int; cdecl;

  /// <summary>
  ///  An entry point for SDL's use in SDL_MAIN_USE_CALLBACKS.
  /// </summary>
  TSDL_EnterAppMainCallbacks  = function (Aargc: int; Aargv: PPAnsiChar; Aappinit: TSDL_AppInit_func; Aappiter: TSDL_AppIterate_func; Aappevent: TSDL_AppEvent_func; Aappquit: TSDL_AppQuit_func): int; cdecl;

{$IF DEFINED(MSWINDOWS)}
  /// <summary>
  ///  Register a win32 window class for SDL's use.
  /// </summary>
  TSDL_RegisterApp            = function (const Aname: PAnsiChar; Astyle: Uint32; AhInst: Pointer): bool; cdecl;

  /// <summary>
  ///  Deregister the win32 window class from an SDL_RegisterApp call.
  /// </summary>
  TSDL_UnregisterApp          = procedure (); cdecl;
{$ENDIF}

  /// <summary>
  ///  Callback from the application to let the suspend continue.
  /// </summary>
  TSDL_GDKSuspendComplete     = procedure (); cdecl;

var
  SDL_main                    : TSDL_main;
  SDL_SetMainReady            : TSDL_SetMainReady;
  SDL_RunApp                  : TSDL_RunApp;
  SDL_EnterAppMainCallbacks   : TSDL_EnterAppMainCallbacks;

{$IF DEFINED(MSWINDOWS)}
  SDL_RegisterApp             : TSDL_RegisterApp;
  SDL_UnregisterApp           : TSDL_UnregisterApp;
{$ENDIF}
  SDL_GDKSuspendComplete      : TSDL_GDKSuspendComplete;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
//  @SDL_main                   := BindProcedure(AHandle, 'SDL_main');      <-- Unknown
  @SDL_SetMainReady           := BindProcedure(AHandle, 'SDL_SetMainReady');
  @SDL_RunApp                 := BindProcedure(AHandle, 'SDL_RunApp');
  @SDL_EnterAppMainCallbacks  := BindProcedure(AHandle, 'SDL_EnterAppMainCallbacks');

{$IF DEFINED(MSWINDOWS)}
  @SDL_RegisterApp            := BindProcedure(AHandle, 'SDL_RegisterApp');
  @SDL_UnregisterApp          := BindProcedure(AHandle, 'SDL_UnregisterApp');
{$ENDIF}
  @SDL_GDKSuspendComplete     := BindProcedure(AHandle, 'SDL_GDKSuspendComplete');
end;

end.
