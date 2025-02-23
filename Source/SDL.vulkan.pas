unit SDL.vulkan;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.video;

type
  TVkInstance_T = record end;
  TVkInstance = TVkInstance_T;
  PVkInstance = ^TVkInstance;

  TVkPhysicalDevice_T = record end;
  TVkPhysicalDevice = TVkPhysicalDevice_T;
  PVkPhysicalDevice = ^TVkPhysicalDevice;

  TVkSurfaceKHR_T = record end;
  TVkSurfaceKHR = TVkSurfaceKHR_T;
  PVkSurfaceKHR = ^TVkSurfaceKHR;

  TVkAllocationCallbacks = record end;
  PVkAllocationCallbacks = ^TVkAllocationCallbacks;

  /// <summary>
  ///  Dynamically load the Vulkan loader library.
  /// </summary>
  TSDL_Vulkan_LoadLibrary     = function (const Apath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get the address of the `vkGetInstanceProcAddr` function.
  /// </summary>
  TSDL_Vulkan_GetVkGetInstanceProcAddr
                              = function (): TSDL_FunctionPointer; cdecl;

  /// <summary>
  ///  Unload the Vulkan library previously loaded by SDL_Vulkan_LoadLibrary().
  /// </summary>
  TSDL_Vulkan_UnloadLibrary   = procedure (); cdecl;

  /// <summary>
  ///  Get the Vulkan instance extensions needed for vkCreateInstance.
  /// </summary>
  TSDL_Vulkan_GetInstanceExtensions
                              = function (var Acount: Uint32): PPAnsiChar; cdecl;

  /// <summary>
  ///  Create a Vulkan rendering surface for a window.
  /// </summary>
  TSDL_Vulkan_CreateSurface   = function (Awindow: PSDL_Window; Ainstance: TVkInstance; const Aallocator: PVkAllocationCallbacks; var Asurface: TVkSurfaceKHR): bool; cdecl;

  /// <summary>
  ///  Destroy the Vulkan rendering surface of a window.
  /// </summary>
  TSDL_Vulkan_DestroySurface  = procedure (Ainstance: TVkInstance; Asurface: TVkSurfaceKHR; const Aallocator: PVkAllocationCallbacks); cdecl;

  /// <summary>
  ///  Query support for presentation via a given physical device and queue
  ///  family.
  /// </summary>
  TSDL_Vulkan_GetPresentationSupport
                              = function (Ainstance: TVkInstance; AphysicalDevice: TVkPhysicalDevice; AqueueFamilyIndex: Uint32): bool; cdecl;

var
  SDL_Vulkan_LoadLibrary      : TSDL_Vulkan_LoadLibrary;
  SDL_Vulkan_GetVkGetInstanceProcAddr
                              : TSDL_Vulkan_GetVkGetInstanceProcAddr;
  SDL_Vulkan_UnloadLibrary    : TSDL_Vulkan_UnloadLibrary;
  SDL_Vulkan_GetInstanceExtensions
                              : TSDL_Vulkan_GetInstanceExtensions;
  SDL_Vulkan_CreateSurface    : TSDL_Vulkan_CreateSurface;
  SDL_Vulkan_DestroySurface   : TSDL_Vulkan_DestroySurface;
  SDL_Vulkan_GetPresentationSupport
                              : TSDL_Vulkan_GetPresentationSupport;


procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_Vulkan_LoadLibrary     := BindProcedure(AHandle, 'SDL_Vulkan_LoadLibrary');
  @SDL_Vulkan_GetVkGetInstanceProcAddr
                              := BindProcedure(AHandle, 'SDL_Vulkan_GetVkGetInstanceProcAddr');
  @SDL_Vulkan_UnloadLibrary   := BindProcedure(AHandle, 'SDL_Vulkan_UnloadLibrary');
  @SDL_Vulkan_GetInstanceExtensions
                              := BindProcedure(AHandle, 'SDL_Vulkan_GetInstanceExtensions');
  @SDL_Vulkan_CreateSurface   := BindProcedure(AHandle, 'SDL_Vulkan_CreateSurface');
  @SDL_Vulkan_DestroySurface  := BindProcedure(AHandle, 'SDL_Vulkan_DestroySurface');
  @SDL_Vulkan_GetPresentationSupport
                              := BindProcedure(AHandle, 'SDL_Vulkan_GetPresentationSupport');
end;

end.
