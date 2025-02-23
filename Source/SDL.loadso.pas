unit SDL.loadso;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

type
  TSDL_SharedObject = record end;
  PSDL_SharedObject = ^TSDL_SharedObject;

  /// <summary>
  ///  Dynamically load a shared object.
  /// </summary>
  TSDL_LoadObject             = function (const Asofile: PAnsiChar): PSDL_SharedObject; cdecl;

  /// <summary>
  ///  Look up the address of the named function in a shared object.
  /// </summary>
  TSDL_LoadFunction           = function (Ahandle: PSDL_SharedObject; const Aname: PAnsiChar): TSDL_FunctionPointer; cdecl;

  /// <summary>
  ///  Unload a shared object from memory.
  /// </summary>
  TSDL_UnloadObject           = procedure (Ahandle: PSDL_SharedObject); cdecl;

var
  SDL_LoadObject              : TSDL_LoadObject;
  SDL_LoadFunction            : TSDL_LoadFunction;
  SDL_UnloadObject            : TSDL_UnloadObject;


procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  SDL_LoadObject              := BindProcedure(AHandle, 'SDL_LoadObject');
  SDL_LoadFunction            := BindProcedure(AHandle, 'SDL_LoadFunction');
  SDL_UnloadObject            := BindProcedure(AHandle, 'SDL_UnloadObject');
end;

end.
