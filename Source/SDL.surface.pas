unit SDL.surface;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.blendmode,
  SDL.properties,
  SDL.rect,
  SDL.iostream,
  SDL.pixels;

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
                                  SDL_SCALEMODE_INVALID = -1,
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
    flags                       : TSDL_SurfaceFlags;
    format                      : TSDL_PixelFormat;
    w                           : int;
    h                           : int;
    pitch                       : int;
    pixels                      : Pointer;
    refcount                    : int;
    reserved                    : Pointer;
  end;
  PSDL_Surface = ^TSDL_Surface;
  PPSDL_Surface = ^PSDL_Surface;

  /// <summary>
  ///  Allocate a new surface with a specific pixel format.
  /// </summary>
  TSDL_CreateSurface          = function (Awidth: int; Aheight: int; Aformat: TSDL_PixelFormat): PSDL_Surface; cdecl;

  /// <summary>
  ///  Allocate a new surface with a specific pixel format and existing pixel
  ///  data.
  /// </summary>
  TSDL_CreateSurfaceFrom      = function (Awidth: int; Aheight: int; Aformat: TSDL_PixelFormat; Apixels: Pointer; Apitch: int): PSDL_Surface; cdecl;

  /// <summary>
  ///  Free a surface.
  /// </summary>
  TSDL_DestroySurface         = procedure (Asurface: PSDL_Surface); cdecl;

  /// <summary>
  ///  Get the properties associated with a surface.
  /// </summary>
  TSDL_GetSurfaceProperties   = function (Asurface: PSDL_Surface): TSDL_PropertiesID; cdecl;

  /// <summary>
  ///  Set the colorspace used by a surface.
  /// </summary>
  TSDL_SetSurfaceColorspace   = function (Asurface: PSDL_Surface; Acolorspace: TSDL_Colorspace): bool; cdecl;

  /// <summary>
  ///  Get the colorspace used by a surface.
  /// </summary>
  TSDL_GetSurfaceColorspace   = function (Asurface: PSDL_Surface): TSDL_Colorspace; cdecl;

  /// <summary>
  ///  Create a palette and associate it with a surface.
  /// </summary>
  TSDL_CreateSurfacePalette   = function (Asurface: PSDL_SurfacE): PSDL_Palette; cdecl;

  /// <summary>
  ///  Get the palette used by a surface.
  /// </summary>
  TSDL_SetSurfacePalette      = function (Asurface: PSDL_Surface; Apalette: PSDL_Palette): bool; cdecl;

  /// <summary>
  ///  Get the palette used by a surface.
  /// </summary>
  TSDL_GetSurfacePalette      = function (Asurface: PSDL_Surface): PSDL_Palette; cdecl;

  /// <summary>
  ///  Add an alternate version of a surface.
  /// </summary>
  TSDL_AddSurfaceAlternateImage
                              = function (Asurface: PSDL_Surface; Aimage: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Return whether a surface has alternate versions available.
  /// </summary>
  TSDL_SurfaceHasAlternateImages
                              = function (Asurface: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Get an array including all versions of a surface.
  /// </summary>
  TSDL_GetSurfaceImages       = function (Asurface: PSDL_Surface; var Acount: int): PPSDL_Surface; cdecl;

  /// <summary>
  ///  Remove all alternate versions of a surface.
  /// </summary>
  TSDL_RemoveSurfaceAlternateImages
                              = procedure (Asurface: PSDL_Surface); cdecl;

  /// <summary>
  ///  Set up a surface for directly accessing the pixels.
  /// </summary>
  TSDL_LockSurface            = function (Asurface: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Release a surface after directly accessing the pixels.
  /// </summary>
  TSDL_UnlockSurface          = procedure (Asurface: PSDL_Surface); cdecl;

  /// <summary>
  ///  Load a BMP image from a seekable SDL data stream.
  /// </summary>
  TSDL_LoadBMP_IO             = function (Asrc: PSDL_IOStream; Acloseio: bool): PSDL_Surface; cdecl;

  /// <summary>
  ///  Load a BMP image from a file.
  /// </summary>
  TSDL_LoadBMP                = function (const Afile: PAnsiChar): PSDL_Surface; cdecl;

  /// <summary>
  ///  Save a surface to a seekable SDL data stream in BMP format.
  /// </summary>
  TSDL_SaveBMP_IO             = function (Asurface: PSDL_Surface; var Adst: TSDL_IOStream; Acloseio: bool): bool; cdecl;

  /// <summary>
  ///  Save a surface to a file.
  /// </summary>
  TSDL_SaveBMP                = function (Asurface: PSDL_Surface; const Afile: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Set the RLE acceleration hint for a surface.
  /// </summary>
  TSDL_SetSurfaceRLE          = function (Asurface: PSDL_Surface; Aenabled: bool): bool; cdecl;

  /// <summary>
  ///  Returns whether the surface is RLE enabled.
  /// </summary>
  TSDL_SurfaceHasRLE          = function (Asurface: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Set the color key (transparent pixel) in a surface.
  /// </summary>
  TSDL_SetSurfaceColorKey     = function (Asurface: PSDL_Surface; Aenabled: bool; Akey: Uint32): bool; cdecl;

  /// <summary>
  ///  Returns whether the surface has a color key.
  /// </summary>
  TSDL_SurfaceHasColorKey     = function (Asurface: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Get the color key (transparent pixel) for a surface.
  /// </summary>
  TSDL_GetSurfaceColorKey     = function (Asurface: PSDL_Surface; var Akey: Uint32): bool; cdecl;

  /// <summary>
  ///  Set an additional color value multiplied into blit operations.
  /// </summary>
  TSDL_SetSurfaceColorMod     = function (Asurface: PSDL_Surface; Ar: Uint8; Ag: Uint8; Ab: Uint8): bool; cdecl;

  /// <summary>
  ///  Get the additional color value multiplied into blit operations.
  /// </summary>
  TSDL_GetSurfaceColorMod     = function (Asurface: PSDL_Surface; var Ar: Uint8; var Ag: Uint8; var Ab: Uint8): bool; cdecl;

  /// <summary>
  ///  Set an additional alpha value used in blit operations.
  /// </summary>
  TSDL_SetSurfaceAlphaMod     = function (Asurface: PSDL_Surface; Aalpha: Uint8): bool; cdecl;

  /// <summary>
  ///  Get an additional alpha value used in blit operations.
  /// </summary>
  TSDL_GetSurfaceAlphaMod     = function (Asurface: PSDL_Surface; var Aalpha: Uint8): bool; cdecl;

  /// <summary>
  ///  Set the blend mode used for blit operations.
  /// </summary>
  TSDL_SetSurfaceBlendMode    = function (Asurface: PSDL_Surface; AblendMode: TSDL_BlendMode): bool; cdecl;

  /// <summary>
  ///  Get the blend mode used for blit operations.
  /// </summary>
  TSDL_GetSurfaceBlendMode    = function (Asurface: PSDL_Surface; var AblendMode : TSDL_BlendMode): bool; cdecl;

  /// <summary>
  ///  Set the clipping rectangle for a surface.
  /// </summary>
  TSDL_SetSurfaceClipRect     = function (Asurface: PSDL_Surface; const Arect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Get the clipping rectangle for a surface.
  /// </summary>
  TSDL_GetSurfaceClipRect     = function (Asurface: PSDL_Surface; var Arect: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Flip a surface vertically or horizontally.
  /// </summary>
  TSDL_FlipSurface            = function (Asurface: PSDL_Surface; Aflip: TSDL_FlipMode): bool; cdecl;

  /// <summary>
  ///  Creates a new surface identical to the existing surface.
  /// </summary>
  TSDL_DuplicateSurface       = function (Asurface: PSDL_Surface): PSDL_Surface; cdecl;

  /// <summary>
  ///  Creates a new surface identical to the existing surface, scaled to the
  ///  desired size.
  /// </summary>
  TSDL_ScaleSurface           = function (Asurface: PSDL_Surface; Awidth: int; Aheight: int; AscaleMode: TSDL_ScaleMode): PSDL_Surface; cdecl;

  /// <summary>
  ///  Copy an existing surface to a new surface of the specified format.
  /// </summary>
  TSDL_ConvertSurface         = function (Asurface: PSDL_Surface; Aformat: TSDL_PixelFormat): PSDL_Surface; cdecl;

  /// <summary>
  ///  Copy an existing surface to a new surface of the specified format and
  ///  colorspace.
  /// </summary>
  TSDL_ConvertSurfaceAndColorspace
                              = function (Asurface: PSDL_Surface; Aformat: TSDL_PixelFormat; Apalette: PSDL_Palette; Acolorspace: TSDL_Colorspace; Aprops: TSDL_PropertiesID): PSDL_Surface; cdecl;

  /// <summary>
  ///  Copy a block of pixels of one format to another format.
  /// </summary>
  TSDL_ConvertPixels          = function (Awidth: int; Aheight: int; Asrc_format: TSDL_PixelFormat; const Asrc: Pointer; Asrc_pitch: int; Adst_format: TSDL_PixelFormat; Adst: Pointer; Adst_pitch: int): bool; cdecl;

  /// <summary>
  ///  Copy a block of pixels of one format and colorspace to another format and
  ///  colorspace.
  /// </summary>
  TSDL_ConvertPixelsAndColorspace
                              = function (Awidth: int; Aheight: int; Asrc_format: TSDL_PixelFormat; Asrc_colorspace: TSDL_Colorspace; Asrc_properties: TSDL_PropertiesID; const Asrc: Pointer; Asrc_pitch: int; Adst_format: TSDL_PixelFormat; Adst_colorspace: TSDL_Colorspace; Adst_properties: TSDL_PropertiesID; Adst: Pointer; Adst_pitch: int): bool; cdecl;

  /// <summary>
  ///  Premultiply the alpha on a block of pixels.
  /// </summary>
  TSDL_PremultiplyAlpha       = function (Awidth: int; Aheight: int; Asrc_format: TSDL_PixelFormat; const Asrc: Pointer; Asrc_pitch: int; Adst_format: TSDL_PixelFormat; Adst: Pointer; Adst_pitch: int; Alinear: bool): bool; cdecl;

  /// <summary>
  ///  Premultiply the alpha in a surface.
  /// </summary>
  TSDL_PremultiplySurfaceAlpha= function (Asurface: PSDL_Surface; Alinear: bool): bool; cdecl;

  /// <summary>
  ///  Clear a surface with a specific color, with floating point precision.
  /// </summary>
  TSDL_ClearSurface           = function (Asurface: PSDL_Surface; Ar: float; Ag: float; Ab: float; Aa: float): bool; cdecl;

  /// <summary>
  ///  Perform a fast fill of a rectangle with a specific color.
  /// </summary>
  TSDL_FillSurfaceRect        = function (Adst: PSDL_Surface; const Arect: PSDL_Rect; Acolor: Uint32): bool; cdecl;

  /// <summary>
  ///  Perform a fast fill of a set of rectangles with a specific color.
  /// </summary>
  TSDL_FillSurfaceRects       = function (Adst: PSDL_Surface; const Arects: PSDL_Rect; Acount: int; Acolor: Uint32): bool; cdecl;

  /// <summary>
  ///  Performs a fast blit from the source surface to the destination surface
  ///  with clipping.
  /// </summary>
  TSDL_BlitSurface            = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Adst: PSDL_Surface; const Adstrect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Perform low-level surface blitting only.
  /// </summary>
  TSDL_BlitSurfaceUnchecked   = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Adst: PSDL_Surface; const Adstrect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Perform a scaled blit to a destination surface, which may be of a different
  ///  format.
  /// </summary>
  TSDL_BlitSurfaceScaled      = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Adst: PSDL_Surface; const Adstrect: PSDL_Rect; AscaleMode: TSDL_ScaleMode): bool; cdecl;

  /// <summary>
  ///  Perform low-level surface scaled blitting only.
  /// </summary>
  TSDL_BlitSurfaceUncheckedScaled
                              = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Adst: PSDL_Surface; const Adstrect: PSDL_Rect; AscaleMode: TSDL_ScaleMode): bool; cdecl;

  /// <summary>
  ///  Perform a tiled blit to a destination surface, which may be of a different
  ///  format.
  /// </summary>
  TSDL_BlitSurfaceTiled       = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Adst: PSDL_Surface; const Adstrect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Perform a scaled and tiled blit to a destination surface, which may be of a
  ///  different format.
  /// </summary>
  TSDL_BlitSurfaceTiledWithScale
                              = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Ascale: float; AscaleMode: TSDL_ScaleMode; Adst: PSDL_Surface; const Adstrect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Perform a scaled blit using the 9-grid algorithm to a destination surface,
  ///  which may be of a different format.
  /// </summary>
  TSDL_BlitSurface9Grid       = function (Asrc: PSDL_Surface; const Asrcrect: PSDL_Rect; Aleft_width: int; Aright_width: int; Atop_height: int; Abottom_height: int; Ascale: float; AscaleMode: TSDL_ScaleMode; Adst: PSDL_Surface; const Adstrect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Map an RGB triple to an opaque pixel value for a surface.
  /// </summary>
  TSDL_MapSurfaceRGB          = function (Asurface: PSDL_Surface; Ar: Uint8; Ag: Uint8; Ab: Uint8): Uint32; cdecl;

  /// <summary>
  ///  Map an RGBA quadruple to a pixel value for a surface.
  /// </summary>
  TSDL_MapSurfaceRGBA         = function (Asurface: PSDL_Surface; Ar: Uint8; Ag: Uint8; Ab: Uint8; Aa: Uint8): Uint32; cdecl;

  /// <summary>
  ///  Retrieves a single pixel from a surface.
  /// </summary>
  TSDL_ReadSurfacePixel       = function (Asurface: PSDL_Surface; Ax: int; Ay: int; var Ar: Uint8; var Ag: Uint8; var Ab: Uint8; var Aa: Uint8): bool; cdecl;

  /// <summary>
  ///  Retrieves a single pixel from a surface.
  /// </summary>
  TSDL_ReadSurfacePixelFloat  = function (Asurface: PSDL_Surface; Ax: int; Ay: int; var Ar: float; var Ag: float; var Ab: float; var Aa: float): bool; cdecl;

  /// <summary>
  ///  Writes a single pixel to a surface.
  /// </summary>
  TSDL_WriteSurfacePixel      = function (Asurface: PSDL_Surface; Ax: int; Ay: int; Ar: Uint8; Ag: Uint8; Ab: Uint8; Aa: Uint8): bool ; cdecl;

  /// <summary>
  ///  Writes a single pixel to a surface.
  /// </summary>
  TSDL_WriteSurfacePixelFloat = function (Asurface: PSDL_Surface; Ax: int; Ay: int; Ar: float; Ag: float; Ab: float; Aa: float): bool ; cdecl;

var
  SDL_CreateSurface           : TSDL_CreateSurface;
  SDL_CreateSurfaceFrom       : TSDL_CreateSurfaceFrom;
  SDL_DestroySurface          : TSDL_DestroySurface;
  SDL_GetSurfaceProperties    : TSDL_GetSurfaceProperties;
  SDL_SetSurfaceColorspace    : TSDL_SetSurfaceColorspace;
  SDL_GetSurfaceColorspace    : TSDL_GetSurfaceColorspace;
  SDL_CreateSurfacePalette    : TSDL_CreateSurfacePalette;
  SDL_SetSurfacePalette       : TSDL_SetSurfacePalette;
  SDL_GetSurfacePalette       : TSDL_GetSurfacePalette;
  SDL_AddSurfaceAlternateImage
                              : TSDL_AddSurfaceAlternateImage;
  SDL_SurfaceHasAlternateImages
                              : TSDL_SurfaceHasAlternateImages;
  SDL_GetSurfaceImages        : TSDL_GetSurfaceImages;
  SDL_RemoveSurfaceAlternateImages
                              : TSDL_RemoveSurfaceAlternateImages;
  SDL_LockSurface             : TSDL_LockSurface;
  SDL_UnlockSurface           : TSDL_UnlockSurface;
  SDL_LoadBMP_IO              : TSDL_LoadBMP_IO;
  SDL_LoadBMP                 : TSDL_LoadBMP;
  SDL_SaveBMP_IO              : TSDL_SaveBMP_IO;
  SDL_SaveBMP                 : TSDL_SaveBMP;
  SDL_SetSurfaceRLE           : TSDL_SetSurfaceRLE;
  SDL_SurfaceHasRLE           : TSDL_SurfaceHasRLE;
  SDL_SetSurfaceColorKey      : TSDL_SetSurfaceColorKey;
  SDL_SurfaceHasColorKey      : TSDL_SurfaceHasColorKey;
  SDL_GetSurfaceColorKey      : TSDL_GetSurfaceColorKey;
  SDL_SetSurfaceColorMod      : TSDL_SetSurfaceColorMod;
  SDL_GetSurfaceColorMod      : TSDL_GetSurfaceColorMod;
  SDL_SetSurfaceAlphaMod      : TSDL_SetSurfaceAlphaMod;
  SDL_GetSurfaceAlphaMod      : TSDL_GetSurfaceAlphaMod;
  SDL_SetSurfaceBlendMode     : TSDL_SetSurfaceBlendMode;
  SDL_GetSurfaceBlendMode     : TSDL_GetSurfaceBlendMode;
  SDL_SetSurfaceClipRect      : TSDL_SetSurfaceClipRect;
  SDL_GetSurfaceClipRect      : TSDL_GetSurfaceClipRect;
  SDL_FlipSurface             : TSDL_FlipSurface;
  SDL_DuplicateSurface        : TSDL_DuplicateSurface;
  SDL_ScaleSurface            : TSDL_ScaleSurface;
  SDL_ConvertSurface          : TSDL_ConvertSurface;
  SDL_ConvertSurfaceAndColorspace
                              : TSDL_ConvertSurfaceAndColorspace;
  SDL_ConvertPixels           : TSDL_ConvertPixels;
  SDL_ConvertPixelsAndColorspace
                              : TSDL_ConvertPixelsAndColorspace;
  SDL_PremultiplyAlpha        : TSDL_PremultiplyAlpha;
  SDL_PremultiplySurfaceAlpha : TSDL_PremultiplySurfaceAlpha;
  SDL_ClearSurface            : TSDL_ClearSurface;
  SDL_FillSurfaceRect         : TSDL_FillSurfaceRect;
  SDL_FillSurfaceRects        : TSDL_FillSurfaceRects;
  SDL_BlitSurface             : TSDL_BlitSurface;
  SDL_BlitSurfaceUnchecked    : TSDL_BlitSurfaceUnchecked;
  SDL_BlitSurfaceScaled       : TSDL_BlitSurfaceScaled;
  SDL_BlitSurfaceUncheckedScaled
                              : TSDL_BlitSurfaceUncheckedScaled;
  SDL_BlitSurfaceTiled        : TSDL_BlitSurfaceTiled;
  SDL_BlitSurfaceTiledWithScale
                              : TSDL_BlitSurfaceTiledWithScale;
  SDL_BlitSurface9Grid        : TSDL_BlitSurface9Grid;
  SDL_MapSurfaceRGB           : TSDL_MapSurfaceRGB;
  SDL_MapSurfaceRGBA          : TSDL_MapSurfaceRGBA;
  SDL_ReadSurfacePixel        : TSDL_ReadSurfacePixel;
  SDL_ReadSurfacePixelFloat   : TSDL_ReadSurfacePixelFloat;
  SDL_WriteSurfacePixel       : TSDL_WriteSurfacePixel;
  SDL_WriteSurfacePixelFloat  : TSDL_WriteSurfacePixelFloat;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_CreateSurface          := BindProcedure(AHandle, 'SDL_CreateSurface');
  @SDL_CreateSurfaceFrom      := BindProcedure(AHandle, 'SDL_CreateSurfaceFrom');
  @SDL_DestroySurface         := BindProcedure(AHandle, 'SDL_DestroySurface');
  @SDL_GetSurfaceProperties   := BindProcedure(AHandle, 'SDL_GetSurfaceProperties');
  @SDL_SetSurfaceColorspace   := BindProcedure(AHandle, 'SDL_SetSurfaceColorspace');
  @SDL_GetSurfaceColorspace   := BindProcedure(AHandle, 'SDL_GetSurfaceColorspace');
  @SDL_CreateSurfacePalette   := BindProcedure(AHandle, 'SDL_CreateSurfacePalette');
  @SDL_SetSurfacePalette      := BindProcedure(AHandle, 'SDL_SetSurfacePalette');
  @SDL_GetSurfacePalette      := BindProcedure(AHandle, 'SDL_GetSurfacePalette');
  @SDL_AddSurfaceAlternateImage
                              := BindProcedure(AHandle, 'SDL_AddSurfaceAlternateImage');
  @SDL_SurfaceHasAlternateImages
                              := BindProcedure(AHandle, 'SDL_SurfaceHasAlternateImages');
  @SDL_GetSurfaceImages       := BindProcedure(AHandle, 'SDL_GetSurfaceImages');
  @SDL_RemoveSurfaceAlternateImages
                              := BindProcedure(AHandle, 'SDL_RemoveSurfaceAlternateImages');
  @SDL_LockSurface            := BindProcedure(AHandle, 'SDL_LockSurface');
  @SDL_UnlockSurface          := BindProcedure(AHandle, 'SDL_UnlockSurface');
  @SDL_LoadBMP_IO             := BindProcedure(AHandle, 'SDL_LoadBMP_IO');
  @SDL_LoadBMP                := BindProcedure(AHandle, 'SDL_LoadBMP');
  @SDL_SaveBMP_IO             := BindProcedure(AHandle, 'SDL_SaveBMP_IO');
  @SDL_SaveBMP                := BindProcedure(AHandle, 'SDL_SaveBMP');
  @SDL_SetSurfaceRLE          := BindProcedure(AHandle, 'SDL_SetSurfaceRLE');
  @SDL_SurfaceHasRLE          := BindProcedure(AHandle, 'SDL_SurfaceHasRLE');
  @SDL_SetSurfaceColorKey     := BindProcedure(AHandle, 'SDL_SetSurfaceColorKey');
  @SDL_SurfaceHasColorKey     := BindProcedure(AHandle, 'SDL_SurfaceHasColorKey');
  @SDL_GetSurfaceColorKey     := BindProcedure(AHandle, 'SDL_GetSurfaceColorKey');
  @SDL_SetSurfaceColorMod     := BindProcedure(AHandle, 'SDL_SetSurfaceColorMod');
  @SDL_GetSurfaceColorMod     := BindProcedure(AHandle, 'SDL_GetSurfaceColorMod');
  @SDL_SetSurfaceAlphaMod     := BindProcedure(AHandle, 'SDL_SetSurfaceAlphaMod');
  @SDL_GetSurfaceAlphaMod     := BindProcedure(AHandle, 'SDL_GetSurfaceAlphaMod');
  @SDL_SetSurfaceBlendMode    := BindProcedure(AHandle, 'SDL_SetSurfaceBlendMode');
  @SDL_GetSurfaceBlendMode    := BindProcedure(AHandle, 'SDL_GetSurfaceBlendMode');
  @SDL_SetSurfaceClipRect     := BindProcedure(AHandle, 'SDL_SetSurfaceClipRect');
  @SDL_GetSurfaceClipRect     := BindProcedure(AHandle, 'SDL_GetSurfaceClipRect');
  @SDL_FlipSurface            := BindProcedure(AHandle, 'SDL_FlipSurface');
  @SDL_DuplicateSurface       := BindProcedure(AHandle, 'SDL_DuplicateSurface');
  @SDL_ScaleSurface           := BindProcedure(AHandle, 'SDL_ScaleSurface');
  @SDL_ConvertSurface         := BindProcedure(AHandle, 'SDL_ConvertSurface');
  @SDL_ConvertSurfaceAndColorspace
                              := BindProcedure(AHandle, 'SDL_ConvertSurfaceAndColorspace');
  @SDL_ConvertPixels          := BindProcedure(AHandle, 'SDL_ConvertPixels');
  @SDL_ConvertPixelsAndColorspace
                              := BindProcedure(AHandle, 'SDL_ConvertPixelsAndColorspace');
  @SDL_PremultiplyAlpha       := BindProcedure(AHandle, 'SDL_PremultiplyAlpha');
  @SDL_PremultiplySurfaceAlpha:= BindProcedure(AHandle, 'SDL_PremultiplySurfaceAlpha');
  @SDL_ClearSurface           := BindProcedure(AHandle, 'SDL_ClearSurface');
  @SDL_FillSurfaceRect        := BindProcedure(AHandle, 'SDL_FillSurfaceRect');
  @SDL_FillSurfaceRects       := BindProcedure(AHandle, 'SDL_FillSurfaceRects');
  @SDL_BlitSurface            := BindProcedure(AHandle, 'SDL_BlitSurface');
  @SDL_BlitSurfaceUnchecked   := BindProcedure(AHandle, 'SDL_BlitSurfaceUnchecked');
  @SDL_BlitSurfaceScaled      := BindProcedure(AHandle, 'SDL_BlitSurfaceScaled');
  @SDL_BlitSurfaceUncheckedScaled
                              := BindProcedure(AHandle, 'SDL_BlitSurfaceUncheckedScaled');
  @SDL_BlitSurfaceTiled       := BindProcedure(AHandle, 'SDL_BlitSurfaceTiled');
  @SDL_BlitSurfaceTiledWithScale
                              := BindProcedure(AHandle, 'SDL_BlitSurfaceTiledWithScale');
  @SDL_BlitSurface9Grid       := BindProcedure(AHandle, 'SDL_BlitSurface9Grid');
  @SDL_MapSurfaceRGB          := BindProcedure(AHandle, 'SDL_MapSurfaceRGB');
  @SDL_MapSurfaceRGBA         := BindProcedure(AHandle, 'SDL_MapSurfaceRGBA');
  @SDL_ReadSurfacePixel       := BindProcedure(AHandle, 'SDL_ReadSurfacePixel');
  @SDL_ReadSurfacePixelFloat  := BindProcedure(AHandle, 'SDL_ReadSurfacePixelFloat');
  @SDL_WriteSurfacePixel      := BindProcedure(AHandle, 'SDL_WriteSurfacePixel');
  @SDL_WriteSurfacePixelFloat := BindProcedure(AHandle, 'SDL_WriteSurfacePixelFloat');
end;

end.
