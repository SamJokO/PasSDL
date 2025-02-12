unit SDL_pixels;

interface

uses
  SDL.Types,
  SDL_stdinc;

const
  SDL_ALPHA_OPAQUE            = 255;
  SDL_ALPHA_OPAQUE_FLOAT      = 1.0;
  SDL_ALPHA_TRANSPARENT       = 0;
  SDL_ALPHA_TRANSPARENT_FLOAT = 1.0;

type
  TSDL_PixelType              = (
                                  SDL_PIXELTYPE_UNKNOWN,
                                  SDL_PIXELTYPE_INDEX1,
                                  SDL_PIXELTYPE_INDEX4,
                                  SDL_PIXELTYPE_INDEX8,
                                  SDL_PIXELTYPE_PACKED8,
                                  SDL_PIXELTYPE_PACKED16,
                                  SDL_PIXELTYPE_PACKED32,
                                  SDL_PIXELTYPE_ARRAYU8,
                                  SDL_PIXELTYPE_ARRAYU16,
                                  SDL_PIXELTYPE_ARRAYU32,
                                  SDL_PIXELTYPE_ARRAYF16,
                                  SDL_PIXELTYPE_ARRAYF32,
                                  // appended at the end for compatibility with sdl2-compat:
                                  SDL_PIXELTYPE_INDEX2
                                );
  PSDL_PixelType              = ^TSDL_PixelType;

  TSDL_BitmapOrder            = (
                                  SDL_BITMAPORDER_NONE,
                                  SDL_BITMAPORDER_4321,
                                  SDL_BITMAPORDER_1234
                                );
  PSDL_BitmapOrder            = ^TSDL_BitmapOrder;

  TSDL_PackedOrder            = (
                                  SDL_PACKEDORDER_NONE,
                                  SDL_PACKEDORDER_XRGB,
                                  SDL_PACKEDORDER_RGBX,
                                  SDL_PACKEDORDER_ARGB,
                                  SDL_PACKEDORDER_RGBA,
                                  SDL_PACKEDORDER_XBGR,
                                  SDL_PACKEDORDER_BGRX,
                                  SDL_PACKEDORDER_ABGR,
                                  SDL_PACKEDORDER_BGRA
                                );
  PSDL_PackedOrder            = ^TSDL_PackedOrder;

  TSDL_ArrayOrder             = (
                                  SDL_ARRAYORDER_NONE,
                                  SDL_ARRAYORDER_RGB,
                                  SDL_ARRAYORDER_RGBA,
                                  SDL_ARRAYORDER_ARGB,
                                  SDL_ARRAYORDER_BGR,
                                  SDL_ARRAYORDER_BGRA,
                                  SDL_ARRAYORDER_ABGR
                                );
  PSDL_ArrayOrder             = ^TSDL_ArrayOrder;

  TSDL_PackedLayout           = (
                                  SDL_PACKEDLAYOUT_NONE,
                                  SDL_PACKEDLAYOUT_332,
                                  SDL_PACKEDLAYOUT_4444,
                                  SDL_PACKEDLAYOUT_1555,
                                  SDL_PACKEDLAYOUT_5551,
                                  SDL_PACKEDLAYOUT_565,
                                  SDL_PACKEDLAYOUT_8888,
                                  SDL_PACKEDLAYOUT_2101010,
                                  SDL_PACKEDLAYOUT_1010102
                                );
  PSDL_PackedLayout           = ^TSDL_PackedLayout;

  TSDL_PixelFormat            = (
                                  SDL_PIXELFORMAT_UNKNOWN = 0,
                                  SDL_PIXELFORMAT_INDEX1LSB = $11100100,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0, 1, 0),
                                  SDL_PIXELFORMAT_INDEX1MSB = $11200100,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0, 1, 0),
                                  SDL_PIXELFORMAT_INDEX2LSB = $1c100200,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_4321, 0, 2, 0),
                                  SDL_PIXELFORMAT_INDEX2MSB = $1c200200,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_1234, 0, 2, 0),
                                  SDL_PIXELFORMAT_INDEX4LSB = $12100400,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0, 4, 0),
                                  SDL_PIXELFORMAT_INDEX4MSB = $12200400,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0, 4, 0),
                                  SDL_PIXELFORMAT_INDEX8 = $13000801,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1),
                                  SDL_PIXELFORMAT_RGB332 = $14110801,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_332, 8, 1),
                                  SDL_PIXELFORMAT_XRGB4444 = $15120c02,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_4444, 12, 2),
                                  SDL_PIXELFORMAT_XBGR4444 = $15520c02,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_4444, 12, 2),
                                  SDL_PIXELFORMAT_XRGB1555 = $15130f02,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_1555, 15, 2),
                                  SDL_PIXELFORMAT_XBGR1555 = $15530f02,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_1555, 15, 2),
                                  SDL_PIXELFORMAT_ARGB4444 = $15321002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_4444, 16, 2),
                                  SDL_PIXELFORMAT_RGBA4444 = $15421002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_4444, 16, 2),
                                  SDL_PIXELFORMAT_ABGR4444 = $15721002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_4444, 16, 2),
                                  SDL_PIXELFORMAT_BGRA4444 = $15821002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_4444, 16, 2),
                                  SDL_PIXELFORMAT_ARGB1555 = $15331002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_1555, 16, 2),
                                  SDL_PIXELFORMAT_RGBA5551 = $15441002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_5551, 16, 2),
                                  SDL_PIXELFORMAT_ABGR1555 = $15731002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_1555, 16, 2),
                                  SDL_PIXELFORMAT_BGRA5551 = $15841002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_5551, 16, 2),
                                  SDL_PIXELFORMAT_RGB565 = $15151002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_565, 16, 2),
                                  SDL_PIXELFORMAT_BGR565 = $15551002,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_565, 16, 2),
                                  SDL_PIXELFORMAT_RGB24 = $17101803,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0, 24, 3),
                                  SDL_PIXELFORMAT_BGR24 = $17401803,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0, 24, 3),
                                  SDL_PIXELFORMAT_XRGB8888 = $16161804,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_8888, 24, 4),
                                  SDL_PIXELFORMAT_RGBX8888 = $16261804,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX, SDL_PACKEDLAYOUT_8888, 24, 4),
                                  SDL_PIXELFORMAT_XBGR8888 = $16561804,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_8888, 24, 4),
                                  SDL_PIXELFORMAT_BGRX8888 = $16661804,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX, SDL_PACKEDLAYOUT_8888, 24, 4),
                                  SDL_PIXELFORMAT_ARGB8888 = $16362004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_8888, 32, 4),
                                  SDL_PIXELFORMAT_RGBA8888 = $16462004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4),
                                  SDL_PIXELFORMAT_ABGR8888 = $16762004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_8888, 32, 4),
                                  SDL_PIXELFORMAT_BGRA8888 = $16862004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_8888, 32, 4),
                                  SDL_PIXELFORMAT_XRGB2101010 = $16172004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_2101010, 32, 4),
                                  SDL_PIXELFORMAT_XBGR2101010 = $16572004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_2101010, 32, 4),
                                  SDL_PIXELFORMAT_ARGB2101010 = $16372004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_2101010, 32, 4),
                                  SDL_PIXELFORMAT_ABGR2101010 = $16772004,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_2101010, 32, 4),
                                  SDL_PIXELFORMAT_RGB48 = $18103006,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGB, 0, 48, 6),
                                  SDL_PIXELFORMAT_BGR48 = $18403006,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGR, 0, 48, 6),
                                  SDL_PIXELFORMAT_RGBA64 = $18204008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGBA, 0, 64, 8),
                                  SDL_PIXELFORMAT_ARGB64 = $18304008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ARGB, 0, 64, 8),
                                  SDL_PIXELFORMAT_BGRA64 = $18504008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGRA, 0, 64, 8),
                                  SDL_PIXELFORMAT_ABGR64 = $18604008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ABGR, 0, 64, 8),
                                  SDL_PIXELFORMAT_RGB48_FLOAT = $1a103006,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGB, 0, 48, 6),
                                  SDL_PIXELFORMAT_BGR48_FLOAT = $1a403006,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGR, 0, 48, 6),
                                  SDL_PIXELFORMAT_RGBA64_FLOAT = $1a204008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGBA, 0, 64, 8),
                                  SDL_PIXELFORMAT_ARGB64_FLOAT = $1a304008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ARGB, 0, 64, 8),
                                  SDL_PIXELFORMAT_BGRA64_FLOAT = $1a504008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGRA, 0, 64, 8),
                                  SDL_PIXELFORMAT_ABGR64_FLOAT = $1a604008,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ABGR, 0, 64, 8),
                                  SDL_PIXELFORMAT_RGB96_FLOAT = $1b10600c,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGB, 0, 96, 12),
                                  SDL_PIXELFORMAT_BGR96_FLOAT = $1b40600c,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGR, 0, 96, 12),
                                  SDL_PIXELFORMAT_RGBA128_FLOAT = $1b208010,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGBA, 0, 128, 16),
                                  SDL_PIXELFORMAT_ARGB128_FLOAT = $1b308010,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ARGB, 0, 128, 16),
                                  SDL_PIXELFORMAT_BGRA128_FLOAT = $1b508010,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGRA, 0, 128, 16),
                                  SDL_PIXELFORMAT_ABGR128_FLOAT = $1b608010,
                                      // SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ABGR, 0, 128, 16),

                                  SDL_PIXELFORMAT_YV12 = $32315659,      //*< Planar mode: Y + V + U  (3 planes)
                                      // SDL_DEFINE_PIXELFOURCC('Y', 'V', '1', '2'), */
                                  SDL_PIXELFORMAT_IYUV = $56555949,      //*< Planar mode: Y + U + V  (3 planes)
                                      // SDL_DEFINE_PIXELFOURCC('I', 'Y', 'U', 'V'), */
                                  SDL_PIXELFORMAT_YUY2 = $32595559,      //*< Packed mode: Y0+U0+Y1+V0 (1 plane)
                                      // SDL_DEFINE_PIXELFOURCC('Y', 'U', 'Y', '2'), */
                                  SDL_PIXELFORMAT_UYVY = $59565955,      //*< Packed mode: U0+Y0+V0+Y1 (1 plane)
                                      // SDL_DEFINE_PIXELFOURCC('U', 'Y', 'V', 'Y'), */
                                  SDL_PIXELFORMAT_YVYU = $55595659,      //*< Packed mode: Y0+V0+Y1+U0 (1 plane)
                                      // SDL_DEFINE_PIXELFOURCC('Y', 'V', 'Y', 'U'), */
                                  SDL_PIXELFORMAT_NV12 = $3231564e,      //*< Planar mode: Y + U/V interleaved  (2 planes)
                                      // SDL_DEFINE_PIXELFOURCC('N', 'V', '1', '2'), */
                                  SDL_PIXELFORMAT_NV21 = $3132564e,      //*< Planar mode: Y + V/U interleaved  (2 planes)
                                      // SDL_DEFINE_PIXELFOURCC('N', 'V', '2', '1'), */
                                  SDL_PIXELFORMAT_P010 = $30313050,      //*< Planar mode: Y + U/V interleaved  (2 planes)
                                      // SDL_DEFINE_PIXELFOURCC('P', '0', '1', '0'), */
                                  SDL_PIXELFORMAT_EXTERNAL_OES = $2053454f,     //*< Android video texture format
                                      // SDL_DEFINE_PIXELFOURCC('O', 'E', 'S', ' ') */

                                  // Aliases for RGBA byte arrays of color data, for the current platform
{$IF DEFINED(LITTLE_ENDIAN)}
                                  SDL_PIXELFORMAT_RGBA32 = SDL_PIXELFORMAT_ABGR8888,
                                  SDL_PIXELFORMAT_ARGB32 = SDL_PIXELFORMAT_BGRA8888,
                                  SDL_PIXELFORMAT_BGRA32 = SDL_PIXELFORMAT_ARGB8888,
                                  SDL_PIXELFORMAT_ABGR32 = SDL_PIXELFORMAT_RGBA8888,
                                  SDL_PIXELFORMAT_RGBX32 = SDL_PIXELFORMAT_XBGR8888,
                                  SDL_PIXELFORMAT_XRGB32 = SDL_PIXELFORMAT_BGRX8888,
                                  SDL_PIXELFORMAT_BGRX32 = SDL_PIXELFORMAT_XRGB8888,
                                  SDL_PIXELFORMAT_XBGR32 = SDL_PIXELFORMAT_RGBX8888
{$ELSE}
                                  SDL_PIXELFORMAT_RGBA32 = SDL_PIXELFORMAT_RGBA8888,
                                  SDL_PIXELFORMAT_ARGB32 = SDL_PIXELFORMAT_ARGB8888,
                                  SDL_PIXELFORMAT_BGRA32 = SDL_PIXELFORMAT_BGRA8888,
                                  SDL_PIXELFORMAT_ABGR32 = SDL_PIXELFORMAT_ABGR8888,
                                  SDL_PIXELFORMAT_RGBX32 = SDL_PIXELFORMAT_RGBX8888,
                                  SDL_PIXELFORMAT_XRGB32 = SDL_PIXELFORMAT_XRGB8888,
                                  SDL_PIXELFORMAT_BGRX32 = SDL_PIXELFORMAT_BGRX8888,
                                  SDL_PIXELFORMAT_XBGR32 = SDL_PIXELFORMAT_XBGR8888
{$ENDIF}
                                );
  PSDL_PixelFormat = ^TSDL_PixelFormat;

  function SDL_DEFINE_PIXELFOURCC(A: AnsiChar; B: AnsiChar; C: AnsiChar; D: AnsiChar): TSDL_PixelFormat;

type
  TSDL_Colorspace             = (
                                  SDL_COLORSPACE_UNKNOWN                = 0,
                                  SDL_COLORSPACE_SRGB                   = $120005a0,
                                  SDL_COLORSPACE_SRGB_LINEAR            = $12000500,
                                  SDL_COLORSPACE_HDR10                  = $12002600,
                                  SDL_COLORSPACE_JPEG                   = $220004c6,
                                  SDL_COLORSPACE_BT601_LIMITED          = $211018c6,
                                  SDL_COLORSPACE_BT601_FULL             = $221018c6,
                                  SDL_COLORSPACE_BT709_LIMITED          = $21100421,
                                  SDL_COLORSPACE_BT709_FULL             = $22100421,
                                  SDL_COLORSPACE_BT2020_LIMITED         = $21102609,
                                  SDL_COLORSPACE_BT2020_FULL            = $22102609,
                                  SDL_COLORSPACE_RGB_DEFAULT            = SDL_COLORSPACE_SRGB,
                                  SDL_COLORSPACE_YUV_DEFAULT            = SDL_COLORSPACE_JPEG
                                );
  PSDL_Colorspace             = ^TSDL_Colorspace;

  TSDL_Color = record
    r                           : Uint8;
    g                           : Uint8;
    b                           : Uint8;
    a                           : Uint8;
  end;
  PSDL_Color = ^TSDL_Color;

  TSDL_FColor = record
    r                           : float;
    g                           : float;
    b                           : float;
    a                           : float;
  end;
  PSDL_FColor = ^TSDL_FColor;

  TSDL_Palette = record
    ncolors                     : int;
    colors                      : PSDL_Color;
    version                     : Uint32;
    refcount                    : int;
  end;
  PSDL_Palette = ^TSDL_Palette;

  TSDL_PixelFormatDetails = record
    format                      : TSDL_PixelFormat;
    bits_per_pixel              : Uint8;
    bytes_per_pixel             : Uint8;
    padding                     : array[0..1] of Uint8;
    Rmask                       : Uint32;
    Gmask                       : Uint32;
    Bmask                       : Uint32;
    Amask                       : Uint32;
    Rbits                       : Uint8;
    Gbits                       : Uint8;
    Bbits                       : Uint8;
    Abits                       : Uint8;
    Rshift                      : Uint8;
    Gshift                      : Uint8;
    Bshift                      : Uint8;
    Ashift                      : Uint8;
  end;
  PSDL_PixelFormatDetails = ^TSDL_PixelFormatDetails;

type
  /// <summary>
  ///  Get the human readable name of a pixel format.
  /// </summary>
  TSDL_GetPixelFormatName     = function (Aformat: TSDL_PixelFormat): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
  /// </summary>
  TSDL_GetMasksForPixelformat = function (Aformat: TSDL_PixelFormat; Abpp: Pint; ARmask: PUint32; AGmasl: PUint32; Bmask: PUint32; Amask: PUint32): bool; cdecl;

  /// <summary>
  ///  Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
  /// </summary>
  TSDL_TGetPixelFormatForMasks= function (Abpp: int; Rmask: Uint32; Gmask: Uint32; Bmask: Uint32; Amask: Uint32): TSDL_PixelFormat; cdecl;

  /// <summary>
  ///  Create an SDL_PixelFormatDetails structure corresponding to a pixel format.
  /// </summary>
  TSDL_GetPixelFormatDetails  = function (Aformat: TSDL_PixelFormat): PSDL_PixelFormatDetails; cdecl;

  /// <summary>
  ///  Create a palette structure with the specified number of color entries.
  /// </summary>
  TSDL_CreatePalette          = function (Ancolors: int): PSDL_Palette; cdecl;

  /// <summary>
  ///  Set a range of colors in a palette.
  /// </summary>
  TSDL_SetPaletteColors       = function (APalette: PSDL_Palette; const Acolors: PSDL_Color; Afirstcolor: int; Ancolors: int): bool; cdecl;

  /// <summary>
  ///  Free a palette created with SDL_CreatePalette().
  /// </summary>
  TSDL_DestroyPalette         = procedure (Apalette: PSDL_Palette); cdecl;

  /// <summary>
  ///  Map an RGB triple to an opaque pixel value for a given pixel format.
  /// </summary>
  TSDL_MapRGB                 = function (const Aformat: PSDL_PixelFormatDetails; const Apalette: PSDL_Palette; Ar: Uint8; Ag: Uint8; Ab: Uint8): Uint32; cdecl;

  /// <summary>
  ///  Map an RGBA quadruple to a pixel value for a given pixel format.
  /// </summary>
  TSDL_MapRGBA                = function (const Aformat: PSDL_PixelFormatDetails; const Apalette: PSDL_Palette; Ar: Uint8; Ag: Uint8; Ab: Uint8; Aa: Uint8): Uint32; cdecl;

  /// <summary>
  ///  Get RGB values from a pixel in the specified format.
  /// </summary>
  TSDL_GetRGB                 = procedure (Apixel: Uint32; const Aformat: PSDL_PixelFormatDetails; const Apalette: PSDL_Palette; var Ar: Uint8; var Ag: Uint8; var Ab: Uint8); cdecl;

  /// <summary>
  ///  Get RGBA values from a pixel in the specified format.
  /// </summary>
  TSDL_GetRGBA                = procedure (Apixel: Uint32; const Aformat: PSDL_PixelFormatDetails; const Apalette: PSDL_Palette; var Ar: Uint8; var Ag: Uint8; var Ab: Uint8; var Aa: Uint8); cdecl;

var
  SDL_GetPixelFormatName      : TSDL_GetPixelFormatName;
  SDL_GetMasksForPixelformat  : TSDL_GetMasksForPixelformat;
  SDL_TGetPixelFormatForMasks : TSDL_TGetPixelFormatForMasks;
  SDL_GetPixelFormatDetails   : TSDL_GetPixelFormatDetails;
  SDL_CreatePalette           : TSDL_CreatePalette;
  SDL_SetPaletteColors        : TSDL_SetPaletteColors;
  SDL_DestroyPalette          : TSDL_DestroyPalette;
  SDL_MapRGB                  : TSDL_MapRGB;
  SDL_MapRGBA                 : TSDL_MapRGBA;
  SDL_GetRGB                  : TSDL_GetRGB;
  SDL_GetRGBA                 : TSDL_GetRGBA;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_DEFINE_PIXELFOURCC(A: AnsiChar; B: AnsiChar; C: AnsiChar; D: AnsiChar): TSDL_PixelFormat;
begin
//  A in TSDL_PixelFormat
  Result                      := TSDL_PixelFormat(SDL_FOURCC(A, B, C, D));
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetPixelFormatName     := BindProcedure(AHandle, 'SDL_GetPixelFormatName');
  @SDL_GetMasksForPixelformat := BindProcedure(AHandle, 'SDL_GetMasksForPixelformat');
  @SDL_TGetPixelFormatForMasks:= BindProcedure(AHandle, 'SDL_TGetPixelFormatForMasks');
  @SDL_GetPixelFormatDetails  := BindProcedure(AHandle, 'SDL_GetPixelFormatDetails');
  @SDL_CreatePalette          := BindProcedure(AHandle, 'SDL_CreatePalette');
  @SDL_SetPaletteColors       := BindProcedure(AHandle, 'SDL_SetPaletteColors');
  @SDL_DestroyPalette         := BindProcedure(AHandle, 'SDL_DestroyPalette');
  @SDL_MapRGB                 := BindProcedure(AHandle, 'SDL_MapRGB');
  @SDL_MapRGBA                := BindProcedure(AHandle, 'SDL_MapRGBA');
  @SDL_GetRGB                 := BindProcedure(AHandle, 'SDL_GetRGB');
  @SDL_GetRGBA                := BindProcedure(AHandle, 'SDL_GetRGBA');
end;

end.
