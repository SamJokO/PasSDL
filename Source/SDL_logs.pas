unit SDL_logs;

interface

uses
  SDL.Types,
  SDL.stdinc;

type
  TSDL_LogCategory            = (
                                  SDL_LOG_CATEGORY_APPLICATION,
                                  SDL_LOG_CATEGORY_ERROR,
                                  SDL_LOG_CATEGORY_ASSERT,
                                  SDL_LOG_CATEGORY_SYSTEM,
                                  SDL_LOG_CATEGORY_AUDIO,
                                  SDL_LOG_CATEGORY_VIDEO,
                                  SDL_LOG_CATEGORY_RENDER,
                                  SDL_LOG_CATEGORY_INPUT,
                                  SDL_LOG_CATEGORY_TEST,
                                  SDL_LOG_CATEGORY_GPU,

                                  SDL_LOG_CATEGORY_RESERVED2,
                                  SDL_LOG_CATEGORY_RESERVED3,
                                  SDL_LOG_CATEGORY_RESERVED4,
                                  SDL_LOG_CATEGORY_RESERVED5,
                                  SDL_LOG_CATEGORY_RESERVED6,
                                  SDL_LOG_CATEGORY_RESERVED7,
                                  SDL_LOG_CATEGORY_RESERVED8,
                                  SDL_LOG_CATEGORY_RESERVED9,
                                  SDL_LOG_CATEGORY_RESERVED10,

                                  SDL_LOG_CATEGORY_CUSTOM
                                );
  PSDL_LogCategory            = ^TSDL_LogCategory;

  TSDL_LogPriority            = (
                                  SDL_LOG_PRIORITY_INVALID,
                                  SDL_LOG_PRIORITY_TRACE,
                                  SDL_LOG_PRIORITY_VERBOSE,
                                  SDL_LOG_PRIORITY_DEBUG,
                                  SDL_LOG_PRIORITY_INFO,
                                  SDL_LOG_PRIORITY_WARN,
                                  SDL_LOG_PRIORITY_ERROR,
                                  SDL_LOG_PRIORITY_CRITICAL,
                                  SDL_LOG_PRIORITY_COUNT
                                );
  PSDL_LogPriority            = ^TSDL_LogPriority;

  /// <summary>
  ///  Set the priority of all log categories.
  /// </summary>
  TSDL_SetLogPriorities       = procedure (Apriority: TSDL_LogPriority); cdecl;

  /// <summary>
  ///  Set the priority of a particular log category.
  /// </summary>
  TSDL_SetLogPriority         = procedure (Acategory: int; Apriority: TSDL_LogPriority); cdecl;

  /// <summary>
  ///  Get the priority of a particular log category.
  /// </summary>
  TSDL_GetLogPriority         = function (Acategory: int): TSDL_LogPriority; cdecl;

  /// <summary>
  ///  Reset all priorities to default.
  /// </summary>
  TSDL_ResetLogPriorities     = procedure (); cdecl;

  /// <summary>
  ///  Set the text prepended to log messages of a given priority.
  /// </summary>
  TSDL_SetLogPriorityPrefix   = function (Apriority: TSDL_LogPriority; const Aprefix: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
  /// </summary>
  TSDL_Log                    = procedure (const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_TRACE.
  /// </summary>
  TSDL_LogTrace               = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_VERBOSE.
  /// </summary>
  TSDL_LogVerbose             = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_DEBUG.
  /// </summary>
  TSDL_LogDebug               = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_INFO.
  /// </summary>
  TSDL_LogInfo                = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_WARN.
  /// </summary>
  TSDL_LogWarn                = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_ERROR.
  /// </summary>
  TSDL_LogError               = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with SDL_LOG_PRIORITY_CRITICAL.
  /// </summary>
  TSDL_LogCritical            = procedure (Acategory: int; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with the specified category and priority.
  /// </summary>
  TSDL_LogMessage             = procedure (Acategory: int; Apriority: TSDL_LogPriority; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  Log a message with the specified category and priority.
  /// </summary>
  TSDL_LogMessageV            = procedure (Acategory: int; Apriority: TSDL_LogPriority; const Afmt: PAnsiChar; Aargs: array of const); cdecl;

  /// <summary>
  ///  The prototype for the log output callback function.
  /// </summary>
  TSDL_LogOutputFunction      = procedure (Auserdata: Pointer; Apriority: TSDL_LogPriority; const Amessage: PAnsiChar); cdecl;

  /// <summary>
  ///  Get the default log output function.
  /// </summary>
  TSDL_GetDefaultLogOutputFunction
                              = function (): TSDL_LogOutputFunction; cdecl;

  /// <summary>
  ///  Get the current log output function.
  /// </summary>
  TSDL_GetLogOutputFunction   = procedure (var Acallback: TSDL_LogOutputFunction; const Auserdata: Pointer); cdecl;

  /// <summary>
  ///  Replace the default log output function with one of your own.
  /// </summary>
  TSDL_SetLogOutputFunction   = procedure (Acallback: TSDL_LogOutputFunction; Auserdata: Pointer); cdecl;

var
  SDL_SetLogPriorities        : TSDL_SetLogPriorities;
  SDL_SetLogPriority          : TSDL_SetLogPriority;
  SDL_GetLogPriority          : TSDL_GetLogPriority;
  SDL_ResetLogPriorities      : TSDL_ResetLogPriorities;
  SDL_SetLogPriorityPrefix    : TSDL_SetLogPriorityPrefix;
  SDL_Log                     : TSDL_Log;
  SDL_LogTrace                : TSDL_LogTrace;
  SDL_LogVerbose              : TSDL_LogVerbose;
  SDL_LogDebug                : TSDL_LogDebug;
  SDL_LogInfo                 : TSDL_LogInfo;
  SDL_LogWarn                 : TSDL_LogWarn;
  SDL_LogError                : TSDL_LogError;
  SDL_LogCritical             : TSDL_LogCritical;
  SDL_LogMessage              : TSDL_LogMessage;
  SDL_LogMessageV             : TSDL_LogMessageV;
  SDL_GetDefaultLogOutputFunction
                              : TSDL_GetDefaultLogOutputFunction;
  SDL_GetLogOutputFunction    : TSDL_GetLogOutputFunction;
  SDL_SetLogOutputFunction    : TSDL_SetLogOutputFunction;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_SetLogPriorities       := BindProcedure(AHandle, 'SDL_SetLogPriorities');
  @SDL_SetLogPriority         := BindProcedure(AHandle, 'SDL_SetLogPriority');
  @SDL_GetLogPriority         := BindProcedure(AHandle, 'SDL_GetLogPriority');
  @SDL_ResetLogPriorities     := BindProcedure(AHandle, 'SDL_ResetLogPriorities');
  @SDL_SetLogPriorityPrefix   := BindProcedure(AHandle, 'SDL_SetLogPriorityPrefix');
  @SDL_Log                    := BindProcedure(AHandle, 'SDL_Log');
  @SDL_LogTrace               := BindProcedure(AHandle, 'SDL_LogTrace');
  @SDL_LogVerbose             := BindProcedure(AHandle, 'SDL_LogVerbose');
  @SDL_LogDebug               := BindProcedure(AHandle, 'SDL_LogDebug');
  @SDL_LogInfo                := BindProcedure(AHandle, 'SDL_LogInfo');
  @SDL_LogWarn                := BindProcedure(AHandle, 'SDL_LogWarn');
  @SDL_LogError               := BindProcedure(AHandle, 'SDL_LogError');
  @SDL_LogCritical            := BindProcedure(AHandle, 'SDL_LogCritical');
  @SDL_LogMessage             := BindProcedure(AHandle, 'SDL_LogMessage');
  @SDL_LogMessageV            := BindProcedure(AHandle, 'SDL_LogMessageV');
  @SDL_GetDefaultLogOutputFunction
                              := BindProcedure(AHandle, 'SDL_GetDefaultLogOutputFunction');
  @SDL_GetLogOutputFunction   := BindProcedure(AHandle, 'SDL_GetLogOutputFunction');
  @SDL_SetLogOutputFunction   := BindProcedure(AHandle, 'SDL_SetLogOutputFunction');
end;

end.
