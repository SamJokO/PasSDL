unit SDL_timer;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error;

const
  SDL_MS_PER_SECOND           = 1000;
  SDL_US_PER_SECOND           = 1000000;
  SDL_NS_PER_SECOND           = 1000000000;
  SDL_NS_PER_MS               = 1000000;
  SDL_NS_PER_US               = 1000;

  // Macro(s)
  function SDL_SECONDS_TO_NS(Avalue: int): Uint64; inline;
  procedure SDL_NS_TO_SECONDS(Avalue: Uint64; var Aresult: float); inline; overload;
  procedure SDL_NS_TO_SECONDS(Avalue: Uint64; var Aresult: int); inline; overload;

  //

type
  /// <summary>
  ///  Get the number of milliseconds since SDL library initialization.
  /// </summary>
  TSDL_GetTicks               = function (): Uint64; cdecl;

  /// <summary>
  ///  Get the number of nanoseconds since SDL library initialization.
  /// </summary>
  TSDL_GetTicksNS             = function (): Uint64; cdecl;

  /// <summary>
  ///  Get the current value of the high resolution counter.
  /// </summary>
  TSDL_GetPerformanceCounter  = function (): Uint64; cdecl;

  /// <summary>
  ///  Get the count per second of the high resolution counter.
  /// </summary>
  TSDL_GetPerformanceFrequency= function (): Uint64; cdecl;

  /// <summary>
  ///  Wait a specified number of milliseconds before returning.
  /// </summary>
  TSDL_Delay                  = procedure (Ams: Uint32); cdecl;

  /// <summary>
  ///  Wait a specified number of nanoseconds before returning.
  /// </summary>
  TSDL_DelayNS                = procedure (Ans: Uint64); cdecl;

  /// <summary>
  ///  Wait a specified number of nanoseconds before returning.
  /// </summary>
  TSDL_DelayPrecise           = procedure (Ans: Uint64); cdecl;

  TSDL_TimerID                = Uint32;

  /// <summary>
  ///  Function prototype for the millisecond timer callback function.
  /// </summary>
  TSDL_TimerCallback          = function (Auserdata: Pointer; AtimerID: TSDL_TimerID; Ainterval: Uint32): Uint32; cdecl;

  /// <summary>
  ///  Call a callback function at a future time.
  /// </summary>
  TSDL_AddTimer               = function (Ainterval: Uint32; Acallback: TSDL_TimerCallback; Auserdata: Pointer): TSDL_TimerID; cdecl;

  /// <summary>
  ///  Function prototype for the nanosecond timer callback function.
  /// </summary>
  TSDL_NSTimerCallback        = function (Auserdata: Pointer; AtimerID: TSDL_TimerID; Ainterval: Uint64): Uint64; cdecl;

  /// <summary>
  ///  Call a callback function at a future time.
  /// </summary>
  TSDL_AddTimerNS             = function (Ainterval: Uint64; Acallback: TSDL_NSTimerCallback; Auserdata: Pointer): TSDL_TimerID; cdecl;

  /// <summary>
  ///  Remove a timer created with SDL_AddTimer().
  /// </summary>
  TSDL_RemoveTimer            = function (Aid: TSDL_TimerID): bool; cdecl;

var
  SDL_GetTicks                : TSDL_GetTicks;
  SDL_GetTicksNS              : TSDL_GetTicksNS;
  SDL_GetPerformanceCounter   : TSDL_GetPerformanceCounter;
  SDL_GetPerformanceFrequency : TSDL_GetPerformanceFrequency;
  SDL_Delay                   : TSDL_Delay;
  SDL_DelayNS                 : TSDL_DelayNS;
  SDL_DelayPrecise            : TSDL_DelayPrecise;
  SDL_AddTimer                : TSDL_AddTimer;
  SDL_AddTimerNS              : TSDL_AddTimerNS;
  SDL_RemoveTimer             : TSDL_RemoveTimer;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_SECONDS_TO_NS(Avalue: int): Uint64;
begin
  Result                      := Avalue * SDL_NS_PER_SECOND;
end;

procedure SDL_NS_TO_SECONDS(Avalue: Uint64; var Aresult: float);
begin
  Aresult                      := AValue / SDL_NS_PER_SECOND;
end;

procedure SDL_NS_TO_SECONDS(Avalue: Uint64; var Aresult: int);
begin
  Aresult                      := AValue div SDL_NS_PER_SECOND;
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetTicks               := BindProcedure(AHandle, 'SDL_GetTicks');
  @SDL_GetTicksNS             := BindProcedure(AHandle, 'SDL_GetTicksNS');
  @SDL_GetPerformanceCounter  := BindProcedure(AHandle, 'SDL_GetPerformanceCounter');
  @SDL_GetPerformanceFrequency:= BindProcedure(AHandle, 'SDL_GetPerformanceFrequency');
  @SDL_Delay                  := BindProcedure(AHandle, 'SDL_Delay');
  @SDL_DelayNS                := BindProcedure(AHandle, 'SDL_DelayNS');
  @SDL_DelayPrecise           := BindProcedure(AHandle, 'SDL_DelayPrecise');
  @SDL_AddTimer               := BindProcedure(AHandle, 'SDL_AddTimer');
  @SDL_AddTimerNS             := BindProcedure(AHandle, 'SDL_AddTimerNS');
  @SDL_RemoveTimer            := BindProcedure(AHandle, 'SDL_RemoveTimer');
end;

end.
