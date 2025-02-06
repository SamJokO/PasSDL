unit SDL_video;

interface

uses
  SDL.Types,
  SDL_properties,
  SDL_pixels;

type
  TSDL_DisplayID              = Uint32;
  PSDL_DisplayID              = ^TSDL_DisplayID;

  TSDL_WindowID               = Uint32;
  PSDL_WindowID               = ^TSDL_WindowID;

const
  SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER
                              = 'SDL.video.wayland.wl_display';

type
  TSDL_SystemTheme            = (
                                  SDL_SYSTEM_THEME_UNKNOWN,
                                  SDL_SYSTEM_THEME_LIGHT,
                                  SDL_SYSTEM_THEME_DARK
                                );
  PSDL_SystemTheme            = ^TSDL_SystemTheme;

  TSDL_DisplayModeData = record end;
  PSDL_DisplayModeData = ^TSDL_DisplayModeData;

  TSDL_DisplayMode = record
    displayID                   : TSDL_DisplayID;
    format                      : TSDL_PixelFormat;
    w                           : int;
    h                           : int;
    pixel_density               : float;
    refresh_rate                : float;
    refresh_rate_numerator      : int;
    refresh_rate_denominator    : int;

    internal                    : PSDL_DisplayModeData;
  end;
  PSDL_DisplayMode = ^TSDL_DisplayMode;

  TSDL_DisplayOrientation     = (
                                  SDL_ORIENTATION_UNKNOWN,
                                  SDL_ORIENTATION_LANDSCAPE,
                                  SDL_ORIENTATION_LANDSCAPE_FLIPPED,
                                  SDL_ORIENTATION_PORTRAIT,
                                  SDL_ORIENTATION_PORTRAIT_FLIPPED
                                );
  PSDL_DisplayOrientation = ^TSDL_DisplayOrientation;

  TSDL_Window = record end;
  PSDL_Window = ^TSDL_Window;

  TSDL_WindowFlags            = Uint64;
  PSDL_WindowFlags            = ^TSDL_WindowFlags;

const
  SDL_WINDOW_FULLSCREEN           = $0000000000000001;   // window is in fullscreen mode
  SDL_WINDOW_OPENGL               = $0000000000000002;   // window usable with OpenGL context
  SDL_WINDOW_OCCLUDED             = $0000000000000004;   // window is occluded
  SDL_WINDOW_HIDDEN               = $0000000000000008;   // window is neither mapped onto the desktop nor shown in the taskbar/dock/window list; SDL_ShowWindow() is required for it to become visible
  SDL_WINDOW_BORDERLESS           = $0000000000000010;   // no window decoration
  SDL_WINDOW_RESIZABLE            = $0000000000000020;   // window can be resized
  SDL_WINDOW_MINIMIZED            = $0000000000000040;   // window is minimized
  SDL_WINDOW_MAXIMIZED            = $0000000000000080;   // window is maximized
  SDL_WINDOW_MOUSE_GRABBED        = $0000000000000100;   // window has grabbed mouse input
  SDL_WINDOW_INPUT_FOCUS          = $0000000000000200;   // window has input focus
  SDL_WINDOW_MOUSE_FOCUS          = $0000000000000400;   // window has mouse focus
  SDL_WINDOW_EXTERNAL             = $0000000000000800;   // window not created by SDL
  SDL_WINDOW_MODAL                = $0000000000001000;   // window is modal
  SDL_WINDOW_HIGH_PIXEL_DENSITY   = $0000000000002000;   // window uses high pixel density back buffer if possible
  SDL_WINDOW_MOUSE_CAPTURE        = $0000000000004000;   // window has mouse captured (unrelated to MOUSE_GRABBED)
  SDL_WINDOW_MOUSE_RELATIVE_MODE  = $0000000000008000;   // window has relative mode enabled
  SDL_WINDOW_ALWAYS_ON_TOP        = $0000000000010000;   // window should always be above others
  SDL_WINDOW_UTILITY              = $0000000000020000;   // window should be treated as a utility window, not showing in the task bar and window list
  SDL_WINDOW_TOOLTIP              = $0000000000040000;   // window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window
  SDL_WINDOW_POPUP_MENU           = $0000000000080000;   // window should be treated as a popup menu, requires a parent window
  SDL_WINDOW_KEYBOARD_GRABBED     = $0000000000100000;   // window has grabbed keyboard input
  SDL_WINDOW_VULKAN               = $0000000010000000;   // window usable for Vulkan surface
  SDL_WINDOW_METAL                = $0000000020000000;   // window usable for Metal view
  SDL_WINDOW_TRANSPARENT          = $0000000040000000;   // window with transparent buffer
  SDL_WINDOW_NOT_FOCUSABLE        = $0000000080000000;   // window should not be focusable

  SDL_WINDOWPOS_UNDEFINED_MASK= $1FFF000;

  function SDL_WINDOWPOS_UNDEFINED_DISPLAY(AValue: TSDL_DisplayID): Uint32;
  function SDL_WINDOWPOS_UNDEFINED: Uint32;
  function SDL_WINDOWPOS_ISUNDEFINED(AValue: UInt32): bool;

const
  SDL_WINDOWPOS_CENTERED_MASK = $2FFF0000;

  function SDL_WINDOWPOS_CENTERED_DISPLAY(AValue: TSDL_DisplayID): Uint32;
  function SDL_WINDOWPOS_CENTERED: Uint32;
  function SDL_WINDOWPOS_ISCENTERED(AValue: Uint32): bool;

type
  TSDL_FlashOperation         = (
                                  SDL_FLASH_CANCEL,
                                  SDL_FLASH_BRIEFLY,
                                  SDL_FLASH_UNTIL_FOCUSED
                                );
  PSDL_FlashOperation         = ^TSDL_FlashOperation;

  TSDL_GLContextState = record end;
  PSDL_GLContext = ^TSDL_GLContextState;

  PSDL_EGLDisplay             = Pointer;
  PSDL_EGLConfig              = Pointer;
  PSDL_EGLSurface             = Pointer;
  TSDL_EGLAttrib              = intptr_t;
  TSDL_EGLint                 = int;

  TSDL_EGLAttribArrayCallback = function (AUserData: Pointer): TSDL_EGLAttrib;
  TSDL_EGLIntArrayCallback    = function (AUserData: Pointer; display: PSDL_EGLDisplay; config: PSDL_EGLConfig): TSDL_EGLint;

  TSDL_GLAttr                 = (
                                  SDL_GL_RED_SIZE,                    // the minimum number of bits for the red channel of the color buffer; defaults to 3.
                                  SDL_GL_GREEN_SIZE,                  // the minimum number of bits for the green channel of the color buffer; defaults to 3.
                                  SDL_GL_BLUE_SIZE,                   // the minimum number of bits for the blue channel of the color buffer; defaults to 2.
                                  SDL_GL_ALPHA_SIZE,                  // the minimum number of bits for the alpha channel of the color buffer; defaults to 0.
                                  SDL_GL_BUFFER_SIZE,                 // the minimum number of bits for frame buffer size; defaults to 0.
                                  SDL_GL_DOUBLEBUFFER,                // whether the output is single or double buffered; defaults to double buffering on.
                                  SDL_GL_DEPTH_SIZE,                  // the minimum number of bits in the depth buffer; defaults to 16.
                                  SDL_GL_STENCIL_SIZE,                // the minimum number of bits in the stencil buffer; defaults to 0.
                                  SDL_GL_ACCUM_RED_SIZE,              // the minimum number of bits for the red channel of the accumulation buffer; defaults to 0.
                                  SDL_GL_ACCUM_GREEN_SIZE,            // the minimum number of bits for the green channel of the accumulation buffer; defaults to 0.
                                  SDL_GL_ACCUM_BLUE_SIZE,             // the minimum number of bits for the blue channel of the accumulation buffer; defaults to 0.
                                  SDL_GL_ACCUM_ALPHA_SIZE,            // the minimum number of bits for the alpha channel of the accumulation buffer; defaults to 0.
                                  SDL_GL_STEREO,                      // whether the output is stereo 3D; defaults to off.
                                  SDL_GL_MULTISAMPLEBUFFERS,          // the number of buffers used for multisample anti-aliasing; defaults to 0.
                                  SDL_GL_MULTISAMPLESAMPLES,          // the number of samples used around the current pixel used for multisample anti-aliasing.
                                  SDL_GL_ACCELERATED_VISUAL,          // set to 1 to require hardware acceleration, set to 0 to force software rendering; defaults to allow either.
                                  SDL_GL_RETAINED_BACKING,            // not used (deprecated).
                                  SDL_GL_CONTEXT_MAJOR_VERSION,       // OpenGL context major version.
                                  SDL_GL_CONTEXT_MINOR_VERSION,       // OpenGL context minor version.
                                  SDL_GL_CONTEXT_FLAGS,               // some combination of 0 or more of elements of the SDL_GLContextFlag enumeration; defaults to 0.
                                  SDL_GL_CONTEXT_PROFILE_MASK,        // type of GL context (Core, Compatibility, ES). See SDL_GLProfile; default value depends on platform.
                                  SDL_GL_SHARE_WITH_CURRENT_CONTEXT,  // OpenGL context sharing; defaults to 0.
                                  SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,    // requests sRGB capable visual; defaults to 0.
                                  SDL_GL_CONTEXT_RELEASE_BEHAVIOR,    // sets context the release behavior. See SDL_GLContextReleaseFlag; defaults to FLUSH.
                                  SDL_GL_CONTEXT_RESET_NOTIFICATION,  // set context reset notification. See SDL_GLContextResetNotification; defaults to NO_NOTIFICATION.
                                  SDL_GL_CONTEXT_NO_ERROR,
                                  SDL_GL_FLOATBUFFERS,
                                  SDL_GL_EGL_PLATFORM
                                );
  PSDL_GLAttr                 = ^TSDL_GLAttr;

  TSDL_GLProfile              = Uint32;

const
  SDL_GL_CONTEXT_PROFILE_CORE           = $0001;
  SDL_GL_CONTEXT_PROFILE_COMPATIBILITY  = $0002;
  SDL_GL_CONTEXT_PROFILE_ES             = $0004;

type
  TSDL_GLContextFlag          = Uint32;

const
  SDL_GL_CONTEXT_DEBUG_FLAG             = $0001;
  SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG= $0002;
  SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG     = $0004;
  SDL_GL_CONTEXT_RESET_ISOLATION_FLAG   = $0008;

type
  TSDL_GLContextReleaseFlag   = Uint32;

const
  SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE  = $0000;
  SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = $0001;

type
  TSDL_GLContextResetNotification
                              = Uint32;

const
  SDL_GL_CONTEXT_RESET_NO_NOTIFICATION  = $0000;
  SDL_GL_CONTEXT_RESET_LOSE_CONTEXT     = $0001;

type
  /// <summary>
  ///  Get the number of video drivers compiled into SDL.
  /// </summary>
  TSDL_GetNumVideoDrivers     = function (): int; cdecl;

  /// <summary>
  ///  Get the number of video drivers compiled into SDL.
  /// </summary>
  TSDL_GetVideoDriver         = function (AIndex: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the name of the currently initialized video driver.
  /// </summary>
  TSDL_GetCurrentVideoDriver  = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the current system theme.
  /// </summary>
  TSDL_GetSystemTheme         = function (): TSDL_SystemTheme; cdecl;

  /// <summary>
  ///  Get a list of currently connected displays.
  /// </summary>
  TSDL_GetDisplays            = function (var ACount: int): PSDL_DisplayID; cdecl;

  /// <summary>
  ///  Return the primary display.
  /// </summary>
  TSDL_GetPrimaryDisplay      = function (): TSDL_DisplayID; cdecl;

  /// <summary>
  ///  Get the properties associated with a display.
  /// </summary>
  TSDL_GetDisplayProperties   = function (AdisplayID: TSDL_DisplayID): TSDL_PropertiesID; cdecl;

const
  SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN              = 'SDL.display.HDR_enabled';
  SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER  = 'SDL.display.KMSDRM.panel_orientation';

type
  /// <summary>
  ///  Get the name of a display in UTF-8 encoding.
  /// </summary>
  TSDL_GetDisplayName         = function (AdisplayID: TSDL_DisplayID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the desktop area represented by a display.
  /// </summary>
  TSDL_GetDisplayBounds       = function (AdisplayID: TSDL_DisplayID; ARect: PSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Get the usable desktop area represented by a display, in screen
  ///  coordinates.
  /// </summary>
  TSDL_GetDisplayUsableBounds = function (AdisplayID: TSDL_DisplayID; ARect: PSDL_Rect): bool; cdecl;



implementation

function SDL_WINDOWPOS_UNDEFINED_DISPLAY(AValue: TSDL_DisplayID): Uint32;
begin
  Result                      := SDL_WINDOWPOS_UNDEFINED_MASK or AValue;
end;

function SDL_WINDOWPOS_UNDEFINED: Uint32;
begin
  Result                      := SDL_WINDOWPOS_UNDEFINED_DISPLAY(0);
end;

function SDL_WINDOWPOS_ISUNDEFINED(AValue: UInt32): bool;
begin
  Result                      := (( AValue and $FFFF0000) = SDL_WINDOWPOS_UNDEFINED_MASK);
end;

function SDL_WINDOWPOS_CENTERED_DISPLAY(AValue: TSDL_DisplayID): Uint32;
begin
  Result                      := SDL_WINDOWPOS_CENTERED_MASK or AValue;
end;

function SDL_WINDOWPOS_CENTERED: Uint32;
begin
  Result                      := SDL_WINDOWPOS_CENTERED_DISPLAY(0);
end;

function SDL_WINDOWPOS_ISCENTERED(AValue: Uint32): bool;
begin
  Result                      := ((AValue and $FFFF0000) = SDL_WINDOWPOS_CENTERED_MASK);
end;

end.
