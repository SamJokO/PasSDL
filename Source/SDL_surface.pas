unit SDL_surface;

interface

uses
  SDL.Types;

type
  TSDL_SurfaceFlags           = Uint32;

const
  SDL_SURFACE_PREALLOCATED    = $00000001;
  SDL_SURFACE_LOCK_NEEDED     = $00000002;
  SDL_SURFACE_LOCKED          = $00000004;
  SDL_SURFACE_SIMD_ALIGNED    = $00000008;

// define SDL_MUSTLOCK(S)
type
  TSDL_ScaleMode              = (
                                  SDL_SCALEMODE_NEAREST,
                                  SDL_SCALEMODE_LINEAR
                                );
  PSDL_ScaleMode              = ^TSDL_ScaleMode;

  TSDL_FlipMode               = (
                                  SDL_FLIP_NONE,
                                  SDL_FLIP_HORIZONTAL,
                                  SDL_FLIP_VERTICAL
                                );
  PSDL_FlipMode               = ^TSDL_FlipMode;


  TSDL_Surface = record

  end;

implementation

end.
