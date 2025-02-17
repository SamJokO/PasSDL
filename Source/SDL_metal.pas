unit SDL_metal;

interface

uses
  SDL.Types,
  SDL_video;

type
  TSDL_MetalView              = Pointer;

  /// <summary>
  ///  Create a CAMetalLayer-backed NSView/UIView and attach it to the specified
  ///  window.
  /// </summary>
  TSDL_Metal_CreateView       = function (Awindow: PSDL_Window): TSDL_MetalView; cdecl;

  /// <summary>
  ///  Destroy an existing SDL_MetalView object.
  /// </summary>
  TSDL_Metal_DestroyView      = procedure (Aview: TSDL_MetalView); cdecl;

  /// <summary>
  ///  Get a pointer to the backing CAMetalLayer for the given view.
  /// </summary>
  TSDL_Metal_GetLayer         = function (Aview: TSDL_MetalView): Pointer; cdecl;

var
  SDL_Metal_CreateView        : TSDL_Metal_CreateView;
  SDL_Metal_DestroyView       : TSDL_Metal_DestroyView;
  SDL_Metal_GetLayer          : TSDL_Metal_GetLayer;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_Metal_CreateView       := BindProcedure(AHandle, 'SDL_Metal_CreateView');
  @SDL_Metal_DestroyView      := BindProcedure(AHandle, 'SDL_Metal_DestroyView');
  @SDL_Metal_GetLayer         := BindProcedure(AHandle, 'SDL_Metal_GetLayer');
end;

end.
