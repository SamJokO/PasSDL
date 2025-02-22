unit SDL.mutex;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.atomic,
  SDL.error,
  SDL.thread;

type
  TSDL_Mutex = record end;
  PSDL_Mutex = ^TSDL_Mutex;

  /// <summary>
  ///  Create a new mutex.
  /// </summary>
  TSDL_CreateMutex            = function (): PSDL_Mutex; cdecl;

  /// <summary>
  ///  Lock the mutex.
  /// </summary>
  TSDL_LockMutex              = procedure (Amutex: PSDL_Mutex); cdecl;

  /// <summary>
  ///  Try to lock a mutex without blocking.
  /// </summary>
  TSDL_TryLockMutex           = function (Amutex: PSDL_Mutex): bool; cdecl;

  /// <summary>
  ///  Unlock the mutex.
  /// </summary>
  TSDL_UnlockMutex            = procedure (Amutex: PSDL_Mutex); cdecl;

  /// <summary>
  ///  Destroy a mutex created with SDL_CreateMutex().
  /// </summary>
  TSDL_DestroyMutex           = procedure (Amutex: PSDL_Mutex); cdecl;

  TSDL_RWLock = record end;
  PSDL_RWLock = ^TSDL_RWLock;

  /// <summary>
  ///  Create a new read/write lock.
  /// </summary>
  TSDL_CreateRWLock           = function (): PSDL_RWLock; cdecl;

  /// <summary>
  ///  Lock the read/write lock for _read only_ operations.
  /// </summary>
  TSDL_LockRWLockForReading   = procedure (Arwlock: PSDL_RWLock); cdecl;

  /// <summary>
  ///  Lock the read/write lock for _write_ operations.
  /// </summary>
  TSDL_LockRWLockForWriting   = procedure (Arwlock: PSDL_RWLock); cdecl;

  /// <summary>
  ///  Try to lock a read/write lock _for reading_ without blocking.
  /// </summary>
  TSDL_TryLockRWLockForReading= function (Arwlock: PSDL_RWLock): bool; cdecl;

  /// <summary>
  ///  Try to lock a read/write lock _for writing_ without blocking.
  /// </summary>
  TSDL_TryLockRWLockForWriting= function (Arwlock: PSDL_RWLock): bool; cdecl;

  /// <summary>
  ///  Unlock the read/write lock.
  /// </summary>
  TSDL_UnlockRWLock           = procedure (Arwlock: PSDL_RWLock); cdecl;

  /// <summary>
  ///  Destroy a read/write lock created with SDL_CreateRWLock().
  /// </summary>
  TSDL_DestroyRWLock          = procedure (Arwlock: PSDL_RWLock); cdecl;

  TSDL_Semaphore = record end;
  PSDL_Semaphore = ^TSDL_Semaphore;

  /// <summary>
  ///  Create a semaphore.
  /// </summary>
  TSDL_CreateSemaphore        = function (Ainitial_value: Uint32): PSDL_Semaphore; cdecl;

  /// <summary>
  ///  Destroy a semaphore.
  /// </summary>
  TSDL_DestroySemaphore       = procedure (Asem: PSDL_Semaphore); cdecl;

  /// <summary>
  ///  Wait until a semaphore has a positive value and then decrements it.
  /// </summary>
  TSDL_WaitSemaphore          = procedure (Asem: PSDL_Semaphore); cdecl;

  /// <summary>
  ///  See if a semaphore has a positive value and decrement it if it does.
  /// </summary>
  TSDL_TryWaitSemaphore       = function (Asem: PSDL_Semaphore): bool; cdecl;

  /// <summary>
  ///  Wait until a semaphore has a positive value and then decrements it.
  /// </summary>
  TSDL_WaitSemaphoreTimeout   = function (Asem: PSDL_Semaphore; AtimeoutMS: Sint32): bool; cdecl;

  /// <summary>
  ///  Atomically increment a semaphore's value and wake waiting threads.
  /// </summary>
  TSDL_SignalSemaphore        = procedure (Asem: PSDL_Semaphore); cdecl;

  /// <summary>
  ///  Get the current value of a semaphore.
  /// </summary>
  TSDL_GetSemaphoreValue      = function (Asem: PSDL_Semaphore): Uint32; cdecl;

  TSDL_Condition = record end;
  PSDL_Condition = ^TSDL_Condition;

  /// <summary>
  ///  Create a condition variable.
  /// </summary>
  TSDL_CreateCondition        = function (): PSDL_Condition; cdecl;

  /// <summary>
  ///  Destroy a condition variable.
  /// </summary>
  TSDL_DestroyCondition       = procedure (Acond: PSDL_Condition); cdecl;

  /// <summary>
  ///  Restart one of the threads that are waiting on the condition variable.
  /// </summary>
  TSDL_SignalCondition        = procedure (Acond: PSDL_Condition); cdecl;

  /// <summary>
  ///  Restart all threads that are waiting on the condition variable.
  /// </summary>
  TSDL_BroadcastCondition     = procedure (Acond: PSDL_Condition); cdecl;

  /// <summary>
  ///  Wait until a condition variable is signaled.
  /// </summary>
  TSDL_WaitCondition          = procedure (Acond: PSDL_Condition; Amutex: PSDL_Mutex); cdecl;

  /// <summary>
  ///  Wait until a condition variable is signaled or a certain time has passed.
  /// </summary>
  TSDL_WaitConditionTimeout   = function (Acond: PSDL_Condition; Amutex: PSDL_Mutex; AtimeoutMS: Sint32): bool; cdecl;

  TSDL_InitStatus             = (
                                  SDL_INIT_STATUS_UNINITIALIZED,
                                  SDL_INIT_STATUS_INITIALIZING,
                                  SDL_INIT_STATUS_INITIALIZED,
                                  SDL_INIT_STATUS_UNINITIALIZING
                                );
  PSDL_InitStatus             = ^TSDL_InitStatus;

  TSDL_InitState = record
    status                      : TSDL_AtomicInt;
    thread                      : TSDL_ThreadID;
    reserved                    : Pointer;
  end;
  PSDL_InitState = ^TSDL_InitState;

  /// <summary>
  ///  Return whether initialization should be done.
  /// </summary>
  TSDL_ShouldInit             = function (Astate: PSDL_InitState): bool; cdecl;

  /// <summary>
  ///  Return whether cleanup should be done.
  /// </summary>
  TSDL_ShouldQuit             = function (Astate: PSDL_InitState): bool; cdecl;

  /// <summary>
  ///  Finish an initialization state transition.
  /// </summary>
  TSDL_SetInitialized         = procedure (Astate: PSDL_InitState; Ainitialized: bool); cdecl;

var
  SDL_CreateMutex             : TSDL_CreateMutex;
  SDL_LockMutex               : TSDL_LockMutex;
  SDL_TryLockMutex            : TSDL_TryLockMutex;
  SDL_UnlockMutex             : TSDL_UnlockMutex;
  SDL_DestroyMutex            : TSDL_DestroyMutex;
  SDL_CreateRWLock            : TSDL_CreateRWLock;
  SDL_LockRWLockForReading    : TSDL_LockRWLockForReading;
  SDL_LockRWLockForWriting    : TSDL_LockRWLockForWriting;
  SDL_TryLockRWLockForReading : TSDL_TryLockRWLockForReading;
  SDL_TryLockRWLockForWriting : TSDL_TryLockRWLockForWriting;
  SDL_UnlockRWLock            : TSDL_UnlockRWLock;
  SDL_DestroyRWLock           : TSDL_DestroyRWLock;
  SDL_CreateSemaphore         : TSDL_CreateSemaphore;
  SDL_DestroySemaphore        : TSDL_DestroySemaphore;
  SDL_WaitSemaphore           : TSDL_WaitSemaphore;
  SDL_TryWaitSemaphore        : TSDL_TryWaitSemaphore;
  SDL_WaitSemaphoreTimeout    : TSDL_WaitSemaphoreTimeout;
  SDL_SignalSemaphore         : TSDL_SignalSemaphore;
  SDL_GetSemaphoreValue       : TSDL_GetSemaphoreValue;
  SDL_CreateCondition         : TSDL_CreateCondition;
  SDL_DestroyCondition        : TSDL_DestroyCondition;
  SDL_SignalCondition         : TSDL_SignalCondition;
  SDL_BroadcastCondition      : TSDL_BroadcastCondition;
  SDL_WaitCondition           : TSDL_WaitCondition;
  SDL_WaitConditionTimeout    : TSDL_WaitConditionTimeout;
  SDL_ShouldInit              : TSDL_ShouldInit;
  SDL_ShouldQuit              : TSDL_ShouldQuit;
  SDL_SetInitialized          : TSDL_SetInitialized;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_CreateMutex            := BindProcedure(AHandle, 'SDL_CreateMutex');
  @SDL_LockMutex              := BindProcedure(AHandle, 'SDL_LockMutex');
  @SDL_TryLockMutex           := BindProcedure(AHandle, 'SDL_TryLockMutex');
  @SDL_UnlockMutex            := BindProcedure(AHandle, 'SDL_UnlockMutex');
  @SDL_DestroyMutex           := BindProcedure(AHandle, 'SDL_DestroyMutex');
  @SDL_CreateRWLock           := BindProcedure(AHandle, 'SDL_CreateRWLock');
  @SDL_LockRWLockForReading   := BindProcedure(AHandle, 'SDL_LockRWLockForReading');
  @SDL_LockRWLockForWriting   := BindProcedure(AHandle, 'SDL_LockRWLockForWriting');
  @SDL_TryLockRWLockForReading:= BindProcedure(AHandle, 'SDL_TryLockRWLockForReading');
  @SDL_TryLockRWLockForWriting:= BindProcedure(AHandle, 'SDL_TryLockRWLockForWriting');
  @SDL_UnlockRWLock           := BindProcedure(AHandle, 'SDL_UnlockRWLock');
  @SDL_DestroyRWLock          := BindProcedure(AHandle, 'SDL_DestroyRWLock');
  @SDL_CreateSemaphore        := BindProcedure(AHandle, 'SDL_CreateSemaphore');
  @SDL_DestroySemaphore       := BindProcedure(AHandle, 'SDL_DestroySemaphore');
  @SDL_WaitSemaphore          := BindProcedure(AHandle, 'SDL_WaitSemaphore');
  @SDL_TryWaitSemaphore       := BindProcedure(AHandle, 'SDL_TryWaitSemaphore');
  @SDL_WaitSemaphoreTimeout   := BindProcedure(AHandle, 'SDL_WaitSemaphoreTimeout');
  @SDL_SignalSemaphore        := BindProcedure(AHandle, 'SDL_SignalSemaphore');
  @SDL_GetSemaphoreValue      := BindProcedure(AHandle, 'SDL_GetSemaphoreValue');
  @SDL_CreateCondition        := BindProcedure(AHandle, 'SDL_CreateCondition');
  @SDL_DestroyCondition       := BindProcedure(AHandle, 'SDL_DestroyCondition');
  @SDL_SignalCondition        := BindProcedure(AHandle, 'SDL_SignalCondition');
  @SDL_BroadcastCondition     := BindProcedure(AHandle, 'SDL_BroadcastCondition');
  @SDL_WaitCondition          := BindProcedure(AHandle, 'SDL_WaitCondition');
  @SDL_WaitConditionTimeout   := BindProcedure(AHandle, 'SDL_WaitConditionTimeout');
  @SDL_ShouldInit             := BindProcedure(AHandle, 'SDL_ShouldInit');
  @SDL_ShouldQuit             := BindProcedure(AHandle, 'SDL_ShouldQuit');
  @SDL_SetInitialized         := BindProcedure(AHandle, 'SDL_SetInitialized');
end;

end.
