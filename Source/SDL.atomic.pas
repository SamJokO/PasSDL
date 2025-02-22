unit SDL.atomic;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

type
  TSDL_SpinLock               = NativeInt;
  PSDL_SpinLock               = ^TSDL_SpinLock;

  /// <summary>
  ///  Try to lock a spin lock by setting it to a non-zero value.
  /// </summary>
  TSDL_TryLockSpinlock        = function (ALock: PSDL_SpinLock): bool; cdecl;

  /// <summary>
  ///  Lock a spin lock by setting it to a non-zero value.
  /// </summary>
  TSDL_LockSpinlock           = procedure (ALock: PSDL_SpinLock); cdecl;

  /// <summary>
  ///  Unlock a spin lock by setting it to 0.
  /// </summary>
  TSDL_UnlockSpinlock         = procedure (ALock: PSDL_SpinLock); cdecl;

  /// <summary>
  ///  Insert a memory release barrier (function version).
  /// </summary>
  TSDL_MemoryBarrierReleaseFunction
                              = procedure (); cdecl;

  /// <summary>
  ///  Insert a memory acquire barrier (function version).
  /// </summary>
  TSDL_MemoryBarrierAcquireFunction
                              = procedure (); cdecl;

  TSDL_AtomicInt = record
    value                       : int;
  end;
  PSDL_AtomicInt = ^TSDL_AtomicInt;

  /// <summary>
  ///  Set an atomic variable to a new value if it is currently an old value.
  /// </summary>
  TSDL_CompareAndSwapAtomicInt
                              = function (A: PSDL_AtomicInt; AOldVal: int; ANewVal: int): bool; cdecl;

  /// <summary>
  ///  Set an atomic variable to a value.
  /// </summary>
  TSDL_SetAtomicInt           = function (A: PSDL_AtomicInt; AValue: int): int; cdecl;

  /// <summary>
  ///  Get the value of an atomic variable.
  /// </summary>
  TSDL_GetAtomicInt           = function (A: PSDL_AtomicInt): int; cdecl;

  /// <summary>
  ///  Add to an atomic variable.
  /// </summary>
  TSDL_AddAtomicInt           = function (A: PSDL_AtomicInt; AValue: int): int; cdecl;

  TSDL_AtomicU32 = record
    value                       : UInt32;
  end;
  PSDL_AtomicU32 = ^TSDL_AtomicU32;

  /// <summary>
  ///  Set an atomic variable to a new value if it is currently an old value.
  /// </summary>
  TSDL_CompareAndSwapAtomicU32
                              = function (A: PSDL_AtomicU32; AOldVal: UInt32; ANewVal: UInt32): bool; cdecl;

  /// <summary>
  ///  Set an atomic variable to a value.
  /// </summary>
  TSDL_SetAtomicU32           = function (A: PSDL_AtomicU32; AValue: UInt32): UInt32; cdecl;

  /// <summary>
  ///  Get the value of an atomic variable.
  /// </summary>
  TSDL_GetAtomicU32           = function (A: PSDL_AtomicU32): UInt32; cdecl;

  /// <summary>
  ///  Set a pointer to a new value if it is currently an old value.
  /// </summary>
  TSDL_CompareAndSwapAtomicPointer
                              = function (A: PPointer; AOldVal: Pointer; ANewVal: Pointer): bool; cdecl;

  /// <summary>
  ///  Set a pointer to a value atomically.
  /// </summary>
  TSDL_SetAtomicPointer       = function (A: PPointer; AValue: Pointer): Pointer; cdecl;

  /// <summary>
  ///  Get the value of a pointer atomically.
  /// </summary>
  TSDL_GetAtomicPointer       = function (A: PPointer): Pointer; cdecl;

var
  SDL_TryLockSpinlock         : TSDL_TryLockSpinlock;
  SDL_LockSpinlock            : TSDL_LockSpinlock;
  SDL_UnlockSpinlock          : TSDL_UnlockSpinlock;
  SDL_MemoryBarrierReleaseFunction
                              : TSDL_MemoryBarrierReleaseFunction;
  SDL_MemoryBarrierAcquireFunction
                              : TSDL_MemoryBarrierAcquireFunction;
  SDL_CompareAndSwapAtomicInt : TSDL_CompareAndSwapAtomicInt;
  SDL_SetAtomicInt            : TSDL_SetAtomicInt;
  SDL_GetAtomicInt            : TSDL_GetAtomicInt;
  SDL_AddAtomicInt            : TSDL_AddAtomicInt;
  SDL_CompareAndSwapAtomicU32 : TSDL_CompareAndSwapAtomicU32;
  SDL_SetAtomicU32            : TSDL_SetAtomicU32;
  SDL_GetAtomicU32            : TSDL_GetAtomicU32;
  SDL_CompareAndSwapAtomicPointer
                              : TSDL_CompareAndSwapAtomicPointer;
  SDL_SetAtomicPointer        : TSDL_SetAtomicPointer;
  SDL_GetAtomicPointer        : TSDL_GetAtomicPointer;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_TryLockSpinlock        := BindProcedure(AHandle, 'SDL_TryLockSpinlock');
  @SDL_LockSpinlock           := BindProcedure(AHandle, 'SDL_LockSpinlock');
  @SDL_UnlockSpinlock         := BindProcedure(AHandle, 'SDL_UnlockSpinlock');
  @SDL_MemoryBarrierReleaseFunction
                              := BindProcedure(AHandle, 'SDL_MemoryBarrierReleaseFunction');
  @SDL_MemoryBarrierAcquireFunction
                              := BindProcedure(AHandle, 'SDL_MemoryBarrierAcquireFunction');
  @SDL_CompareAndSwapAtomicInt:= BindProcedure(AHandle, 'SDL_CompareAndSwapAtomicInt');
  @SDL_SetAtomicInt           := BindProcedure(AHandle, 'SDL_SetAtomicInt');
  @SDL_GetAtomicInt           := BindProcedure(AHandle, 'SDL_GetAtomicInt');
  @SDL_AddAtomicInt           := BindProcedure(AHandle, 'SDL_AddAtomicInt');
  @SDL_CompareAndSwapAtomicU32:= BindProcedure(AHandle, 'SDL_CompareAndSwapAtomicU32');
  @SDL_SetAtomicU32           := BindProcedure(AHandle, 'SDL_SetAtomicU32');
  @SDL_GetAtomicU32           := BindProcedure(AHandle, 'SDL_GetAtomicU32');
  @SDL_CompareAndSwapAtomicPointer
                              := BindProcedure(AHandle, 'SDL_CompareAndSwapAtomicPointer');
  @SDL_SetAtomicPointer       := BindProcedure(AHandle, 'SDL_SetAtomicPointer');
  @SDL_GetAtomicPointer       := BindProcedure(AHandle, 'SDL_GetAtomicPointer');
end;

end.
