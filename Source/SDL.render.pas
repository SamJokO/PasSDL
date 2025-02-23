unit SDL.render;

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
  SDL.error,
  SDL.events,
  SDL.pixels,
  SDL.properties,
  SDL.rect,
  SDL.surface,
  SDL.video;

const
  SDL_SOFTWARE_RENDERER       = 'software';

type
  TSDL_Vertex = record
    position                    : TSDL_FPoint;
    color                       : TSDL_FColor;
    tex_coord                   : TSDL_FPoint;
  end;
  PSDL_Vertex = ^TSDL_Vertex;

  TSDL_TextureAccess          = (
                                  SDL_TEXTUREACCESS_STATIC,
                                  SDL_TEXTUREACCESS_STREAMING,
                                  SDL_TEXTUREACCESS_TARGET
                                );
  PSDL_TextureAccess          = ^TSDL_TextureAccess;

  TSDL_RendererLogicalPresentation
                              = (
                                  SDL_LOGICAL_PRESENTATION_DISABLED,
                                  SDL_LOGICAL_PRESENTATION_STRETCH,
                                  SDL_LOGICAL_PRESENTATION_LETTERBOX,
                                  SDL_LOGICAL_PRESENTATION_OVERSCAN,
                                  SDL_LOGICAL_PRESENTATION_INTEGER_SCALE
                                );
  PSDL_RendererLogicalPresentation
                              = ^TSDL_RendererLogicalPresentation;

  TSDL_Renderer = record end;
  PSDL_Renderer = ^TSDL_Renderer;

  TSDL_Texture = record
    format                      : TSDL_PixelFormat;
    w                           : int;
    h                           : int;
    refcount                    : int;
  end;
  PSDL_Texture = ^TSDL_Texture;

  /// <summary>
  ///  Get the number of 2D rendering drivers available for the current display.
  /// </summary>
  TSDL_GetNumRenderDrivers    = function (): int; cdecl;

  /// <summary>
  ///  Use this function to get the name of a built in 2D rendering driver.
  /// </summary>
  TSDL_GetRenderDriver        = function (Aindex: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Create a window and default renderer.
  /// </summary>
  TSDL_CreateWindowAndRenderer= function (const Atitle: PAnsiChar; Awidth: int; Aheight: int; Awindow_flags: TSDL_WindowFlags; var Awindow: PSDL_Window; var Arenderer: PSDL_Renderer): bool; cdecl;

  /// <summary>
  ///  Create a 2D rendering context for a window.
  /// </summary>
  TSDL_CreateRenderer         = function (Awindow: PSDL_Window; const Aname: PAnsiChar): PSDL_Renderer; cdecl;

  /// <summary>
  ///  Create a 2D rendering context for a window, with the specified properties.
  /// </summary>
  TSDL_CreateRendererWithProperties
                              = function (Aprops: TSDL_PropertiesID): PSDL_Renderer; cdecl;

const
  SDL_PROP_RENDERER_CREATE_NAME_STRING                               = 'SDL.renderer.create.name';
  SDL_PROP_RENDERER_CREATE_WINDOW_POINTER                            = 'SDL.renderer.create.window';
  SDL_PROP_RENDERER_CREATE_SURFACE_POINTER                           = 'SDL.renderer.create.surface';
  SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER                  = 'SDL.renderer.create.output_colorspace';
  SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER                      = 'SDL.renderer.create.present_vsync';
  SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER                   = 'SDL.renderer.create.vulkan.instance';
  SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER                     = 'SDL.renderer.create.vulkan.surface';
  SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER            = 'SDL.renderer.create.vulkan.physical_device';
  SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER                     = 'SDL.renderer.create.vulkan.device';
  SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = 'SDL.renderer.create.vulkan.graphics_queue_family_index';
  SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER  = 'SDL.renderer.create.vulkan.present_queue_family_index';

type
  /// <summary>
  ///  Create a 2D software rendering context for a surface.
  /// </summary>
  TSDL_CreateSoftwareRenderer = function (Asurface: PSDL_Surface): PSDL_Renderer; cdecl;

  /// <summary>
  ///  Get the renderer associated with a window.
  /// </summary>
  TSDL_GetRenderer            = function (Awindow: PSDL_Window): PSDL_Renderer; cdecl;

  /// <summary>
  ///  Get the window associated with a renderer.
  /// </summary>
  TSDL_GetRenderWindow        = function (Arenderer: PSDL_Renderer): PSDL_Window; cdecl;

  /// <summary>
  ///  Get the name of a renderer.
  /// </summary>
  TSDL_GetRendererName        = function (Arenderer: PSDL_Renderer): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the properties associated with a renderer.
  /// </summary>
  TSDL_GetRendererProperties  = function (Arenderer: PSDL_Renderer): TSDL_PropertiesID; cdecl;

const
  SDL_PROP_RENDERER_NAME_STRING                                = 'SDL.renderer.name';
  SDL_PROP_RENDERER_WINDOW_POINTER                             = 'SDL.renderer.window';
  SDL_PROP_RENDERER_SURFACE_POINTER                            = 'SDL.renderer.surface';
  SDL_PROP_RENDERER_VSYNC_NUMBER                               = 'SDL.renderer.vsync';
  SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER                    = 'SDL.renderer.max_texture_size';
  SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER                    = 'SDL.renderer.texture_formats';
  SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER                   = 'SDL.renderer.output_colorspace';
  SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN                        = 'SDL.renderer.HDR_enabled';
  SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT                      = 'SDL.renderer.SDR_white_point';
  SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT                         = 'SDL.renderer.HDR_headroom';
  SDL_PROP_RENDERER_D3D9_DEVICE_POINTER                        = 'SDL.renderer.d3d9.device';
  SDL_PROP_RENDERER_D3D11_DEVICE_POINTER                       = 'SDL.renderer.d3d11.device';
  SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER                    = 'SDL.renderer.d3d11.swap_chain';
  SDL_PROP_RENDERER_D3D12_DEVICE_POINTER                       = 'SDL.renderer.d3d12.device';
  SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER                    = 'SDL.renderer.d3d12.swap_chain';
  SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER                = 'SDL.renderer.d3d12.command_queue';
  SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER                    = 'SDL.renderer.vulkan.instance';
  SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER                      = 'SDL.renderer.vulkan.surface';
  SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER             = 'SDL.renderer.vulkan.physical_device';
  SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER                      = 'SDL.renderer.vulkan.device';
  SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER  = 'SDL.renderer.vulkan.graphics_queue_family_index';
  SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER   = 'SDL.renderer.vulkan.present_queue_family_index';
  SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER        = 'SDL.renderer.vulkan.swapchain_image_count';
  SDL_PROP_RENDERER_GPU_DEVICE_POINTER                         = 'SDL.renderer.gpu.device';

type
  /// <summary>
  ///  Get the output size in pixels of a rendering context.
  /// </summary>
  TSDL_GetRenderOutputSize    = function (Arenderer: PSDL_Renderer; var Aw: int; var Ah: int): bool; cdecl;

  /// <summary>
  ///  Get the current output size in pixels of a rendering context.
  /// </summary>
  TSDL_GetCurrentRenderOutputSize
                              = function (Arenderer: PSDL_Renderer; var Aw: int; var Ah: int): bool; cdecl;

  /// <summary>
  ///  Create a texture for a rendering context.
  /// </summary>
  TSDL_CreateTexture          = function (Arenderer: PSDL_Renderer; Aformat: TSDL_PixelFormat; Aaccess: TSDL_TextureAccess; Aw: int; Ah: int): PSDL_Texture; cdecl;

  /// <summary>
  ///  Create a texture from an existing surface.
  /// </summary>
  TSDL_CreateTextureFromSurface
                              = function (Arenderer: PSDL_Renderer; Asurface: PSDL_Surface): PSDL_Texture; cdecl;

  /// <summary>
  ///  Create a texture for a rendering context with the specified properties.
  /// </summary>
  TSDL_CreateTextureWithProperties
                              = function (Arenderer: PSDL_Renderer; Aprops: TSDL_PropertiesID): PSDL_Texture; cdecl;

const
  SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER           = 'SDL.texture.create.colorspace';
  SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER               = 'SDL.texture.create.format';
  SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER               = 'SDL.texture.create.access';
  SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER                = 'SDL.texture.create.width';
  SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER               = 'SDL.texture.create.height';
  SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT       = 'SDL.texture.create.SDR_white_point';
  SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT          = 'SDL.texture.create.HDR_headroom';
  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER       = 'SDL.texture.create.d3d11.texture';
  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER     = 'SDL.texture.create.d3d11.texture_u';
  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER     = 'SDL.texture.create.d3d11.texture_v';
  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER       = 'SDL.texture.create.d3d12.texture';
  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER     = 'SDL.texture.create.d3d12.texture_u';
  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER     = 'SDL.texture.create.d3d12.texture_v';
  SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER   = 'SDL.texture.create.metal.pixelbuffer';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER       = 'SDL.texture.create.opengl.texture';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER    = 'SDL.texture.create.opengl.texture_uv';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER     = 'SDL.texture.create.opengl.texture_u';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER     = 'SDL.texture.create.opengl.texture_v';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER    = 'SDL.texture.create.opengles2.texture';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER = 'SDL.texture.create.opengles2.texture_uv';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER  = 'SDL.texture.create.opengles2.texture_u';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER  = 'SDL.texture.create.opengles2.texture_v';
  SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER       = 'SDL.texture.create.vulkan.texture';

type
  /// <summary>
  ///  Get the properties associated with a texture.
  /// </summary>
  TSDL_GetTextureProperties   = function (Atexture: PSDL_Texture): TSDL_PropertiesID; cdecl;

const
  SDL_PROP_TEXTURE_COLORSPACE_NUMBER                 = 'SDL.texture.colorspace';
  SDL_PROP_TEXTURE_FORMAT_NUMBER                     = 'SDL.texture.format';
  SDL_PROP_TEXTURE_ACCESS_NUMBER                     = 'SDL.texture.access';
  SDL_PROP_TEXTURE_WIDTH_NUMBER                      = 'SDL.texture.width';
  SDL_PROP_TEXTURE_HEIGHT_NUMBER                     = 'SDL.texture.height';
  SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT             = 'SDL.texture.SDR_white_point';
  SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT                = 'SDL.texture.HDR_headroom';
  SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER             = 'SDL.texture.d3d11.texture';
  SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER           = 'SDL.texture.d3d11.texture_u';
  SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER           = 'SDL.texture.d3d11.texture_v';
  SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER             = 'SDL.texture.d3d12.texture';
  SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER           = 'SDL.texture.d3d12.texture_u';
  SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER           = 'SDL.texture.d3d12.texture_v';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER             = 'SDL.texture.opengl.texture';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER          = 'SDL.texture.opengl.texture_uv';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER           = 'SDL.texture.opengl.texture_u';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER           = 'SDL.texture.opengl.texture_v';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER      = 'SDL.texture.opengl.target';
  SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT                = 'SDL.texture.opengl.tex_w';
  SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT                = 'SDL.texture.opengl.tex_h';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER          = 'SDL.texture.opengles2.texture';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER       = 'SDL.texture.opengles2.texture_uv';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER        = 'SDL.texture.opengles2.texture_u';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER        = 'SDL.texture.opengles2.texture_v';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER   = 'SDL.texture.opengles2.target';
  SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER             = 'SDL.texture.vulkan.texture';

type
  /// <summary>
  ///  Get the renderer that created an SDL_Texture.
  /// </summary>
  TSDL_GetRendererFromTexture = function (Atexture: PSDL_Texture): PSDL_Renderer; cdecl;

  /// <summary>
  ///  Get the size of a texture, as floating point values.
  /// </summary>
  TSDL_GetTextureSize         = function (Atexture: PSDL_Texture; var Aw: float; var Ah: float): bool; cdecl;

  /// <summary>
  ///  Set an additional color value multiplied into render copy operations.
  /// </summary>
  TSDL_SetTextureColorMod     = function (Atexture: PSDL_Texture; Ar: Uint8; Ag: Uint8; Ab: Uint8): bool; cdecl;

  /// <summary>
  ///  Set an additional color value multiplied into render copy operations.
  /// </summary>
  TSDL_SetTextureColorModFloat= function (Atexture: PSDL_Texture; Ar: float; Ag: float; Ab: float): bool; cdecl;

  /// <summary>
  ///  Get the additional color value multiplied into render copy operations.
  /// </summary>
  TSDL_GetTextureColorMod     = function (Atexture: PSDL_Texture; var Ar: Uint8; var Ag: Uint8; var Ab: Uint8): bool; cdecl;

  /// <summary>
  ///  Get the additional color value multiplied into render copy operations.
  /// </summary>
  TSDL_GetTextureColorModFloat= function (Atexture: PSDL_Texture; var Ar: float; var Ag: float; var Ab: float): bool; cdecl;

  /// <summary>
  ///  Set an additional alpha value multiplied into render copy operations.
  /// </summary>
  TSDL_SetTextureAlphaMod     = function (Atexture: PSDL_Texture; Aalpha: Uint8): bool; cdecl;

  /// <summary>
  ///  Set an additional alpha value multiplied into render copy operations.
  /// </summary>
  TSDL_SetTextureAlphaModFloat= function (Atexture: PSDL_Texture; Aalpha: float): bool; cdecl;

  /// <summary>
  ///  Get the additional alpha value multiplied into render copy operations.
  /// </summary>
  TSDL_GetTextureAlphaMod     = function (Atexture: PSDL_Texture; var Aalpha: Uint8): bool; cdecl;

  /// <summary>
  ///  Get the additional alpha value multiplied into render copy operations.
  /// </summary>
  TSDL_GetTextureAlphaModFloat= function (Atexture: PSDL_Texture; var Aalpha: float): bool; cdecl;

  /// <summary>
  ///  Set the blend mode for a texture, used by SDL_RenderTexture().
  /// </summary>
  TSDL_SetTextureBlendMode    = function (Atexture: PSDL_Texture; AblendMode: TSDL_BlendMode): bool; cdecl;

  /// <summary>
  ///  Get the blend mode used for texture copy operations.
  /// </summary>
  TSDL_GetTextureBlendMode    = function (Atexture: PSDL_Texture; var AblendMode:  TSDL_BlendMode): bool; cdecl;

  /// <summary>
  ///  Set the scale mode used for texture scale operations.
  /// </summary>
  TSDL_SetTextureScaleMode    = function (Atexture: PSDL_Texture; AscaleMode: TSDL_ScaleMode): bool; cdecl;

  /// <summary>
  ///  Get the scale mode used for texture scale operations.
  /// </summary>
  TSDL_GetTextureScaleMode    = function (Atexture: PSDL_Texture; var AscaleMode: TSDL_ScaleMode): bool; cdecl;

  /// <summary>
  ///  Update the given texture rectangle with new pixel data.
  /// </summary>
  TSDL_UpdateTexture          = function (Atexture: PSDL_Texture; const Arect: PSDL_Rect; const Apixels: Pointer; Apitch: int): bool; cdecl;

  /// <summary>
  ///  Update a rectangle within a planar YV12 or IYUV texture with new pixel
  ///  data.
  /// </summary>
  TSDL_UpdateYUVTexture       = function (Atexture: PSDL_Texture; const Arect: PSDL_Rect; const AYplane: PUint8; AYpitch: int; const AUplane: PUint8; AUpitch: int; const AVplane: PUint8; AVpitch: int): bool; cdecl;

  /// <summary>
  ///  Update a rectangle within a planar NV12 or NV21 texture with new pixels.
  /// </summary>
  TSDL_UpdateNVTexture        = function (Atexture: PSDL_Texture; const Arect: PSDL_Rect; const AYplane: PUint8; AYpitch: int; const AUVplane: PUint8; AUVpitch: int): bool; cdecl;

  /// <summary>
  ///  Lock a portion of the texture for **write-only** pixel access.
  /// </summary>
  TSDL_LockTexture            = function (Atexture: PSDL_Texture; const Arect: PSDL_Rect; Apixels: PPointer; Apitch: Pint): bool; cdecl;

  /// <summary>
  ///  Lock a portion of the texture for **write-only** pixel access, and expose
  ///  it as a SDL surface.
  /// </summary>
  TSDL_LockTextureToSurface   = function (Atexture: PSDL_Texture; const Arect: PSDL_Rect; Asurface: PPSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Unlock a texture, uploading the changes to video memory, if needed.
  /// </summary>
  TSDL_UnlockTexture          = procedure(Atexture: PSDL_Texture); cdecl;

  /// <summary>
  ///  Set a texture as the current rendering target.
  /// </summary>
  TSDL_SetRenderTarget        = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture): bool; cdecl;

  /// <summary>
  ///  Get the current render target.
  /// </summary>
  TSDL_GetRenderTarget        = function (Arenderer: PSDL_Renderer): PSDL_Texture; cdecl;

  /// <summary>
  ///  Set a device independent resolution and presentation mode for rendering.
  /// </summary>
  TSDL_SetRenderLogicalPresentation
                              = function (Arenderer: PSDL_Renderer; Aw: int; Ah: int; Amode: TSDL_RendererLogicalPresentation): bool; cdecl;

  /// <summary>
  ///  Get device independent resolution and presentation mode for rendering.
  /// </summary>
  TSDL_GetRenderLogicalPresentation
                              = function (Arenderer: PSDL_Renderer; var Aw: int; var Ah: int; var Amode: TSDL_RendererLogicalPresentation): bool; cdecl;

  /// <summary>
  ///  Get the final presentation rectangle for rendering.
  /// </summary>
  TSDL_GetRenderLogicalPresentationRect
                              = function (Arenderer: PSDL_Renderer; var Arect: TSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Get a point in render coordinates when given a point in window coordinates.
  /// </summary>
  TSDL_RenderCoordinatesFromWindow
                              = function (Arenderer: PSDL_Renderer; Awindow_x: float; Awindow_y: float; var Ax: float; var Ay: float): bool; cdecl;

  /// <summary>
  ///  Get a point in window coordinates when given a point in render coordinates.
  /// </summary>
  TSDL_RenderCoordinatesToWindow
                              = function (Arenderer: PSDL_Renderer; Ax: float; Ay: float; var Awindow_x: float; var Awindow_y: float): bool; cdecl;

  /// <summary>
  ///  Convert the coordinates in an event to render coordinates.
  /// </summary>
  TSDL_ConvertEventToRenderCoordinates
                              = function (Arenderer: PSDL_Renderer; Aevent: PSDL_Event): bool; cdecl;

  /// <summary>
  ///  Set the drawing area for rendering on the current target.
  /// </summary>
  TSDL_SetRenderViewport      = function (Arenderer: PSDL_Renderer; const Arect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Get the drawing area for the current target.
  /// </summary>
  TSDL_GetRenderViewport      = function (Arenderer: PSDL_Renderer; var Arect: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Return whether an explicit rectangle was set as the viewport.
  /// </summary>
  TSDL_RenderViewportSet      = function (Arenderer: PSDL_Renderer): bool; cdecl;

  /// <summary>
  ///  Get the safe area for rendering within the current viewport.
  /// </summary>
  TSDL_GetRenderSafeArea      = function (Arenderer: PSDL_Renderer; var Arect: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Set the clip rectangle for rendering on the specified target.
  /// </summary>
  TSDL_SetRenderClipRect      = function (Arenderer: PSDL_Renderer; const Arect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Get the clip rectangle for the current target.
  /// </summary>
  TSDL_GetRenderClipRect      = function (Arenderer: PSDL_Renderer; var Arect: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Get whether clipping is enabled on the given renderer.
  /// </summary>
  TSDL_RenderClipEnabled      = function (Arenderer: PSDL_Renderer): bool; cdecl;

  /// <summary>
  ///  Set the drawing scale for rendering on the current target.
  /// </summary>
  TSDL_SetRenderScale         = function (Arenderer: PSDL_Renderer; AscaleX: float; AscaleY: float): bool; cdecl;

  /// <summary>
  ///  Get the drawing scale for the current target.
  /// </summary>
  TSDL_GetRenderScale         = function (Arenderer: PSDL_Renderer; var AscaleX: float; var AscaleY: float): bool; cdecl;

  /// <summary>
  ///  Set the color used for drawing operations.
  /// </summary>
  TSDL_SetRenderDrawColor     = function (Arenderer: PSDL_Renderer; Ar: Uint8; Ag: Uint8; Ab: Uint8; Aa: Uint8): bool; cdecl;

  /// <summary>
  ///  Set the color used for drawing operations (Rect, Line and Clear).
  /// </summary>
  TSDL_SetRenderDrawColorFloat= function (Arenderer: PSDL_Renderer; Ar: float; Ag: float; Ab: float; Aa: float): bool; cdecl;

  /// <summary>
  ///  Get the color used for drawing operations (Rect, Line and Clear).
  /// </summary>
  TSDL_GetRenderDrawColor     = function (Arenderer: PSDL_Renderer; var Ar: Uint8; var Ag: Uint8; var Ab: Uint8; var Aa: Uint8): bool; cdecl;

  /// <summary>
  ///  Get the color used for drawing operations (Rect, Line and Clear).
  /// </summary>
  TSDL_GetRenderDrawColorFloat= function (Arenderer: PSDL_Renderer; var Ar: float; var Ag: float; var Ab: float; var Aa: float): bool; cdecl;

  /// <summary>
  ///  Set the color scale used for render operations.
  /// </summary>
  TSDL_SetRenderColorScale    = function (Arenderer: PSDL_Renderer; Ascale: float): bool; cdecl;

  /// <summary>
  ///  Get the color scale used for render operations.
  /// </summary>
  TSDL_GetRenderColorScale    = function (Arenderer: PSDL_Renderer; var Ascale: float): bool; cdecl;

  /// <summary>
  ///  Set the blend mode used for drawing operations (Fill and Line).
  /// </summary>
  TSDL_SetRenderDrawBlendMode = function (Arenderer: PSDL_Renderer; AblendMode: TSDL_BlendMode): bool; cdecl;

  /// <summary>
  ///  Get the blend mode used for drawing operations (Fill and Line).
  /// </summary>
  TSDL_GetRenderDrawBlendMode = function (Arenderer: PSDL_Renderer; var AblendMode: TSDL_BlendMode): bool; cdecl;

  /// <summary>
  ///  Clear the current rendering target with the drawing color.
  /// </summary>
  TSDL_RenderClear            = function (Arenderer: PSDL_Renderer): bool; cdecl;

  /// <summary>
  ///  Draw a point on the current rendering target at subpixel precision.
  /// </summary>
  TSDL_RenderPoint            = function (Arenderer: PSDL_Renderer; Ax: float; Ay: float): bool; cdecl;

  /// <summary>
  ///  Draw multiple points on the current rendering target at subpixel precision.
  /// </summary>
  TSDL_RenderPoints           = function (Arenderer: PSDL_Renderer; const Apoints: PSDL_FPoint; Acount: int): bool; cdecl;

  /// <summary>
  ///  Draw a line on the current rendering target at subpixel precision.
  /// </summary>
  TSDL_RenderLine             = function (Arenderer: PSDL_Renderer; Ax1: float; Ay1: float; Ax2: float; Ay2: float): bool; cdecl;

  /// <summary>
  ///  Draw a series of connected lines on the current rendering target at
  ///  subpixel precision.
  /// </summary>
  TSDL_RenderLines            = function (Arenderer: PSDL_Renderer; const Apoints: PSDL_FPoint; Acount: int): bool; cdecl;

  /// <summary>
  ///  Draw a rectangle on the current rendering target at subpixel precision.
  /// </summary>
  TSDL_RenderRect             = function (Arenderer: PSDL_Renderer; const Arect: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Draw some number of rectangles on the current rendering target at subpixel
  ///  precision.
  /// </summary>
  TSDL_RenderRects            = function (Arenderer: PSDL_Renderer; const Arects: PSDL_FRect; Acount: int): bool; cdecl;

  /// <summary>
  ///  Fill a rectangle on the current rendering target with the drawing color at
  ///  subpixel precision.
  /// </summary>
  TSDL_RenderFillRect         = function (Arenderer: PSDL_Renderer; const Arect: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Fill some number of rectangles on the current rendering target with the
  ///  drawing color at subpixel precision.
  /// </summary>
  TSDL_RenderFillRects        = function (Arenderer: PSDL_Renderer; const Arect: PSDL_FRect; Acount: int): bool; cdecl;

  /// <summary>
  ///  Copy a portion of the texture to the current rendering target at subpixel
  ///  precision.
  /// </summary>
  TSDL_RenderTexture          = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Asrcret: PSDL_FRect; const Adstrect: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Copy a portion of the source texture to the current rendering target, with
  ///  rotation and flipping, at subpixel precision.
  /// </summary>
  TSDL_RenderTextureRotated   = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Asrcrect: PSDL_FRect; const Adstrect: PSDL_FRect; Aangle: double; const Acenter: PSDL_FPoint; Aflip: TSDL_FlipMode): bool; cdecl;

  /// <summary>
  ///  Copy a portion of the source texture to the current rendering target, with
  ///  affine transform, at subpixel precision.
  /// </summary>
  TSDL_RenderTextureAffine    = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Asrcrect: PSDL_FRect; const Aorigin: PSDL_FPoint; const Aright: PSDL_FPoint; const Adown: PSDL_FPoint): bool; cdecl;

  /// <summary>
  ///  Tile a portion of the texture to the current rendering target at subpixel
  ///  precision.
  /// </summary>
  TSDL_RenderTextureTiled     = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Asrcrect: PSDL_FRect; Ascale: float; const Adstrect: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Perform a scaled copy using the 9-grid algorithm to the current rendering
  ///  target at subpixel precision.
  /// </summary>
  TSDL_RenderTexture9Grid     = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Asrcrect: PSDL_FRect; Aleft_width: float; Aright_width: float; Atop_height: float; bottom_height: float; Ascale: float; const Adstrect: PSDL_FRect): bool; cdecl;

  /// <summary>
  ///  Render a list of triangles, optionally using a texture and indices into the
  ///  vertex array Color and alpha modulation is done per vertex
  ///  (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  /// </summary>
  TSDL_RenderGeometry         = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Avertices: PSDL_Vertex; Anum_vertices: int; const Aindices: Pint; Anum_indices: int): bool; cdecl;

  /// <summary>
  ///  Render a list of triangles, optionally using a texture and indices into the
  ///  vertex arrays Color and alpha modulation is done per vertex
  ///  (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  /// </summary>
  TSDL_RenderGeometryRaw      = function (Arenderer: PSDL_Renderer; Atexture: PSDL_Texture; const Axy: Pfloat; Axy_stride: int; const Acolor: PSDL_FColor; Acolor_stride: int; const Auv: Pfloat; Auv_stride: int; Anum_vertices: int; const Aindices: Pointer; Anum_indices: int; Asize_indices: int): bool; cdecl;

  /// <summary>
  ///  Read pixels from the current rendering target.
  /// </summary>
  TSDL_RenderReadPixels       = function (Arenderer: PSDL_Renderer; const Arect: PSDL_Rect): PSDL_Surface; cdecl;

  /// <summary>
  ///  Update the screen with any rendering performed since the previous call.
  /// </summary>
  TSDL_RenderPresent          = function (Arenderer: PSDL_Renderer): bool; cdecl;

  /// <summary>
  ///  Destroy the specified texture.
  /// </summary>
  TSDL_DestroyTexture         = procedure (Atexture: PSDL_Texture); cdecl;

  /// <summary>
  ///  Destroy the rendering context for a window and free all associated
  ///  textures.
  /// </summary>
  TSDL_DestroyRenderer        = procedure (Arenderer: PSDL_Renderer); cdecl;

  /// <summary>
  ///  Force the rendering context to flush any pending commands and state.
  /// </summary>
  TSDL_FlushRenderer          = function (Arenderer: PSDL_Renderer): bool; cdecl;

  /// <summary>
  ///  Get the CAMetalLayer associated with the given Metal renderer.
  /// </summary>
  TSDL_GetRenderMetalLayer    = function (Arenderer: PSDL_Renderer): Pointer; cdecl;

  /// <summary>
  ///  Get the Metal command encoder for the current frame.
  /// </summary>
  TSDL_GetRenderMetalCommandEncoder
                              = function (Arenderer: PSDL_Renderer): Pointer; cdecl;

  /// <summary>
  ///  Add a set of synchronization semaphores for the current frame.
  /// </summary>
  TSDL_AddVulkanRenderSemaphores
                              = function (Arenderer: PSDL_Renderer; Await_stage_mask: Uint32; Await_semaphore: Sint64; Asignal_semaphore: Sint64): bool; cdecl;

  /// <summary>
  ///  Toggle VSync of the given renderer.
  /// </summary>
  TSDL_SetRenderVSync         = function (Arenderer: PSDL_Renderer; Avsync: int): bool; cdecl;

  /// <summary>
  ///  Get VSync of the given renderer.
  /// </summary>
  TSDL_GetRenderVSync         = function (Arenderer: PSDL_Renderer; var Avsync: int): bool; cdecl;

const
  SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE        = 8;

type
  /// <summary>
  ///  Draw debug text to an SDL_Renderer.
  /// </summary>
  TSDL_RenderDebugText        = function (Arenderer: PSDL_Renderer; Ax: float; Ay: float; const Astr: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Draw debug text to an SDL_Renderer.
  /// </summary>
  TSDL_RenderDebugTextFormat  = function (Arenderer: PSDL_Renderer; Ax: float; Ay: float; const Afmt: PAnsiChar; Aargs: array of const): bool; cdecl;

var
  SDL_GetNumRenderDrivers     : TSDL_GetNumRenderDrivers;
  SDL_GetRenderDriver         : TSDL_GetRenderDriver;
  SDL_CreateWindowAndRenderer : TSDL_CreateWindowAndRenderer;
  SDL_CreateRenderer          : TSDL_CreateRenderer;
  SDL_CreateRendererWithProperties
                              : TSDL_CreateRendererWithProperties;
  SDL_CreateSoftwareRenderer  : TSDL_CreateSoftwareRenderer;
  SDL_GetRenderer             : TSDL_GetRenderer;
  SDL_GetRenderWindow         : TSDL_GetRenderWindow;
  SDL_GetRendererName         : TSDL_GetRendererName;
  SDL_GetRendererProperties   : TSDL_GetRendererProperties;
  SDL_GetRenderOutputSize     : TSDL_GetRenderOutputSize;
  SDL_GetCurrentRenderOutputSize
                              : TSDL_GetCurrentRenderOutputSize;
  SDL_CreateTexture           : TSDL_CreateTexture;
  SDL_CreateTextureFromSurface
                              : TSDL_CreateTextureFromSurface;
  SDL_CreateTextureWithProperties
                              : TSDL_CreateTextureWithProperties;
  SDL_GetTextureProperties    : TSDL_GetTextureProperties;
  SDL_GetRendererFromTexture  : TSDL_GetRendererFromTexture;
  SDL_GetTextureSize          : TSDL_GetTextureSize;
  SDL_SetTextureColorMod      : TSDL_SetTextureColorMod;
  SDL_SetTextureColorModFloat : TSDL_SetTextureColorModFloat;
  SDL_GetTextureColorMod      : TSDL_GetTextureColorMod;
  SDL_GetTextureColorModFloat : TSDL_GetTextureColorModFloat;
  SDL_SetTextureAlphaMod      : TSDL_SetTextureAlphaMod;
  SDL_SetTextureAlphaModFloat : TSDL_SetTextureAlphaModFloat;
  SDL_GetTextureAlphaMod      : TSDL_GetTextureAlphaMod;
  SDL_GetTextureAlphaModFloat : TSDL_GetTextureAlphaModFloat;
  SDL_SetTextureBlendMode     : TSDL_SetTextureBlendMode;
  SDL_GetTextureBlendMode     : TSDL_GetTextureBlendMode;
  SDL_SetTextureScaleMode     : TSDL_SetTextureScaleMode;
  SDL_GetTextureScaleMode     : TSDL_GetTextureScaleMode;
  SDL_UpdateTexture           : TSDL_UpdateTexture;
  SDL_UpdateYUVTexture        : TSDL_UpdateYUVTexture;
  SDL_UpdateNVTexture         : TSDL_UpdateNVTexture;
  SDL_LockTexture             : TSDL_LockTexture;
  SDL_LockTextureToSurface    : TSDL_LockTextureToSurface;
  SDL_UnlockTexture           : TSDL_UnlockTexture;
  SDL_SetRenderTarget         : TSDL_SetRenderTarget;
  SDL_GetRenderTarget         : TSDL_GetRenderTarget;
  SDL_SetRenderLogicalPresentation
                              : TSDL_SetRenderLogicalPresentation;
  SDL_GetRenderLogicalPresentation
                              : TSDL_GetRenderLogicalPresentation;
  SDL_GetRenderLogicalPresentationRect
                              : TSDL_GetRenderLogicalPresentationRect;
  SDL_RenderCoordinatesFromWindow
                              : TSDL_RenderCoordinatesFromWindow;
  SDL_RenderCoordinatesToWindow
                              : TSDL_RenderCoordinatesToWindow;
  SDL_ConvertEventToRenderCoordinates
                              : TSDL_ConvertEventToRenderCoordinates;
  SDL_SetRenderViewport       : TSDL_SetRenderViewport;
  SDL_GetRenderViewport       : TSDL_GetRenderViewport;
  SDL_RenderViewportSet       : TSDL_RenderViewportSet;
  SDL_GetRenderSafeArea       : TSDL_GetRenderSafeArea;
  SDL_SetRenderClipRect       : TSDL_SetRenderClipRect;
  SDL_GetRenderClipRect       : TSDL_GetRenderClipRect;
  SDL_RenderClipEnabled       : TSDL_RenderClipEnabled;
  SDL_SetRenderScale          : TSDL_SetRenderScale;
  SDL_GetRenderScale          : TSDL_GetRenderScale;
  SDL_SetRenderDrawColor      : TSDL_SetRenderDrawColor;
  SDL_SetRenderDrawColorFloat : TSDL_SetRenderDrawColorFloat;
  SDL_GetRenderDrawColor      : TSDL_GetRenderDrawColor;
  SDL_GetRenderDrawColorFloat : TSDL_GetRenderDrawColorFloat;
  SDL_SetRenderColorScale     : TSDL_SetRenderColorScale;
  SDL_GetRenderColorScale     : TSDL_GetRenderColorScale;
  SDL_SetRenderDrawBlendMode  : TSDL_SetRenderDrawBlendMode;
  SDL_GetRenderDrawBlendMode  : TSDL_GetRenderDrawBlendMode;
  SDL_RenderClear             : TSDL_RenderClear;
  SDL_RenderPoint             : TSDL_RenderPoint;
  SDL_RenderPoints            : TSDL_RenderPoints;
  SDL_RenderLine              : TSDL_RenderLine;
  SDL_RenderLines             : TSDL_RenderLines;
  SDL_RenderRect              : TSDL_RenderRect;
  SDL_RenderRects             : TSDL_RenderRects;
  SDL_RenderFillRect          : TSDL_RenderFillRect;
  SDL_RenderFillRects         : TSDL_RenderFillRects;
  SDL_RenderTexture           : TSDL_RenderTexture;
  SDL_RenderTextureRotated    : TSDL_RenderTextureRotated;
  SDL_RenderTextureAffine     : TSDL_RenderTextureAffine;
  SDL_RenderTextureTiled      : TSDL_RenderTextureTiled;
  SDL_RenderTexture9Grid      : TSDL_RenderTexture9Grid;
  SDL_RenderGeometry          : TSDL_RenderGeometry;
  SDL_RenderGeometryRaw       : TSDL_RenderGeometryRaw;
  SDL_RenderReadPixels        : TSDL_RenderReadPixels;
  SDL_RenderPresent           : TSDL_RenderPresent;
  SDL_DestroyTexture          : TSDL_DestroyTexture;
  SDL_DestroyRenderer         : TSDL_DestroyRenderer;
  SDL_FlushRenderer           : TSDL_FlushRenderer;
  SDL_GetRenderMetalLayer     : TSDL_GetRenderMetalLayer;
  SDL_GetRenderMetalCommandEncoder
                              : TSDL_GetRenderMetalCommandEncoder;
  SDL_AddVulkanRenderSemaphores
                              : TSDL_AddVulkanRenderSemaphores;
  SDL_SetRenderVSync          : TSDL_SetRenderVSync;
  SDL_RenderDebugText         : TSDL_RenderDebugText;
  SDL_RenderDebugTextFormat   : TSDL_RenderDebugTextFormat;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetNumRenderDrivers    := BindProcedure(AHandle, 'SDL_GetNumRenderDrivers');
  @SDL_GetRenderDriver        := BindProcedure(AHandle, 'SDL_GetRenderDriver');
  @SDL_CreateWindowAndRenderer:= BindProcedure(AHandle, 'SDL_CreateWindowAndRenderer');
  @SDL_CreateRenderer         := BindProcedure(AHandle, 'SDL_CreateRenderer');
  @SDL_CreateRendererWithProperties
                              := BindProcedure(AHandle, 'SDL_CreateRendererWithProperties');
  @SDL_CreateSoftwareRenderer := BindProcedure(AHandle, 'SDL_CreateSoftwareRenderer');
  @SDL_GetRenderer            := BindProcedure(AHandle, 'SDL_GetRenderer');
  @SDL_GetRenderWindow        := BindProcedure(AHandle, 'SDL_GetRenderWindow');
  @SDL_GetRendererName        := BindProcedure(AHandle, 'SDL_GetRendererName');
  @SDL_GetRendererProperties  := BindProcedure(AHandle, 'SDL_GetRendererProperties');
  @SDL_GetRenderOutputSize    := BindProcedure(AHandle, 'SDL_GetRenderOutputSize');
  @SDL_GetCurrentRenderOutputSize
                              := BindProcedure(AHandle, 'SDL_GetCurrentRenderOutputSize');
  @SDL_CreateTexture          := BindProcedure(AHandle, 'SDL_CreateTexture');
  @SDL_CreateTextureFromSurface
                              := BindProcedure(AHandle, 'SDL_CreateTextureFromSurface');
  @SDL_CreateTextureWithProperties
                              := BindProcedure(AHandle, 'SDL_CreateTextureWithProperties');
  @SDL_GetTextureProperties   := BindProcedure(AHandle, 'SDL_GetTextureProperties');
  @SDL_GetRendererFromTexture := BindProcedure(AHandle, 'SDL_GetRendererFromTexture');
  @SDL_GetTextureSize         := BindProcedure(AHandle, 'SDL_GetTextureSize');
  @SDL_SetTextureColorMod     := BindProcedure(AHandle, 'SDL_SetTextureColorMod');
  @SDL_SetTextureColorModFloat:= BindProcedure(AHandle, 'SDL_SetTextureColorModFloat');
  @SDL_GetTextureColorMod     := BindProcedure(AHandle, 'SDL_GetTextureColorMod');
  @SDL_GetTextureColorModFloat:= BindProcedure(AHandle, 'SDL_GetTextureColorModFloat');
  @SDL_SetTextureAlphaMod     := BindProcedure(AHandle, 'SDL_SetTextureAlphaMod');
  @SDL_SetTextureAlphaModFloat:= BindProcedure(AHandle, 'SDL_SetTextureAlphaModFloat');
  @SDL_GetTextureAlphaMod     := BindProcedure(AHandle, 'SDL_GetTextureAlphaMod');
  @SDL_GetTextureAlphaModFloat:= BindProcedure(AHandle, 'SDL_GetTextureAlphaModFloat');
  @SDL_SetTextureBlendMode    := BindProcedure(AHandle, 'SDL_SetTextureBlendMode');
  @SDL_GetTextureBlendMode    := BindProcedure(AHandle, 'SDL_GetTextureBlendMode');
  @SDL_SetTextureScaleMode    := BindProcedure(AHandle, 'SDL_SetTextureScaleMode');
  @SDL_GetTextureScaleMode    := BindProcedure(AHandle, 'SDL_GetTextureScaleMode');
  @SDL_UpdateTexture          := BindProcedure(AHandle, 'SDL_UpdateTexture');
  @SDL_UpdateYUVTexture       := BindProcedure(AHandle, 'SDL_UpdateYUVTexture');
  @SDL_UpdateNVTexture        := BindProcedure(AHandle, 'SDL_UpdateNVTexture');
  @SDL_LockTexture            := BindProcedure(AHandle, 'SDL_LockTexture');
  @SDL_LockTextureToSurface   := BindProcedure(AHandle, 'SDL_LockTextureToSurface');
  @SDL_UnlockTexture          := BindProcedure(AHandle, 'SDL_UnlockTexture');
  @SDL_SetRenderTarget        := BindProcedure(AHandle, 'SDL_SetRenderTarget');
  @SDL_GetRenderTarget        := BindProcedure(AHandle, 'SDL_GetRenderTarget');
  @SDL_SetRenderLogicalPresentation
                              := BindProcedure(AHandle, 'SDL_SetRenderLogicalPresentation');
  @SDL_GetRenderLogicalPresentation
                              := BindProcedure(AHandle, 'SDL_GetRenderLogicalPresentation');
  @SDL_GetRenderLogicalPresentationRect
                              := BindProcedure(AHandle, 'SDL_GetRenderLogicalPresentationRect');
  @SDL_RenderCoordinatesFromWindow
                              := BindProcedure(AHandle, 'SDL_RenderCoordinatesFromWindow');
  @SDL_RenderCoordinatesToWindow
                              := BindProcedure(AHandle, 'SDL_RenderCoordinatesToWindow');
  @SDL_ConvertEventToRenderCoordinates
                              := BindProcedure(AHandle, 'SDL_ConvertEventToRenderCoordinates');
  @SDL_SetRenderViewport      := BindProcedure(AHandle, 'SDL_SetRenderViewport');
  @SDL_GetRenderViewport      := BindProcedure(AHandle, 'SDL_GetRenderViewport');
  @SDL_RenderViewportSet      := BindProcedure(AHandle, 'SDL_RenderViewportSet');
  @SDL_GetRenderSafeArea      := BindProcedure(AHandle, 'SDL_GetRenderSafeArea');
  @SDL_SetRenderClipRect      := BindProcedure(AHandle, 'SDL_SetRenderClipRect');
  @SDL_GetRenderClipRect      := BindProcedure(AHandle, 'SDL_GetRenderClipRect');
  @SDL_RenderClipEnabled      := BindProcedure(AHandle, 'SDL_RenderClipEnabled');
  @SDL_SetRenderScale         := BindProcedure(AHandle, 'SDL_SetRenderScale');
  @SDL_GetRenderScale         := BindProcedure(AHandle, 'SDL_GetRenderScale');
  @SDL_SetRenderDrawColor     := BindProcedure(AHandle, 'SDL_SetRenderDrawColor');
  @SDL_SetRenderDrawColorFloat:= BindProcedure(AHandle, 'SDL_SetRenderDrawColorFloat');
  @SDL_GetRenderDrawColor     := BindProcedure(AHandle, 'SDL_GetRenderDrawColor');
  @SDL_GetRenderDrawColorFloat:= BindProcedure(AHandle, 'SDL_GetRenderDrawColorFloat');
  @SDL_SetRenderColorScale    := BindProcedure(AHandle, 'SDL_SetRenderColorScale');
  @SDL_GetRenderColorScale    := BindProcedure(AHandle, 'SDL_GetRenderColorScale');
  @SDL_SetRenderDrawBlendMode := BindProcedure(AHandle, 'SDL_SetRenderDrawBlendMode');
  @SDL_GetRenderDrawBlendMode := BindProcedure(AHandle, 'SDL_GetRenderDrawBlendMode');
  @SDL_RenderClear            := BindProcedure(AHandle, 'SDL_RenderClear');
  @SDL_RenderPoint            := BindProcedure(AHandle, 'SDL_RenderPoint');
  @SDL_RenderPoints           := BindProcedure(AHandle, 'SDL_RenderPoints');
  @SDL_RenderLine             := BindProcedure(AHandle, 'SDL_RenderLine');
  @SDL_RenderLines            := BindProcedure(AHandle, 'SDL_RenderLines');
  @SDL_RenderRect             := BindProcedure(AHandle, 'SDL_RenderRect');
  @SDL_RenderRects            := BindProcedure(AHandle, 'SDL_RenderRects');
  @SDL_RenderFillRect         := BindProcedure(AHandle, 'SDL_RenderFillRect');
  @SDL_RenderFillRects        := BindProcedure(AHandle, 'SDL_RenderFillRects');
  @SDL_RenderTexture          := BindProcedure(AHandle, 'SDL_RenderTexture');
  @SDL_RenderTextureRotated   := BindProcedure(AHandle, 'SDL_RenderTextureRotated');
  @SDL_RenderTextureAffine    := BindProcedure(AHandle, 'SDL_RenderTextureAffine');
  @SDL_RenderTextureTiled     := BindProcedure(AHandle, 'SDL_RenderTextureTiled');
  @SDL_RenderTexture9Grid     := BindProcedure(AHandle, 'SDL_RenderTexture9Grid');
  @SDL_RenderGeometry         := BindProcedure(AHandle, 'SDL_RenderGeometry');
  @SDL_RenderGeometryRaw      := BindProcedure(AHandle, 'SDL_RenderGeometryRaw');
  @SDL_RenderReadPixels       := BindProcedure(AHandle, 'SDL_RenderReadPixels');
  @SDL_RenderPresent          := BindProcedure(AHandle, 'SDL_RenderPresent');
  @SDL_DestroyTexture         := BindProcedure(AHandle, 'SDL_DestroyTexture');
  @SDL_DestroyRenderer        := BindProcedure(AHandle, 'SDL_DestroyRenderer');
  @SDL_FlushRenderer          := BindProcedure(AHandle, 'SDL_FlushRenderer');
  @SDL_GetRenderMetalLayer    := BindProcedure(AHandle, 'SDL_GetRenderMetalLayer');
  @SDL_GetRenderMetalCommandEncoder
                              := BindProcedure(AHandle, 'SDL_GetRenderMetalCommandEncoder');
  @SDL_AddVulkanRenderSemaphores
                              := BindProcedure(AHandle, 'SDL_AddVulkanRenderSemaphores');
  @SDL_SetRenderVSync         := BindProcedure(AHandle, 'SDL_SetRenderVSync');
  @SDL_RenderDebugText        := BindProcedure(AHandle, 'SDL_RenderDebugText');
  @SDL_RenderDebugTextFormat  := BindProcedure(AHandle, 'SDL_RenderDebugTextFormat');
end;

end.
