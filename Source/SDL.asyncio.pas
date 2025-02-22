unit SDL.asyncio;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

type
  TSDL_AsyncIO = record end;
  PSDL_AsyncIO = ^TSDL_AsyncIO;

  TSDL_AsyncIOTaskType        = (
                                  SDL_ASYNCIO_TASK_READ,
                                  SDL_ASYNCIO_TASK_WRITE,
                                  SDL_ASYNCIO_TASK_CLOSE
                                );

  TSDL_AsyncIOResult          = (
                                  SDL_ASYNCIO_COMPLETE,
                                  SDL_ASYNCIO_FAILURE,
                                  SDL_ASYNCIO_CANCELED
                                );

  TSDL_AsyncIOOutcome = record
    asyncio                     : PSDL_AsyncIO;
    &type                       : TSDL_AsyncIOTaskType;
    &result                     : TSDL_AsyncIOResult;
    buffer                      : Pointer;
    offset                      : UInt64;
    bytes_requested             : UInt64;
    bytes_transferred           : UInt64;
    userdata                    : Pointer;
  end;
  PSDL_AsyncIOOutcome = ^TSDL_AsyncIOOutcome;

  TSDL_AsyncIOQueue = record end;
  PSDL_AsyncIOQueue = ^TSDL_AsyncIOQueue;

  /// <summary>
  ///  Use this function to create a new SDL_AsyncIO object for reading from
  ///  and/or writing to a named file.
  /// </summary>
  TSDL_AsyncIOFromFile        = function (const AFile: PAnsiChar; const  AMode: PAnsiChar): PSDL_AsyncIO; cdecl;

  /// <summary>
  ///  Use this function to get the size of the data stream in an SDL_AsyncIO.
  /// </summary>
  TSDL_GetAsyncIOSize         = function (AAsyncIo: PSDL_AsyncIO): Sint64; cdecl;

  /// <summary>
  ///  Start an async read.
  /// </summary>
  TSDL_ReadAsyncIO            = function (AAsyncIo: PSDL_AsyncIO; APtr: Pointer; AOffset: UInt64; ASize: UInt64; AQueue: PSDL_AsyncIOQueue; AUserData: Pointer): bool; cdecl;

  /// <summary>
  ///  Start an async write.
  /// </summary>
  TSDL_WriteAsyncIO           = function (AAsyncIo: PSDL_AsyncIO; APtr: Pointer; AOffset: UInt64; ASize: Uint64; AQueue: PSDL_AsyncIOQueue; AUserData: Pointer): bool; cdecl;

  /// <summary>
  ///  Close and free any allocated resources for an async I/O object.
  /// </summary>
  TSDL_CloseAsyncIO           = function (AAsyncIo: PSDL_AsyncIO; AFlush: bool; AQueue: PSDL_AsyncIOQueue; AUserData: Pointer): bool; cdecl;

  /// <summary>
  ///  Create a task queue for tracking multiple I/O operations.
  /// </summary>
  TSDL_CreateAsyncIOQueue     = function (): PSDL_AsyncIOQueue; cdecl;

  /// <summary>
  ///  Destroy a previously-created async I/O task queue.
  /// </summary>
  TSDL_DestroyAsyncIOQueue    = procedure (AQueue: PSDL_AsyncIOQueue); cdecl;

  /// <summary>
  ///  Query an async I/O task queue for completed tasks.
  /// </summary>
  TSDL_GetAsyncIOResult       = function (AQueue: PSDL_AsyncIOQueue; AOutcome: PSDL_AsyncIOOutcome): bool; cdecl;

  /// <summary>
  ///  Block until an async I/O task queue has a completed task.
  /// </summary>
  TSDL_WaitAsyncIOResult      = function (AQueue: PSDL_AsyncIOQueue; AOutcome: PSDL_AsyncIOOutcome; ATimeoutMS: SInt32): bool; cdecl;

  /// <summary>
  ///  Wake up any threads that are blocking in SDL_WaitAsyncIOResult().
  /// </summary>
  TSDL_SignalAsyncIOQueue     = procedure (AQueue: PSDL_AsyncIOQueue); cdecl;

  /// <summary>
  ///  Load all the data from a file path, asynchronously.
  /// </summary>
  TSDL_LoadFileAsync          = function (const AFile: PAnsiChar; AQueue: PSDL_AsyncIOQueue; AUserData: Pointer): bool; cdecl;

var
  SDL_AsyncIOFromFile         : TSDL_AsyncIOFromFile;
  SDL_GetAsyncIOSize          : TSDL_GetAsyncIOSize;
  SDL_ReadAsyncIO             : TSDL_ReadAsyncIO;
  SDL_WriteAsyncIO            : TSDL_WriteAsyncIO;
  SDL_CloseAsyncIO            : TSDL_CloseAsyncIO;
  SDL_CreateAsyncIOQueue      : TSDL_CreateAsyncIOQueue;
  SDL_DestroyAsyncIOQueue     : TSDL_DestroyAsyncIOQueue;
  SDL_GetAsyncIOResult        : TSDL_GetAsyncIOResult;
  SDL_WaitAsyncIOResult       : TSDL_WaitAsyncIOResult;
  SDL_SignalAsyncIOQueue      : TSDL_SignalAsyncIOQueue;
  SDL_LoadFileAsync           : TSDL_LoadFileAsync;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_AsyncIOFromFile        := BindProcedure(AHandle, 'SDL_AsyncIOFromFile');
  @SDL_GetAsyncIOSize         := BindProcedure(AHandle, 'SDL_GetAsyncIOSize');
  @SDL_ReadAsyncIO            := BindProcedure(AHandle, 'SDL_ReadAsyncIO');
  @SDL_WriteAsyncIO           := BindProcedure(AHandle, 'SDL_WriteAsyncIO');
  @SDL_CloseAsyncIO           := BindProcedure(AHandle, 'SDL_CloseAsyncIO');
  @SDL_CreateAsyncIOQueue     := BindProcedure(AHandle, 'SDL_CreateAsyncIOQueue');
  @SDL_DestroyAsyncIOQueue    := BindProcedure(AHandle, 'SDL_DestroyAsyncIOQueue');
  @SDL_GetAsyncIOResult       := BindProcedure(AHandle, 'SDL_GetAsyncIOResult');
  @SDL_WaitAsyncIOResult      := BindProcedure(AHandle, 'SDL_WaitAsyncIOResult');
  @SDL_SignalAsyncIOQueue     := BindProcedure(AHandle, 'SDL_SignalAsyncIOQueue');
  @SDL_LoadFileAsync          := BindProcedure(AHandle, 'SDL_LoadFileAsync');
end;

end.
