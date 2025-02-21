unit SDL.assert;

interface

uses
  SDL.Types,
  SDL.stdinc;

type
  TSDL_AssertState            = (
                                  SDL_ASSERTION_RETRY,
                                  SDL_ASSERTION_BREAK,
                                  SDL_ASSERTION_ABORT,
                                  SDL_ASSERTION_IGNORE,
                                  SDL_ASSERTION_ALWAYS_IGNORE
                                );

  PSDL_AssertData             = ^TSDL_AssertData;
  TSDL_AssertData = record
    always_ignore               : bool;
    trigger_count               : u_int;
    condition                   : PAnsiChar;
    filename                    : PAnsiChar;
    linenum                     : int;
    &function                   : PAnsiChar;
    next                        : PSDL_AssertData;
  end;

  /// <summary>
  ///  Never call this directly.
  /// </summary>
  TSDL_ReportAssertion        = function (AData: PSDL_AssertData; AFunc: PAnsiChar; AFile: PAnsiChar; line: int): TSDL_AssertState; cdecl;

  /// <summary>
  ///  A callback that fires when an SDL assertion fails.
  /// </summary>
  TSDL_AssertionHandler       = function (AData: PSDL_AssertData; AUserData: Pointer): TSDL_AssertState; cdecl;

  /// <summary>
  ///  Set an application-defined assertion handler.
  /// </summary>
  TSDL_SetAssertionHandler    = procedure (AHandler: TSDL_AssertionHandler; AUserData: Pointer); cdecl;

  /// <summary>
  ///  Get the default assertion handler.
  /// </summary>
  TSDL_GetDefaultAssertionHandler
                              = function (): TSDL_AssertionHandler; cdecl;

  /// <summary>
  ///  Get the current assertion handler.
  /// </summary>
  TSDL_GetAssertionHandler    = function (AUserData: PPointer): TSDL_AssertionHandler; cdecl;

  /// <summary>
  ///  Get a list of all assertion failures.
  /// </summary>
  TSDL_GetAssertionReport     = function (): PSDL_AssertData; cdecl;

  /// <summary>
  ///  Clear the list of all assertion failures.
  /// </summary>
  TSDL_ResetAssertionReport   = procedure (); cdecl;

var
  SDL_ReportAssertion         : TSDL_ReportAssertion;

  SDL_SetAssertionHandler     : TSDL_SetAssertionHandler;
  SDL_GetDefaultAssertionHandler
                              : TSDL_GetDefaultAssertionHandler;
  SDL_GetAssertionHandler     : TSDL_GetAssertionHandler;
  SDL_GetAssertionReport      : TSDL_GetAssertionReport;
  SDL_ResetAssertionReport    : TSDL_ResetAssertionReport;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_ReportAssertion        := BindProcedure(AHandle, 'SDL_ReportAssertion');
  @SDL_SetAssertionHandler    := BindProcedure(AHandle, 'SDL_SetAssertionHandler');
  @SDL_GetDefaultAssertionHandler
                              := BindProcedure(AHandle, 'SDL_GetDefaultAssertionHandler');
  @SDL_GetAssertionHandler    := BindProcedure(AHandle, 'SDL_GetAssertionHandler');
  @SDL_GetAssertionReport     := BindProcedure(AHandle, 'SDL_GetAssertionReport');
  @SDL_ResetAssertionReport   := BindProcedure(AHandle, 'SDL_ResetAssertionReport');
end;

end.
