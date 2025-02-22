unit SDL.cpuinfo;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

const
  SDL_CACHELINE_SIZE          = 128;

type
  /// <summary>
  ///  Get the number of logical CPU cores available.
  /// </summary>
  TSDL_GetNumLogicalCPUCores  = function (): int; cdecl;

  /// <summary>
  ///  Determine the L1 cache line size of the CPU.
  /// </summary>
  TSDL_GetCPUCacheLineSize    = function (): int; cdecl;

  /// <summary>
  ///  Determine whether the CPU has AltiVec features.
  /// </summary>
  TSDL_HasAltiVec             = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has MMX features.
  /// </summary>
  TSDL_HasMMX                 = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has SSE features.
  /// </summary>
  TSDL_HasSSE                 = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has SSE2 features.
  /// </summary>
  TSDL_HasSSE2                = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has SSE3 features.
  /// </summary>
  TSDL_HasSSE3                = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has SSE4.1 features.
  /// </summary>
  TSDL_HasSSE41               = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has SSE4.2 features.
  /// </summary>
  TSDL_HasSSE42               = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has AVX features.
  /// </summary>
  TSDL_HasAVX                 = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has AVX2 features.
  /// </summary>
  TSDL_HasAVX2                = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has AVX-512F (foundation) features.
  /// </summary>
  TSDL_HasAVX512F             = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has ARM SIMD (ARMv6) features.
  /// </summary>
  TSDL_HasARMSIMD             = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has NEON (ARM SIMD) features.
  /// </summary>
  TSDL_HasNEON                = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has LSX (LOONGARCH SIMD) features.
  /// </summary>
  TSDL_HasLSX                 = function (): bool; cdecl;

  /// <summary>
  ///  Determine whether the CPU has LASX (LOONGARCH SIMD) features.
  /// </summary>
  TSDL_HasLASX                = function (): bool; cdecl;

  /// <summary>
  ///  Get the amount of RAM configured in the system.
  /// </summary>
  TSDL_GetSystemRAM           = function (): bool; cdecl;

  /// <summary>
  ///  Report the alignment this system needs for SIMD allocations.
  /// </summary>
  TSDL_GetSIMDAlignment       = function (): size_t; cdecl;

var
  SDL_GetNumLogicalCPUCores   : TSDL_GetNumLogicalCPUCores;
  SDL_GetCPUCacheLineSize     : TSDL_GetCPUCacheLineSize;
  SDL_HasAltiVec              : TSDL_HasAltiVec;
  SDL_HasMMX                  : TSDL_HasMMX;
  SDL_HasSSE                  : TSDL_HasSSE;
  SDL_HasSSE2                 : TSDL_HasSSE2;
  SDL_HasSSE3                 : TSDL_HasSSE3;
  SDL_HasSSE41                : TSDL_HasSSE41;
  SDL_HasSSE42                : TSDL_HasSSE42;
  SDL_HasAVX                  : TSDL_HasAVX;
  SDL_HasAVX2                 : TSDL_HasAVX2;
  SDL_HasAVX512F              : TSDL_HasAVX512F;
  SDL_HasARMSIMD              : TSDL_HasARMSIMD;
  SDL_HasNEON                 : TSDL_HasNEON;
  SDL_HasLSX                  : TSDL_HasLSX;
  SDL_HasLASX                 : TSDL_HasLASX;
  SDL_GetSystemRAM            : TSDL_GetSystemRAM;
  SDL_GetSIMDAlignment        : TSDL_GetSIMDAlignment;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetNumLogicalCPUCores  := BindProcedure(AHandle, 'SDL_GetNumLogicalCPUCores');
  @SDL_GetCPUCacheLineSize    := BindProcedure(AHandle, 'SDL_GetCPUCacheLineSize');
  @SDL_HasAltiVec             := BindProcedure(AHandle, 'SDL_HasAltiVec');
  @SDL_HasMMX                 := BindProcedure(AHandle, 'SDL_HasMMX');
  @SDL_HasSSE                 := BindProcedure(AHandle, 'SDL_HasSSE');
  @SDL_HasSSE2                := BindProcedure(AHandle, 'SDL_HasSSE2');
  @SDL_HasSSE3                := BindProcedure(AHandle, 'SDL_HasSSE3');
  @SDL_HasSSE41               := BindProcedure(AHandle, 'SDL_HasSSE41');
  @SDL_HasSSE42               := BindProcedure(AHandle, 'SDL_HasSSE42');
  @SDL_HasAVX                 := BindProcedure(AHandle, 'SDL_HasAVX');
  @SDL_HasAVX2                := BindProcedure(AHandle, 'SDL_HasAVX2');
  @SDL_HasAVX512F             := BindProcedure(AHandle, 'SDL_HasAVX512F');
  @SDL_HasARMSIMD             := BindProcedure(AHandle, 'SDL_HasARMSIMD');
  @SDL_HasNEON                := BindProcedure(AHandle, 'SDL_HasNEON');
  @SDL_HasLSX                 := BindProcedure(AHandle, 'SDL_HasLSX');
  @SDL_HasLASX                := BindProcedure(AHandle, 'SDL_HasLASX');
  @SDL_GetSystemRAM           := BindProcedure(AHandle, 'SDL_GetSystemRAM');
  @SDL_GetSIMDAlignment       := BindProcedure(AHandle, 'SDL_GetSIMDAlignment');
end;

end.
