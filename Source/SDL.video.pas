unit SDL.video;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.surface,
  SDL.rect,
  SDL.properties,
  SDL.pixels;

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
  PPSDL_DisplayMode = ^PSDL_DisplayMode;

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
  PPSDL_Window = ^PSDL_Window;

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

  /// <summary>
  ///  Get the orientation of a display when it is unrotated.
  /// </summary>
  TSDL_GetNaturalDisplayOrientation     
                              = function (AdispladyID: TSDL_DisplayID): TSDL_DisplayOrientation; cdecl;
  /// <summary>
  ///  Get the orientation of a display.
  /// </summary>
  TSDL_GetCurrentDisplayOrientation
                              = function (AdispladyID: TSDL_DisplayID): TSDL_DisplayOrientation; cdecl;
  /// <summary>
  ///  Get the content scale of a display.
  /// </summary>
  TSDL_GetDisplayContentScale = function (AdispladyID: TSDL_DisplayID): float; cdecl;

  /// <summary>
  ///  Get a list of fullscreen display modes available on a display.
  /// </summary>
  TSDL_GetFullscreenDisplayModes
                              = function (AdispladyID: TSDL_DisplayID; var ACount: int): PPSDL_DisplayMode; cdecl;

  /// <summary>
  ///  Get the closest match to the requested display mode.
  /// </summary>
  TSDL_GetClosestFullscreenDisplayMode
                              = function (AdispladyID: TSDL_DisplayID; Aw: int; Ah: int; Arefresh_rate: float; Ainclude_high_density_kodes: bool; Aclosest: PSDL_DisplayMode): bool; cdecl;

  /// <summary>
  ///  Get information about the desktop's display mode.
  /// </summary>
  TSDL_GetDesktopDisplayMode  = function (AdispladyID: TSDL_DisplayID): PSDL_DisplayMode; cdecl;

  /// <summary>
  ///  Get information about the current display mode.
  /// </summary>
  TSDL_GetCurrentDisplayMode  = function (AdispladyID: TSDL_DisplayID): PSDL_DisplayMode; cdecl;

  /// <summary>
  ///  Get the display containing a point.
  /// </summary>
  TSDL_GetDisplayForPoint     = function (const Apoint: PSDL_Point): TSDL_DisplayID; cdecl;

  /// <summary>
  ///  Get the display primarily containing a rect.
  /// </summary>
  TSDL_GetDisplayForRect      = function (const Arect: PSDL_Rect): TSDL_DisplayID; cdecl;

  /// <summary>
  ///  Get the display associated with a window.
  /// </summary>
  TSDL_GetDisplayForWindow    = function (Awindow: PSDL_Window): TSDL_DisplayID; cdecl;

  /// <summary>
  ///  Get the pixel density of a window.
  /// </summary>
  TSDL_GetWindowPixelDensity  = function (Awindow: PSDL_Window): float; cdecl;

  /// <summary>
  ///  Get the content display scale relative to a window's pixel size.
  /// </summary>
  TSDL_GetWindowDisplayScale  = function (Awindow: PSDL_Window): float; cdecl;

  /// <summary>
  ///  Set the display mode to use when a window is visible and fullscreen.
  /// </summary>
  TSDL_SetWindowFullscreenMode= function (Awindow: PSDL_Window; const Amode: PSDL_DisplayMode): bool; cdecl;

  /// <summary>
  ///  Query the display mode to use when a window is visible at fullscreen.
  /// </summary>
  TSDL_GetWindowFullscreenMode= function (Awindow: PSDL_Window): PSDL_DisplayMode; cdecl;

  /// <summary>
  ///  Get the raw ICC profile data for the screen the window is currently on.
  /// </summary>
  TSDL_GetWindowICCProfile    = function (Awindow: PSDL_Window; Asize: Psize_t): Pointer; cdecl;

  /// <summary>
  ///  Get the pixel format associated with the window.
  /// </summary>
  TSDL_GetWindowPixelFormat   = function (Awindow: PSDL_Window): TSDL_PixelFormat; cdecl;

  /// <summary>
  ///  Get a list of valid windows.
  /// </summary>
  TSDL_GetWindows             = function (var Acount: int): PPSDL_Window; cdecl;

  /// <summary>
  ///  Create a window with the specified dimensions and flags.
  /// </summary>
  TSDL_CreateWindow           = function (const Atitle: PAnsiChar; Aw: int; Ah: int; Aflags: TSDL_WindowFlags): PSDL_Window; cdecl;

  /// <summary>
  ///  Create a child popup window of the specified parent window.
  /// </summary>
  TSDL_CreatePopupWindow      = function (Aparent: PSDL_Window; Aoffset_x: int; Aoffset_y: int; Aw: int; Ah: int; Aflags: TSDL_WindowFlags): PSDL_Window; cdecl;

  /// <summary>
  ///  Create a window with the specified properties.
  /// </summary>
  TSDL_CreateWindowWithProperties
                              = function (Aprops: TSDL_PropertiesID): PSDL_Window; cdecl;

const 
  SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN               = 'SDL.window.create.always_on_top';
  SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN                  = 'SDL.window.create.borderless';
  SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN                   = 'SDL.window.create.focusable';
  SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN   = 'SDL.window.create.external_graphics_context';
  SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER                        = 'SDL.window.create.flags';
  SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN                  = 'SDL.window.create.fullscreen';
  SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER                       = 'SDL.window.create.height';
  SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN                      = 'SDL.window.create.hidden';
  SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN          = 'SDL.window.create.high_pixel_density';
  SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN                   = 'SDL.window.create.maximized';
  SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN                        = 'SDL.window.create.menu';
  SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN                       = 'SDL.window.create.metal';
  SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN                   = 'SDL.window.create.minimized';
  SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN                       = 'SDL.window.create.modal';
  SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN               = 'SDL.window.create.mouse_grabbed';
  SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN                      = 'SDL.window.create.opengl';
  SDL_PROP_WINDOW_CREATE_PARENT_POINTER                      = 'SDL.window.create.parent';
  SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN                   = 'SDL.window.create.resizable';
  SDL_PROP_WINDOW_CREATE_TITLE_STRING                        = 'SDL.window.create.title';
  SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN                 = 'SDL.window.create.transparent';
  SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN                     = 'SDL.window.create.tooltip';
  SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN                     = 'SDL.window.create.utility';
  SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN                      = 'SDL.window.create.vulkan';
  SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER                        = 'SDL.window.create.width';
  SDL_PROP_WINDOW_CREATE_X_NUMBER                            = 'SDL.window.create.x';
  SDL_PROP_WINDOW_CREATE_Y_NUMBER                            = 'SDL.window.create.y';
  SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER                = 'SDL.window.create.cocoa.window';
  SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER                  = 'SDL.window.create.cocoa.view';
  SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN = 'SDL.window.create.wayland.surface_role_custom';
  SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN   = 'SDL.window.create.wayland.create_egl_window';
  SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER          = 'SDL.window.create.wayland.wl_surface';
  SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER                  = 'SDL.window.create.win32.hwnd';
  SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER     = 'SDL.window.create.win32.pixel_format_hwnd';
  SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER                   = 'SDL.window.create.x11.window';

type
  /// <summary>
  ///  Get the numeric ID of a window.
  /// </summary>
  TSDL_GetWindowID            = function (Awindow: PSDL_Window): TSDL_WindowID; cdecl;

  /// <summary>
  ///  Get a window from a stored ID.
  /// </summary>
  TSDL_GetWindowFromID        = function (Aid: TSDL_WindowID): PSDL_Window; cdecl;

  /// <summary>
  ///  Get parent of a window.
  /// </summary>
  TSDL_GetWindowParent        = function (Awindow: PSDL_Window): PSDL_Window; cdecl;

  /// <summary>
  ///  Get the properties associated with a window.
  /// </summary>
  TSDL_GetWindowProperties    = function (Awindow: PSDL_Window): TSDL_PropertiesID; cdecl;

const 
  SDL_PROP_WINDOW_SHAPE_POINTER                               = 'SDL.window.shape';
  SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN                         = 'SDL.window.HDR_enabled';
  SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT                       = 'SDL.window.SDR_white_level';
  SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT                          = 'SDL.window.HDR_headroom';
  SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER                      = 'SDL.window.android.window';
  SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER                     = 'SDL.window.android.surface';
  SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER                        = 'SDL.window.uikit.window';
  SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER                 = 'SDL.window.uikit.metal_view_tag';
  SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER             = 'SDL.window.uikit.opengl.framebuffer';
  SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER            = 'SDL.window.uikit.opengl.renderbuffer';
  SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER     = 'SDL.window.uikit.opengl.resolve_framebuffer';
  SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER                  = 'SDL.window.kmsdrm.dev_index';
  SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER                        = 'SDL.window.kmsdrm.drm_fd';
  SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER                   = 'SDL.window.kmsdrm.gbm_dev';
  SDL_PROP_WINDOW_COCOA_WINDOW_POINTER                        = 'SDL.window.cocoa.window';
  SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER                 = 'SDL.window.cocoa.metal_view_tag';
  SDL_PROP_WINDOW_OPENVR_OVERLAY_ID                           = 'SDL.window.openvr.overlay_id';
  SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER                     = 'SDL.window.vivante.display';
  SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER                      = 'SDL.window.vivante.window';
  SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER                     = 'SDL.window.vivante.surface';
  SDL_PROP_WINDOW_WIN32_HWND_POINTER                          = 'SDL.window.win32.hwnd';
  SDL_PROP_WINDOW_WIN32_HDC_POINTER                           = 'SDL.window.win32.hdc';
  SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER                      = 'SDL.window.win32.instance';
  SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER                     = 'SDL.window.wayland.display';
  SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER                     = 'SDL.window.wayland.surface';
  SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER                    = 'SDL.window.wayland.viewport';
  SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER                  = 'SDL.window.wayland.egl_window';
  SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER                 = 'SDL.window.wayland.xdg_surface';
  SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER                = 'SDL.window.wayland.xdg_toplevel';
  SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING   = 'SDL.window.wayland.xdg_toplevel_export_handle';
  SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER                   = 'SDL.window.wayland.xdg_popup';
  SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER              = 'SDL.window.wayland.xdg_positioner';
  SDL_PROP_WINDOW_X11_DISPLAY_POINTER                         = 'SDL.window.x11.display';
  SDL_PROP_WINDOW_X11_SCREEN_NUMBER                           = 'SDL.window.x11.screen';
  SDL_PROP_WINDOW_X11_WINDOW_NUMBER                           = 'SDL.window.x11.window';

type
  /// <summary>
  ///  Get the window flags.
  /// </summary>
  TSDL_GetWindowFlags         = function (Awindow: PSDL_Window): TSDL_WindowFlags; cdecl;

  /// <summary>
  ///  Set the title of a window.
  /// </summary>
  TSDL_SetWindowTitle         = function (Awindow: PSDL_Window; const Atitle: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get the title of a window.
  /// </summary>
  TSDL_GetWindowTitle         = function (Awindow: PSDL_Window): PAnsiChar; cdecl;

  /// <summary>
  ///  Set the icon for a window.
  /// </summary>
  TSDL_SetWindowIcon          = function (Awindow: PSDL_Window; Aicon: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Request that the window's position be set.
  /// </summary>
  TSDL_SetWindowPosition      = function (Awindow: PSDL_Window; Ax: int; Ay: int): bool; cdecl;

  /// <summary>
  ///  Get the position of a window.
  /// </summary>               
  TSDL_GetWindowPosition      = function (Awindow: PSDL_Window; var Ax: int; var Ay: int): bool; cdecl;              

  /// <summary>
  ///  Request that the size of a window's client area be set.
  /// </summary>             
  TSDL_SetWindowSize          = function (Awindow: PSDL_Window; Aw: int; Ah: int): bool; cdecl;

  /// <summary>
  ///  Get the size of a window's client area.
  /// </summary>             
  TSDL_GetWindowSize          = function (Awindow: PSDL_Window; var Aw: int; var Ah: int): bool; cdecl;

  /// <summary>
  ///  Get the safe area for this window.
  /// </summary>    
  TSDL_GetWindowSafeArea      = function (Awindow: PSDL_Window; var Arect: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Request that the aspect ratio of a window's client area be set.
  /// </summary>  
  TSDL_SetWindowAspectRatio   = function (Awindow: PSDL_Window; Amin_aspect: float; Amax_aspect: float): bool; cdecl;

  /// <summary>
  ///  Get the size of a window's client area.
  /// </summary>  
  TSDL_GetWindowAspectRatio   = function (Awindow: PSDL_Window; var Amin_aspect: float; var Amax_aspect: float): bool; cdecl;

  /// <summary>
  ///  Get the size of a window's borders (decorations) around the client area.
  /// </summary>
  TSDL_GetWindowBordersSize   = function (Awindow: PSDL_Window; var Atop: int; var Aleft: int; var Abottom: int; var Aright: int): bool; cdecl;

  /// <summary>
  ///  Get the size of a window's client area, in pixels.
  /// </summary>
  TSDL_GetWindowSizeInPixels  = function (Awindow: PSDL_Window; var Aw: int; var Ah: int): bool; cdecl;

  /// <summary>
  ///  Set the minimum size of a window's client area.
  /// </summary>
  TSDL_SetWindowMinimumSize   = function (Awindow: PSDL_Window; Amin_w: int; Amin_h: int): bool; cdecl;

  /// <summary>
  ///  Get the minimum size of a window's client area.
  /// </summary>
  TSDL_GetWindowMinimumSize   = function (Awindow: PSDL_Window; var Aw: int; var Ah: int): bool; cdecl;

  /// <summary>
  ///  Set the maximum size of a window's client area.
  /// </summary>
  TSDL_SetWindowMaximumSize   = function (Awindow: PSDL_Window; Amax_w: int; Amax_h: int): bool; cdecl;

  /// <summary>
  ///  Get the maximum size of a window's client area.
  /// </summary>
  TSDL_GetWindowMaximumSize   = function (Awindow: PSDL_Window; var Aw: int; var Ah: int): bool; cdecl;

  /// <summary>
  ///  Set the border state of a window.
  /// </summary>
  TSDL_SetWindowBordered      = function (Awindow: PSDL_Window; Abordered: bool): bool; cdecl;

  /// <summary>
  ///  Set the user-resizable state of a window.
  /// </summary>
  TSDL_SetWindowResizable     = function (Awindow: PSDL_Window; Aresizable: bool): bool; cdecl;

  /// <summary>
  ///  Set the window to always be above the others.
  /// </summary>
  TSDL_SetWindowAlwaysOnTop   = function (Awindow: PSDL_Window; Aon_top: bool): bool; cdecl;

  /// <summary>
  ///  Show a window.
  /// </summary>
  TSDL_ShowWindow             = function (Awindow: PSDL_Window): bool; cdecl;
  
  /// <summary>
  ///  Hide a window.
  /// </summary>
  TSDL_HideWindow             = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Request that a window be raised above other windows and gain the input
  ///  focus.
  /// </summary>
  TSDL_RaiseWindow            = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Request that the window be made as large as possible.
  /// </summary>
  TSDL_MaximizeWindow         = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Request that the window be minimized to an iconic representation.
  /// </summary>
  TSDL_MinimizeWindow         = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Request that the size and position of a minimized or maximized window be
  ///  restored.
  /// </summary>
  TSDL_RestoreWindow          = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Request that the window's fullscreen state be changed.
  /// </summary>
  TSDL_SetWindowFullscreen    = function (Awindow: PSDL_Window; Afullscreen: bool): bool; cdecl;

  /// <summary>
  ///  Block until any pending window state is finalized.
  /// </summary>
  TSDL_SyncWindow             = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Return whether the window has a surface associated with it.
  /// </summary>
  TSDL_WindowHasSurface       = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Get the SDL surface associated with the window.
  /// </summary>
  TSDL_GetWindowSurface       = function (Awindow: PSDL_Window): PSDL_Surface; cdecl;

  /// <summary>
  ///  Toggle VSync for the window surface.
  /// </summary>
  TSDL_SetWindowSurfaceVSync  = function (Awindow: PSDL_Window; Avsync: int): bool; cdecl;

  /// <summary>
  ///  Get VSync for the window surface.
  /// </summary>
  TSDL_GetWindowSurfaceVSync  = function (Awindow: PSDL_Window; var Avsync: int): bool; cdecl;

  /// <summary>
  ///  Copy the window surface to the screen.
  /// </summary>
  TSDL_UpdateWindowSurface    = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Copy areas of the window surface to the screen.
  /// </summary>
  TSDL_UpdateWindowSurfaceRects
                              = function (Awindow: PSDL_Window; const Arects: PSDL_Rect; Anumrects: int): bool; cdecl;

  /// <summary>
  ///  Destroy the surface associated with the window.
  /// </summary>
  TSDL_DestroyWindowSurface   = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Set a window's keyboard grab mode.
  /// </summary>
  TSDL_SetWindowKeyboardGrab  = function (Awindow: PSDL_Window; Agrabbed: bool): bool; cdecl;

  /// <summary>
  ///  Set a window's mouse grab mode.
  /// </summary>
  TSDL_SetWindowMouseGrab     = function (Awindow: PSDL_Window; Agrabbed: bool): bool; cdecl;

  /// <summary>
  ///  Get a window's keyboard grab mode.
  /// </summary>
  TSDL_GetWindowKeyboardGrab  = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Get a window's mouse grab mode.
  /// </summary>
  TSDL_GetWindowMouseGrab     = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Get the window that currently has an input grab enabled.
  /// </summary>
  TSDL_GetGrabbedWindow       = function (): PSDL_Window; cdecl;

  /// <summary>
  ///  Confines the cursor to the specified area of a window.
  /// </summary>
  TSDL_SetWindowMouseRect     = function (Awindow: PSDL_Window; const Arect: TSDL_Rect): bool; cdecl;

  /// <summary>
  ///  Get the mouse confinement rectangle of a window.
  /// </summary>
  TSDL_GetWindowMouseRect     = function (Awindow: PSDL_Window): PSDL_Rect; cdecl;

  /// <summary>
  ///  Set the opacity for a window.
  /// </summary>
  TSDL_SetWindowOpacity       = function (Awindow: PSDL_Window; Aopacity: float): bool; cdecl;

  /// <summary>
  ///  Get the opacity of a window.
  /// </summary>
  TSDL_GetWindowOpacity       = function (Awindow: PSDL_Window): float; cdecl;

  /// <summary>
  ///  Set the window as a child of a parent window.
  /// </summary>
  TSDL_SetWindowParent        = function (Awindow: PSDL_Window; Aparent: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Toggle the state of the window as modal.
  /// </summary>
  TSDL_SetWindowModal         = function (Awindow: PSDL_Window; Amodal: bool): bool; cdecl;

  /// <summary>
  ///  Set whether the window may have input focus.
  /// </summary>
  TSDL_SetWindowFocusable     = function (Awindow: PSDL_Window; Afocusable: bool): bool; cdecl;

  /// <summary>
  ///  Display the system-level window menu.
  /// </summary>
  TSDL_ShowWindowSystemMenu   = function (Awindow: PSDL_Window; Ax: int; Ay: int): bool; cdecl;

  TSDL_HitTestResult          = (
                                  SDL_HITTEST_NORMAL,
                                  SDL_HITTEST_DRAGGABLE,
                                  SDL_HITTEST_RESIZE_TOPLEFT,
                                  SDL_HITTEST_RESIZE_TOP,
                                  SDL_HITTEST_RESIZE_TOPRIGHT,
                                  SDL_HITTEST_RESIZE_RIGHT,
                                  SDL_HITTEST_RESIZE_BOTTOMRIGHT,
                                  SDL_HITTEST_RESIZE_BOTTOM,
                                  SDL_HITTEST_RESIZE_BOTTOMLEFT,
                                  SDL_HITTEST_LEFT
                                );
  PSDL_HitTestResult          = ^TSDL_HitTestResult;

  /// <summary>
  ///  Callback used for hit-testing.
  /// </summary>
  TSDL_HitTest                = function (Awin: PSDL_Window; const Aarea: PSDL_Point; Adata: Pointer): TSDL_HitTestResult;

  /// <summary>
  ///  Provide a callback that decides if a window region has special properties.
  /// </summary>
  TSDL_SetWindowHitTest       = function (Awindow: PSDL_Window; Acallback: TSDL_HitTest; Acallback_data: Pointer): bool; cdecl;

  /// <summary>
  ///  Set the shape of a transparent window.
  /// </summary>
  TSDL_SetWindowShape         = function (Awindow: PSDL_Window; Ashape: PSDL_Surface): bool; cdecl;

  /// <summary>
  ///  Request a window to demand attention from the user.
  /// </summary>
  TSDL_FlashWindow            = function (Awindow: PSDL_Window; Aoperation: TSDL_FlashOperation): bool; cdecl;

  /// <summary>
  ///  Destroy a window.
  /// </summary>
  TSDL_DestroyWindow          = procedure (Awindow: PSDL_Window); cdecl;

  /// <summary>
  ///  Check whether the screensaver is currently enabled.
  /// </summary>
  TSDL_ScreenSaverEnabled     = function (): bool; cdecl;

  /// <summary>
  ///  Allow the screen to be blanked by a screen saver.
  /// </summary>
  TSDL_EnableScreenSaver      = function (): bool; cdecl;

  /// <summary>
  ///  Prevent the screen from being blanked by a screen saver.
  /// </summary>
  TSDL_DisableScreenSaver     = function (): bool; cdecl;

  /// <summary>
  ///  Dynamically load an OpenGL library.
  /// </summary>
  TSDL_GL_LoadLibrary         = function (const Apath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get an OpenGL function by name.
  /// </summary>
  TSDL_GL_GetProcAddress      = function (const Aproc: PAnsiChar): TSDL_FunctionPointer; cdecl;

  /// <summary>
  ///  Get an EGL library function by name.
  /// </summary>
  TSDL_EGL_GetProcAddress     = function (const Aproc: PAnsiChar): TSDL_FunctionPointer; cdecl;

  /// <summary>
  ///  Unload the OpenGL library previously loaded by SDL_GL_LoadLibrary().
  /// </summary>
  TSDL_GL_UnloadLibrary       = procedure (); cdecl;
  
  /// <summary>
  ///  Check if an OpenGL extension is supported for the current context.
  /// </summary>
  TSDL_GL_ExtensionSupported  = function (const Aextension: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  CReset all previously set OpenGL context attributes to their default values.
  /// </summary>
  TSDL_GL_ResetAttributes     = procedure (); cdecl;

  /// <summary>
  ///  Set an OpenGL window attribute before window creation.
  /// </summary>
  TSDL_GL_SetAttribute        = function (Aattr: TSDL_GLAttr; Avalue: int): bool;

  /// <summary>
  ///  Get the actual value for an attribute from the current context.
  /// </summary>
  TSDL_GL_GetAttribute        = function (Aattr: TSDL_GLAttr; var Avalue: int): bool; cdecl;

  /// <summary>
  ///  Create an OpenGL context for an OpenGL window, and make it current.
  /// </summary>
  TSDL_GL_CreateContext       = function (Awindow: PSDL_Window): PSDL_GLContext;

  /// <summary>
  ///  Set up an OpenGL context for rendering into an OpenGL window.
  /// </summary>
  TSDL_GL_MakeCurrent         = function (Awindow: PSDL_Window; Acontext: PSDL_GLContext): bool; cdecl;

  /// <summary>
  ///  Get the currently active OpenGL window.
  /// </summary>
  TSDL_GL_GetCurrentWindow    = function (): PSDL_Window; cdecl;

  /// <summary>
  ///  Get the currently active OpenGL context.
  /// </summary>
  TSDL_GL_GetCurrentContext   = function (): PSDL_GLContext; cdecl;

  /// <summary>
  ///  Get the currently active EGL display.
  /// </summary>
  TSDL_EGL_GetCurrentDisplay  = function (): PSDL_EGLDisplay; cdecl;

  /// <summary>
  ///  Get the currently active EGL config.
  /// </summary>
  TSDL_EGL_GetCurrentConfig   = function (): PSDL_EGLConfig; cdecl;

  /// <summary>
  ///  Get the EGL surface associated with the window.
  /// </summary>
  TSDL_EGL_GetWindowSurface   = function (Awindow: PSDL_Window): PSDL_EGLSurface; cdecl;

  /// <summary>
  ///  Sets the callbacks for defining custom EGLAttrib arrays for EGL
  ///  initialization.
  /// </summary>
  TSDL_EGL_SetAttributeCallbacks
                              = procedure (AplatformAttribCallback: TSDL_EGLAttribArrayCallback; AsurfaceAttribCallback: TSDL_EGLIntArrayCallback; AcontextAttribCallback: TSDL_EGLIntArrayCallback; Auserdata: Pointer); cdecl;

  /// <summary>
  ///  Set the swap interval for the current OpenGL context.
  /// </summary>
  TSDL_GL_SetSwapInterval     = function (Ainterval: int): bool; cdecl;

  /// <summary>
  ///  Get the swap interval for the current OpenGL context.
  /// </summary>
  TSDL_GL_GetSwapInterval     = function (var Ainterval: int): bool; cdecl;

  /// <summary>
  ///  Update a window with OpenGL rendering.
  /// </summary>
  TSDL_GL_SwapWindow          = function (Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Delete an OpenGL context.
  /// </summary>
  TSDL_GL_DestroyContext      = function (Acontext: PSDL_GLContext): bool; cdecl;

var
  SDL_GetNumVideoDrivers      : TSDL_GetNumVideoDrivers;
  SDL_GetVideoDriver          : TSDL_GetVideoDriver;
  SDL_GetCurrentVideoDriver   : TSDL_GetCurrentVideoDriver;
  SDL_GetSystemTheme          : TSDL_GetSystemTheme;
  SDL_GetDisplays             : TSDL_GetDisplays;
  SDL_GetPrimaryDisplay       : TSDL_GetPrimaryDisplay;
  SDL_GetDisplayProperties    : TSDL_GetDisplayProperties;
  SDL_GetDisplayName          : TSDL_GetDisplayName;
  SDL_GetDisplayBounds        : TSDL_GetDisplayBounds;
  SDL_GetDisplayUsableBounds  : TSDL_GetDisplayUsableBounds;
  SDL_GetNaturalDisplayOrientation
                              : TSDL_GetNaturalDisplayOrientation;
  SDL_GetCurrentDisplayOrientation
                              : TSDL_GetCurrentDisplayOrientation;
  SDL_GetDisplayContentScale  : TSDL_GetDisplayContentScale;
  SDL_GetFullscreenDisplayModes
                              : TSDL_GetFullscreenDisplayModes;
  SDL_GetClosestFullscreenDisplayMode
                              : TSDL_GetClosestFullscreenDisplayMode;
  SDL_GetDesktopDisplayMode   : TSDL_GetDesktopDisplayMode;
  SDL_GetCurrentDisplayMode   : TSDL_GetCurrentDisplayMode;
  SDL_GetDisplayForPoint      : TSDL_GetDisplayForPoint;
  SDL_GetDisplayForRect       : TSDL_GetDisplayForRect;
  SDL_GetDisplayForWindow     : TSDL_GetDisplayForWindow;
  SDL_GetWindowPixelDensity   : TSDL_GetWindowPixelDensity;
  SDL_GetWindowDisplayScale   : TSDL_GetWindowDisplayScale;
  SDL_SetWindowFullscreenMode : TSDL_SetWindowFullscreenMode;
  SDL_GetWindowFullscreenMode : TSDL_GetWindowFullscreenMode;
  SDL_GetWindowICCProfile     : TSDL_GetWindowICCProfile;
  SDL_GetWindowPixelFormat    : TSDL_GetWindowPixelFormat;
  SDL_GetWindows              : TSDL_GetWindows;
  SDL_CreateWindow            : TSDL_CreateWindow;
  SDL_CreatePopupWindow       : TSDL_CreatePopupWindow;
  SDL_CreateWindowWithProperties
                              : TSDL_CreateWindowWithProperties;
  SDL_GetWindowID             : TSDL_GetWindowID;
  SDL_GetWindowFromID         : TSDL_GetWindowFromID;
  SDL_GetWindowParent         : TSDL_GetWindowParent;
  SDL_GetWindowProperties     : TSDL_GetWindowProperties;
  SDL_GetWindowFlags          : TSDL_GetWindowFlags;
  SDL_SetWindowTitle          : TSDL_SetWindowTitle;
  SDL_GetWindowTitle          : TSDL_SetWindowTitle;
  SDL_SetWindowIcon           : TSDL_SetWindowIcon;
  SDL_SetWindowPosition       : TSDL_SetWindowPosition;
  SDL_GetWindowPosition       : TSDL_GetWindowPosition;
  SDL_SetWindowSize           : TSDL_SetWindowSize;
  SDL_GetWindowSize           : TSDL_GetWindowSize;
  SDL_GetWindowSafeArea       : TSDL_GetWindowSafeArea;
  SDL_SetWindowAspectRatio    : TSDL_SetWindowAspectRatio;
  SDL_GetWindowAspectRatio    : TSDL_GetWindowAspectRatio;
  SDL_GetWindowBordersSize    : TSDL_GetWindowBordersSize;
  SDL_GetWindowSizeInPixels   : TSDL_GetWindowSizeInPixels;
  SDL_SetWindowMinimumSize    : TSDL_SetWindowMinimumSize;
  SDL_GetWindowMinimumSize    : TSDL_GetWindowMinimumSize;
  SDL_SetWindowMaximumSize    : TSDL_SetWindowMaximumSize;
  SDL_GetWindowMaximumSize    : TSDL_GetWindowMaximumSize;
  SDL_SetWindowBordered       : TSDL_SetWindowBordered;
  SDL_SetWindowResizable      : TSDL_SetWindowResizable;
  SDL_SetWindowAlwaysOnTop    : TSDL_SetWindowAlwaysOnTop;
  SDL_ShowWindow              : TSDL_ShowWindow;
  SDL_HideWindow              : TSDL_HideWindow;
  SDL_RaiseWindow             : TSDL_RaiseWindow;
  SDL_MaximizeWindow          : TSDL_MaximizeWindow;
  SDL_MinimizeWindow          : TSDL_MinimizeWindow;
  SDL_RestoreWindow           : TSDL_RestoreWindow;
  SDL_SetWindowFullscreen     : TSDL_SetWindowFullscreen;
  SDL_SyncWindow              : TSDL_SyncWindow;
  SDL_WindowHasSurface        : TSDL_WindowHasSurface;
  SDL_GetWindowSurface        : TSDL_GetWindowSurface;
  SDL_SetWindowSurfaceVSync   : TSDL_SetWindowSurfaceVSync;
  SDL_GetWindowSurfaceVSync   : TSDL_GetWindowSurfaceVSync;
  SDL_UpdateWindowSurface     : TSDL_UpdateWindowSurface;
  SDL_UpdateWindowSurfaceRects
                              : TSDL_UpdateWindowSurfaceRects;
  SDL_DestroyWindowSurface    : TSDL_DestroyWindowSurface;
  SDL_SetWindowKeyboardGrab   : TSDL_SetWindowKeyboardGrab;
  SDL_SetWindowMouseGrab      : TSDL_SetWindowMouseGrab;
  SDL_GetWindowKeyboardGrab   : TSDL_GetWindowKeyboardGrab;
  SDL_GetWindowMouseGrab      : TSDL_GetWindowMouseGrab;
  SDL_GetGrabbedWindow        : TSDL_GetGrabbedWindow;
  SDL_SetWindowMouseRect      : TSDL_SetWindowMouseRect;
  SDL_GetWindowMouseRect      : TSDL_GetWindowMouseRect;
  SDL_SetWindowOpacity        : TSDL_SetWindowOpacity;
  SDL_GetWindowOpacity        : TSDL_GetWindowOpacity;
  SDL_SetWindowParent         : TSDL_SetWindowParent;
  SDL_SetWindowModal          : TSDL_SetWindowModal;
  SDL_SetWindowFocusable      : TSDL_SetWindowFocusable;
  SDL_ShowWindowSystemMenu    : TSDL_ShowWindowSystemMenu;
  SDL_SetWindowHitTest        : TSDL_SetWindowHitTest;
  SDL_SetWindowShape          : TSDL_SetWindowShape;
  SDL_FlashWindow             : TSDL_FlashWindow;
  SDL_DestroyWindow           : TSDL_DestroyWindow;
  SDL_ScreenSaverEnabled      : TSDL_ScreenSaverEnabled;
  SDL_EnableScreenSaver       : TSDL_EnableScreenSaver;
  SDL_DisableScreenSaver      : TSDL_DisableScreenSaver;
  SDL_GL_LoadLibrary          : TSDL_GL_LoadLibrary;
  SDL_GL_GetProcAddress       : TSDL_GL_GetProcAddress;
  SDL_EGL_GetProcAddress      : TSDL_EGL_GetProcAddress;
  SDL_GL_UnloadLibrary        : TSDL_GL_UnloadLibrary;
  SDL_GL_ExtensionSupported   : TSDL_GL_ExtensionSupported;
  SDL_GL_ResetAttributes      : TSDL_GL_ResetAttributes;
  SDL_GL_SetAttribute         : TSDL_GL_SetAttribute;
  SDL_GL_GetAttribute         : TSDL_GL_GetAttribute;
  SDL_GL_CreateContext        : TSDL_GL_CreateContext;
  SDL_GL_MakeCurrent          : TSDL_GL_MakeCurrent;
  SDL_GL_GetCurrentWindow     : TSDL_GL_GetCurrentWindow;
  SDL_GL_GetCurrentContext    : TSDL_GL_GetCurrentContext;
  SDL_EGL_GetCurrentDisplay   : TSDL_EGL_GetCurrentDisplay;
  SDL_EGL_GetCurrentConfig    : TSDL_EGL_GetCurrentConfig;
  SDL_EGL_GetWindowSurface    : TSDL_EGL_GetWindowSurface;
  SDL_EGL_SetAttributeCallbacks
                              : TSDL_EGL_SetAttributeCallbacks;
  SDL_GL_SetSwapInterval      : TSDL_GL_SetSwapInterval;
  SDL_GL_GetSwapInterval      : TSDL_GL_GetSwapInterval;
  SDL_GL_SwapWindow           : TSDL_GL_SwapWindow;
  SDL_GL_DestroyContext       : TSDL_GL_DestroyContext;

procedure InitLibrary(const AHandle: THandle);

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

procedure InitLibrary(const AHandle: THandle);
begin
  SDL_GetNumVideoDrivers      := BindProcedure(AHandle, 'SDL_GetNumVideoDrivers');
  SDL_GetVideoDriver          := BindProcedure(AHandle, 'SDL_GetVideoDriver');
  SDL_GetCurrentVideoDriver   := BindProcedure(AHandle, 'SDL_GetCurrentVideoDriver');
  SDL_GetSystemTheme          := BindProcedure(AHandle, 'SDL_GetSystemTheme');
  SDL_GetDisplays             := BindProcedure(AHandle, 'SDL_GetDisplays');
  SDL_GetPrimaryDisplay       := BindProcedure(AHandle, 'SDL_GetPrimaryDisplay');
  SDL_GetDisplayProperties    := BindProcedure(AHandle, 'SDL_GetDisplayProperties');
  SDL_GetDisplayName          := BindProcedure(AHandle, 'SDL_GetDisplayName');
  SDL_GetDisplayBounds        := BindProcedure(AHandle, 'SDL_GetDisplayBounds');
  SDL_GetDisplayUsableBounds  := BindProcedure(AHandle, 'SDL_GetDisplayUsableBounds');
  SDL_GetNaturalDisplayOrientation
                              := BindProcedure(AHandle, 'SDL_GetNaturalDisplayOrientation');
  SDL_GetCurrentDisplayOrientation
                              := BindProcedure(AHandle, 'SDL_GetCurrentDisplayOrientation');
  SDL_GetDisplayContentScale  := BindProcedure(AHandle, 'SDL_GetDisplayContentScale');
  SDL_GetFullscreenDisplayModes
                              := BindProcedure(AHandle, 'SDL_GetFullscreenDisplayModes');
  SDL_GetClosestFullscreenDisplayMode
                              := BindProcedure(AHandle, 'SDL_GetClosestFullscreenDisplayMode');
  SDL_GetDesktopDisplayMode   := BindProcedure(AHandle, 'SDL_GetDesktopDisplayMode');
  SDL_GetCurrentDisplayMode   := BindProcedure(AHandle, 'SDL_GetCurrentDisplayMode');
  SDL_GetDisplayForPoint      := BindProcedure(AHandle, 'SDL_GetDisplayForPoint');
  SDL_GetDisplayForRect       := BindProcedure(AHandle, 'SDL_GetDisplayForRect');
  SDL_GetDisplayForWindow     := BindProcedure(AHandle, 'SDL_GetDisplayForWindow');
  SDL_GetWindowPixelDensity   := BindProcedure(AHandle, 'SDL_GetWindowPixelDensity');
  SDL_GetWindowDisplayScale   := BindProcedure(AHandle, 'SDL_GetWindowDisplayScale');
  SDL_SetWindowFullscreenMode := BindProcedure(AHandle, 'SDL_SetWindowFullscreenMode');
  SDL_GetWindowFullscreenMode := BindProcedure(AHandle, 'SDL_GetWindowFullscreenMode');
  SDL_GetWindowICCProfile     := BindProcedure(AHandle, 'SDL_GetWindowICCProfile');
  SDL_GetWindowPixelFormat    := BindProcedure(AHandle, 'SDL_GetWindowPixelFormat');
  SDL_GetWindows              := BindProcedure(AHandle, 'SDL_GetWindows');
  SDL_CreateWindow            := BindProcedure(AHandle, 'SDL_CreateWindow');
  SDL_CreatePopupWindow       := BindProcedure(AHandle, 'SDL_CreatePopupWindow');
  SDL_CreateWindowWithProperties
                              := BindProcedure(AHandle, 'SDL_CreateWindowWithProperties');
  SDL_GetWindowID             := BindProcedure(AHandle, 'SDL_GetWindowID');
  SDL_GetWindowFromID         := BindProcedure(AHandle, 'SDL_GetWindowFromID');
  SDL_GetWindowParent         := BindProcedure(AHandle, 'SDL_GetWindowParent');
  SDL_GetWindowProperties     := BindProcedure(AHandle, 'SDL_GetWindowProperties');
  SDL_GetWindowFlags          := BindProcedure(AHandle, 'SDL_GetWindowFlags');
  SDL_SetWindowTitle          := BindProcedure(AHandle, 'SDL_SetWindowTitle');
  SDL_GetWindowTitle          := BindProcedure(AHandle, 'SDL_GetWindowTitle');
  SDL_SetWindowIcon           := BindProcedure(AHandle, 'SDL_SetWindowIcon');
  SDL_SetWindowPosition       := BindProcedure(AHandle, 'SDL_SetWindowPosition');
  SDL_GetWindowPosition       := BindProcedure(AHandle, 'SDL_GetWindowPosition');
  SDL_SetWindowSize           := BindProcedure(AHandle, 'SDL_SetWindowSize');
  SDL_GetWindowSize           := BindProcedure(AHandle, 'SDL_GetWindowSize');
  SDL_GetWindowSafeArea       := BindProcedure(AHandle, 'SDL_GetWindowSafeArea');
  SDL_SetWindowAspectRatio    := BindProcedure(AHandle, 'SDL_SetWindowAspectRatio');
  SDL_GetWindowAspectRatio    := BindProcedure(AHandle, 'SDL_GetWindowAspectRatio');
  SDL_GetWindowBordersSize    := BindProcedure(AHandle, 'SDL_GetWindowBordersSize');
  SDL_GetWindowSizeInPixels   := BindProcedure(AHandle, 'SDL_GetWindowSizeInPixels');
  SDL_SetWindowMinimumSize    := BindProcedure(AHandle, 'SDL_SetWindowMinimumSize');
  SDL_GetWindowMinimumSize    := BindProcedure(AHandle, 'SDL_GetWindowMinimumSize');
  SDL_SetWindowMaximumSize    := BindProcedure(AHandle, 'SDL_SetWindowMaximumSize');
  SDL_GetWindowMaximumSize    := BindProcedure(AHandle, 'SDL_GetWindowMaximumSize');
  SDL_SetWindowBordered       := BindProcedure(AHandle, 'SDL_SetWindowBordered');
  SDL_SetWindowResizable      := BindProcedure(AHandle, 'SDL_SetWindowResizable');
  SDL_SetWindowAlwaysOnTop    := BindProcedure(AHandle, 'SDL_SetWindowAlwaysOnTop');
  SDL_ShowWindow              := BindProcedure(AHandle, 'SDL_ShowWindow');
  SDL_HideWindow              := BindProcedure(AHandle, 'SDL_HideWindow');
  SDL_RaiseWindow             := BindProcedure(AHandle, 'SDL_RaiseWindow');
  SDL_MaximizeWindow          := BindProcedure(AHandle, 'SDL_MaximizeWindow');
  SDL_MinimizeWindow          := BindProcedure(AHandle, 'SDL_MinimizeWindow');
  SDL_RestoreWindow           := BindProcedure(AHandle, 'SDL_RestoreWindow');
  SDL_SetWindowFullscreen     := BindProcedure(AHandle, 'SDL_SetWindowFullscreen');
  SDL_SyncWindow              := BindProcedure(AHandle, 'SDL_SyncWindow');
  SDL_WindowHasSurface        := BindProcedure(AHandle, 'SDL_WindowHasSurface');
  SDL_GetWindowSurface        := BindProcedure(AHandle, 'SDL_GetWindowSurface');
  SDL_SetWindowSurfaceVSync   := BindProcedure(AHandle, 'SDL_SetWindowSurfaceVSync');
  SDL_GetWindowSurfaceVSync   := BindProcedure(AHandle, 'SDL_GetWindowSurfaceVSync');
  SDL_UpdateWindowSurface     := BindProcedure(AHandle, 'SDL_UpdateWindowSurface');
  SDL_UpdateWindowSurfaceRects
                              := BindProcedure(AHandle, 'SDL_UpdateWindowSurfaceRects');
  SDL_DestroyWindowSurface    := BindProcedure(AHandle, 'SDL_DestroyWindowSurface');
  SDL_SetWindowKeyboardGrab   := BindProcedure(AHandle, 'SDL_SetWindowKeyboardGrab');
  SDL_SetWindowMouseGrab      := BindProcedure(AHandle, 'SDL_SetWindowMouseGrab');
  SDL_GetWindowKeyboardGrab   := BindProcedure(AHandle, 'SDL_GetWindowKeyboardGrab');
  SDL_GetWindowMouseGrab      := BindProcedure(AHandle, 'SDL_GetWindowMouseGrab');
  SDL_GetGrabbedWindow        := BindProcedure(AHandle, 'SDL_GetGrabbedWindow');
  SDL_SetWindowMouseRect      := BindProcedure(AHandle, 'SDL_SetWindowMouseRect');
  SDL_GetWindowMouseRect      := BindProcedure(AHandle, 'SDL_GetWindowMouseRect');
  SDL_SetWindowOpacity        := BindProcedure(AHandle, 'SDL_SetWindowOpacity');
  SDL_GetWindowOpacity        := BindProcedure(AHandle, 'SDL_GetWindowOpacity');
  SDL_SetWindowParent         := BindProcedure(AHandle, 'SDL_SetWindowParent');
  SDL_SetWindowModal          := BindProcedure(AHandle, 'SDL_SetWindowModal');
  SDL_SetWindowFocusable      := BindProcedure(AHandle, 'SDL_SetWindowFocusable');
  SDL_ShowWindowSystemMenu    := BindProcedure(AHandle, 'SDL_ShowWindowSystemMenu');
  SDL_SetWindowHitTest        := BindProcedure(AHandle, 'SDL_SetWindowHitTest');
  SDL_SetWindowShape          := BindProcedure(AHandle, 'SDL_SetWindowShape');
  SDL_FlashWindow             := BindProcedure(AHandle, 'SDL_FlashWindow');
  SDL_DestroyWindow           := BindProcedure(AHandle, 'SDL_DestroyWindow');
  SDL_ScreenSaverEnabled      := BindProcedure(AHandle, 'SDL_ScreenSaverEnabled');
  SDL_EnableScreenSaver       := BindProcedure(AHandle, 'SDL_EnableScreenSaver');
  SDL_DisableScreenSaver      := BindProcedure(AHandle, 'SDL_DisableScreenSaver');
  SDL_GL_LoadLibrary          := BindProcedure(AHandle, 'SDL_GL_LoadLibrary');
  SDL_GL_GetProcAddress       := BindProcedure(AHandle, 'SDL_GL_GetProcAddress');
  SDL_EGL_GetProcAddress      := BindProcedure(AHandle, 'SDL_EGL_GetProcAddress');
  SDL_GL_UnloadLibrary        := BindProcedure(AHandle, 'SDL_GL_UnloadLibrary');
  SDL_GL_ExtensionSupported   := BindProcedure(AHandle, 'SDL_GL_ExtensionSupported');
  SDL_GL_ResetAttributes      := BindProcedure(AHandle, 'SDL_GL_ResetAttributes');
  SDL_GL_SetAttribute         := BindProcedure(AHandle, 'SDL_GL_SetAttribute');
  SDL_GL_GetAttribute         := BindProcedure(AHandle, 'SDL_GL_GetAttribute');
  SDL_GL_CreateContext        := BindProcedure(AHandle, 'SDL_GL_CreateContext');
  SDL_GL_MakeCurrent          := BindProcedure(AHandle, 'SDL_GL_MakeCurrent');
  SDL_GL_GetCurrentWindow     := BindProcedure(AHandle, 'SDL_GL_GetCurrentWindow');
  SDL_GL_GetCurrentContext    := BindProcedure(AHandle, 'SDL_GL_GetCurrentContext');
  SDL_EGL_GetCurrentDisplay   := BindProcedure(AHandle, 'SDL_EGL_GetCurrentDisplay');
  SDL_EGL_GetCurrentConfig    := BindProcedure(AHandle, 'SDL_EGL_GetCurrentConfig');
  SDL_EGL_GetWindowSurface    := BindProcedure(AHandle, 'SDL_EGL_GetWindowSurface');
  SDL_EGL_SetAttributeCallbacks
                              := BindProcedure(AHandle, 'SDL_EGL_SetAttributeCallbacks');
  SDL_GL_SetSwapInterval      := BindProcedure(AHandle, 'SDL_GL_SetSwapInterval');
  SDL_GL_GetSwapInterval      := BindProcedure(AHandle, 'SDL_GL_GetSwapInterval');
  SDL_GL_SwapWindow           := BindProcedure(AHandle, 'SDL_GL_SwapWindow');
  SDL_GL_DestroyContext       := BindProcedure(AHandle, 'SDL_GL_DestroyContext');
end;

end.
