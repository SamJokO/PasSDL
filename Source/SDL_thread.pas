unit SDL_thread;

interface

uses
  SDL.Types,
  SDL_stdinc,
  SDL_error,
  SDL_properties,
  SDL_atomic;

type
  TSDL_Thread = record end;
  PSDL_Thread = ^TSDL_Thread;

  TSDL_ThreadID               = Uint64;
  PSDL_ThreadID               = ^TSDL_ThreadID;

  TSDL_TLSID                  = TSDL_AtomicInt;
  PSDL_TLSID                  = ^TSDL_TLSID;

  TSDL_ThreadPriority         = (
                                  SDL_THREAD_PRIORITY_LOW,
                                  SDL_THREAD_PRIORITY_NORMAL,
                                  SDL_THREAD_PRIORITY_HIGH,
                                  SDL_THREAD_PRIORITY_TIME_CRITICAL
                                );
  PSDL_ThreadPriority         = ^TSDL_ThreadPriority;

  TSDL_ThreadState            = (
                                  SDL_THREAD_UNKNOWN,
                                  SDL_THREAD_ALIVE,
                                  SDL_THREAD_DETACHED,
                                  SDL_THREAD_COMPLETE
                                );
  PSDL_ThreadState            = ^TSDL_ThreadState;

  /// <summary>
  ///  The function passed to SDL_CreateThread() as the new thread's entry point.
  /// </summary>
  TSDL_ThreadFunction         = function (Adata: Pointer): int; cdecl;

{
  SDL_WIKI_DOCUMENTATION_SECTION // <---- not implemented
}

  /// <summary>
  ///  The actual entry point for SDL_CreateThread.
  /// </summary>
  TSDL_CreateThreadRuntime    = function (Afn: TSDL_ThreadFunction; const Aname: PAnsiChar; Adata: Pointer; ApfnBeginThread: TSDL_FunctionPointer; ApfnEndThread: TSDL_FunctionPointer): PSDL_Thread; cdecl;

  /// <summary>
  ///  The actual entry point for SDL_CreateThreadWithProperties.
  /// </summary>
  TSDL_CreateThreadWithPropertiesRuntime
                              = function (Aprops: TSDL_PropertiesID; ApfnBeginThread: TSDL_FunctionPointer; ApfnEndThread: TSDL_FunctionPointer): PSDL_Thread; cdecl;

//----- Macro
  function SDL_CreateThread (Afn: TSDL_ThreadFunction; const Aname: PAnsiChar; Adata: Pointer): PSDL_Thread; cdecl; inline;
  function SDL_CreateThreadWithProperties (Aprops: TSDL_PropertiesID): PSDL_Thread; cdecl; inline;

const
  SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER         = 'SDL.thread.create.entry_function';
  SDL_PROP_THREAD_CREATE_NAME_STRING                    = 'SDL.thread.create.name';
  SDL_PROP_THREAD_CREATE_USERDATA_POINTER               = 'SDL.thread.create.userdata';
  SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER               = 'SDL.thread.create.stacksize';

type
  /// <summary>
  ///  Get the thread name as it was specified in SDL_CreateThread().
  /// </summary>
  TSDL_GetThreadName          = function (Athread: PSDL_Thread): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the thread identifier for the current thread.
  /// </summary>
  TSDL_GetCurrentThreadID     = function (): TSDL_ThreadID; cdecl;

  /// <summary>
  ///  Get the thread identifier for the specified thread.
  /// </summary>
  TSDL_GetThreadID            = function (Athread: PSDL_Thread): TSDL_ThreadID; cdecl;

  /// <summary>
  ///  Set the priority for the current thread.
  /// </summary>
  TSDL_SetCurrentThreadPriority
                              = function (Apriority: TSDL_ThreadPriority): bool; cdecl;

  /// <summary>
  ///  Wait for a thread to finish.
  /// </summary>
  TSDL_WaitThread             = procedure (Athread: PSDL_Thread; Astatus: Pint); cdecl;

  /// <summary>
  ///  Get the current state of a thread.
  /// </summary>
  TSDL_GetThreadState         = function (Athread: PSDL_Thread): TSDL_ThreadState; cdecl;

  /// <summary>
  ///  Let a thread clean up on exit without intervention.
  /// </summary>
  TSDL_DetachThread           = procedure (Athread: PSDL_Thread); cdecl;

  /// <summary>
  ///  Get the current thread's value associated with a thread local storage ID.
  /// </summary>
  TSDL_GetTLS                 = function (Aid: PSDL_TLSID): Pointer; cdecl;

  /// <summary>
  ///  The callback used to cleanup data passed to SDL_SetTLS.
  /// </summary>
  TSDL_TLSDestructorCallback  = procedure (Avalue: Pointer); cdecl;

  /// <summary>
  ///  The callback used to cleanup data passed to SDL_SetTLS.
  /// </summary>
  TSDL_SetTLS                 = function (Aid: PSDL_TLSID; const Avalue: Pointer; Adestructor: TSDL_TLSDestructorCallback): bool; cdecl;

  /// <summary>
  ///  Cleanup all TLS data for this thread.
  /// </summary>
  TSDL_CleanupTLS             = procedure (); cdecl;

var
  SDL_CreateThreadRuntime     : TSDL_CreateThreadRuntime;
  SDL_CreateThreadWithPropertiesRuntime
                              : TSDL_CreateThreadWithPropertiesRuntime;
  SDL_GetThreadName           : TSDL_GetThreadName;
  SDL_GetCurrentThreadID      : TSDL_GetCurrentThreadID;
  SDL_GetThreadID             : TSDL_GetThreadID;
  SDL_SetCurrentThreadPriority
                              : TSDL_SetCurrentThreadPriority;
  SDL_WaitThread              : TSDL_WaitThread;
  SDL_GetThreadState          : TSDL_GetThreadState;
  SDL_DetachThread            : TSDL_DetachThread;
  SDL_GetTLS                  : TSDL_GetTLS;
  SDL_SetTLS                  : TSDL_SetTLS;
  SDL_CleanupTLS              : TSDL_CleanupTLS;


procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_CreateThread(Afn: TSDL_ThreadFunction; const Aname: PAnsiChar; Adata: Pointer): PSDL_Thread;
begin
  Result                      := SDL_CreateThreadRuntime(Afn, Aname, Adata, nil, nil);
end;

function SDL_CreateThreadWithProperties (Aprops: TSDL_PropertiesID): PSDL_Thread;
begin
  Result                      := SDL_CreateThreadWithPropertiesRuntime(Aprops, nil, nil);
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_CreateThreadRuntime    := BindProcedure(AHandle, 'SDL_CreateThreadRuntime');
  @SDL_CreateThreadWithPropertiesRuntime
                              := BindProcedure(AHandle, 'SDL_CreateThreadWithPropertiesRuntime');
  @SDL_GetThreadName          := BindProcedure(AHandle, 'SDL_GetThreadName');
  @SDL_GetCurrentThreadID     := BindProcedure(AHandle, 'SDL_GetCurrentThreadID');
  @SDL_GetThreadID            := BindProcedure(AHandle, 'SDL_GetThreadID');
  @SDL_SetCurrentThreadPriority
                              := BindProcedure(AHandle, 'SDL_SetCurrentThreadPriority');
  @SDL_WaitThread             := BindProcedure(AHandle, 'SDL_WaitThread');
  @SDL_GetThreadState         := BindProcedure(AHandle, 'SDL_GetThreadState');
  @SDL_DetachThread           := BindProcedure(AHandle, 'SDL_DetachThread');
  @SDL_GetTLS                 := BindProcedure(AHandle, 'SDL_GetTLS');
  @SDL_SetTLS                 := BindProcedure(AHandle, 'SDL_SetTLS');
  @SDL_CleanupTLS             := BindProcedure(AHandle, 'SDL_CleanupTLS');
end;

end.
