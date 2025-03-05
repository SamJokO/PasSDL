﻿unit SDL.hints;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.error,
  SDL.stdinc;

const
  SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED                  = 'SDL_ALLOW_ALT_TAB_WHILE_GRABBED';
  SDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY              = 'SDL_ANDROID_ALLOW_RECREATE_ACTIVITY';
  SDL_HINT_ANDROID_BLOCK_ON_PAUSE                       = 'SDL_ANDROID_BLOCK_ON_PAUSE';
  SDL_HINT_ANDROID_LOW_LATENCY_AUDIO                    = 'SDL_ANDROID_LOW_LATENCY_AUDIO';
  SDL_HINT_ANDROID_TRAP_BACK_BUTTON                     = 'SDL_ANDROID_TRAP_BACK_BUTTON';
  SDL_HINT_APP_ID                                       = 'SDL_APP_ID';
  SDL_HINT_APP_NAME                                     = 'SDL_APP_NAME';
  SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS                = 'SDL_APPLE_TV_CONTROLLER_UI_EVENTS';
  SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION               = 'SDL_APPLE_TV_REMOTE_ALLOW_ROTATION';
  SDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE                    = 'SDL_AUDIO_ALSA_DEFAULT_DEVICE';
  SDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE           = 'SDL_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE';
  SDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE          = 'SDL_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE';
  SDL_HINT_AUDIO_CATEGORY                               = 'SDL_AUDIO_CATEGORY';
  SDL_HINT_AUDIO_CHANNELS                               = 'SDL_AUDIO_CHANNELS';
  SDL_HINT_AUDIO_DEVICE_APP_ICON_NAME                   = 'SDL_AUDIO_DEVICE_APP_ICON_NAME';
  SDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES                   = 'SDL_AUDIO_DEVICE_SAMPLE_FRAMES';
  SDL_HINT_AUDIO_DEVICE_STREAM_NAME                     = 'SDL_AUDIO_DEVICE_STREAM_NAME';
  SDL_HINT_AUDIO_DEVICE_STREAM_ROLE                     = 'SDL_AUDIO_DEVICE_STREAM_ROLE';
  SDL_HINT_AUDIO_DISK_INPUT_FILE                        = 'SDL_AUDIO_DISK_INPUT_FILE';
  SDL_HINT_AUDIO_DISK_OUTPUT_FILE                       = 'SDL_AUDIO_DISK_OUTPUT_FILE';
  SDL_HINT_AUDIO_DISK_TIMESCALE                         = 'SDL_AUDIO_DISK_TIMESCALE';
  SDL_HINT_AUDIO_DRIVER                                 = 'SDL_AUDIO_DRIVER';
  SDL_HINT_AUDIO_DUMMY_TIMESCALE                        = 'SDL_AUDIO_DUMMY_TIMESCALE';
  SDL_HINT_AUDIO_FORMAT                                 = 'SDL_AUDIO_FORMAT';
  SDL_HINT_AUDIO_FREQUENCY                              = 'SDL_AUDIO_FREQUENCY';
  SDL_HINT_AUDIO_INCLUDE_MONITORS                       = 'SDL_AUDIO_INCLUDE_MONITORS';
  SDL_HINT_AUTO_UPDATE_JOYSTICKS                        = 'SDL_AUTO_UPDATE_JOYSTICKS';
  SDL_HINT_AUTO_UPDATE_SENSORS                          = 'SDL_AUTO_UPDATE_SENSORS';
  SDL_HINT_BMP_SAVE_LEGACY_FORMAT                       = 'SDL_BMP_SAVE_LEGACY_FORMAT';
  SDL_HINT_CAMERA_DRIVER                                = 'SDL_CAMERA_DRIVER';
  SDL_HINT_CPU_FEATURE_MASK                             = 'SDL_CPU_FEATURE_MASK';
  SDL_HINT_JOYSTICK_DIRECTINPUT                         = 'SDL_JOYSTICK_DIRECTINPUT';
  SDL_HINT_FILE_DIALOG_DRIVER                           = 'SDL_FILE_DIALOG_DRIVER';
  SDL_HINT_DISPLAY_USABLE_BOUNDS                        = 'SDL_DISPLAY_USABLE_BOUNDS';
  SDL_HINT_EMSCRIPTEN_ASYNCIFY                          = 'SDL_EMSCRIPTEN_ASYNCIFY';
  SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR                   = 'SDL_EMSCRIPTEN_CANVAS_SELECTOR';
  SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT                  = 'SDL_EMSCRIPTEN_KEYBOARD_ELEMENT';
  SDL_HINT_ENABLE_SCREEN_KEYBOARD                       = 'SDL_ENABLE_SCREEN_KEYBOARD';
  SDL_HINT_EVDEV_DEVICES                                = 'SDL_EVDEV_DEVICES';
  SDL_HINT_EVENT_LOGGING                                = 'SDL_EVENT_LOGGING';
  SDL_HINT_FORCE_RAISEWINDOW                            = 'SDL_FORCE_RAISEWINDOW';
  SDL_HINT_FRAMEBUFFER_ACCELERATION                     = 'SDL_FRAMEBUFFER_ACCELERATION';
  SDL_HINT_GAMECONTROLLERCONFIG                         = 'SDL_GAMECONTROLLERCONFIG';
  SDL_HINT_GAMECONTROLLERCONFIG_FILE                    = 'SDL_GAMECONTROLLERCONFIG_FILE';
  SDL_HINT_GAMECONTROLLERTYPE                           = 'SDL_GAMECONTROLLERTYPE';
  SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES                = 'SDL_GAMECONTROLLER_IGNORE_DEVICES';
  SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT         = 'SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT';
  SDL_HINT_GAMECONTROLLER_SENSOR_FUSION                 = 'SDL_GAMECONTROLLER_SENSOR_FUSION';
  SDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT                   = 'SDL_GDK_TEXTINPUT_DEFAULT_TEXT';
  SDL_HINT_GDK_TEXTINPUT_DESCRIPTION                    = 'SDL_GDK_TEXTINPUT_DESCRIPTION';
  SDL_HINT_GDK_TEXTINPUT_MAX_LENGTH                     = 'SDL_GDK_TEXTINPUT_MAX_LENGTH';
  SDL_HINT_GDK_TEXTINPUT_SCOPE                          = 'SDL_GDK_TEXTINPUT_SCOPE';
  SDL_HINT_GDK_TEXTINPUT_TITLE                          = 'SDL_GDK_TEXTINPUT_TITLE';
  SDL_HINT_HIDAPI_LIBUSB                                = 'SDL_HIDAPI_LIBUSB';
  SDL_HINT_HIDAPI_LIBUSB_WHITELIST                      = 'SDL_HIDAPI_LIBUSB_WHITELIST';
  SDL_HINT_HIDAPI_UDEV                                  = 'SDL_HIDAPI_UDEV';
  SDL_HINT_GPU_DRIVER                                   = 'SDL_GPU_DRIVER';
  SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS            = 'SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS';
  SDL_HINT_HIDAPI_IGNORE_DEVICES                        = 'SDL_HIDAPI_IGNORE_DEVICES';
  SDL_HINT_IME_IMPLEMENTED_UI                           = 'SDL_IME_IMPLEMENTED_UI';
  SDL_HINT_IOS_HIDE_HOME_INDICATOR                      = 'SDL_IOS_HIDE_HOME_INDICATOR';
  SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS             = 'SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS';
  SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES                 = 'SDL_JOYSTICK_ARCADESTICK_DEVICES';
  SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED        = 'SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED';
  SDL_HINT_JOYSTICK_BLACKLIST_DEVICES                   = 'SDL_JOYSTICK_BLACKLIST_DEVICES';
  SDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED          = 'SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED';
  SDL_HINT_JOYSTICK_DEVICE                              = 'SDL_JOYSTICK_DEVICE';
  SDL_HINT_JOYSTICK_ENHANCED_REPORTS                    = 'SDL_JOYSTICK_ENHANCED_REPORTS';
  SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES                 = 'SDL_JOYSTICK_FLIGHTSTICK_DEVICES';
  SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED        = 'SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED';
  SDL_HINT_JOYSTICK_GAMEINPUT                           = 'SDL_JOYSTICK_GAMEINPUT';
  SDL_HINT_JOYSTICK_GAMECUBE_DEVICES                    = 'SDL_JOYSTICK_GAMECUBE_DEVICES';
  SDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED           = 'SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED';
  SDL_HINT_JOYSTICK_HIDAPI                              = 'SDL_JOYSTICK_HIDAPI';
  SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS             = 'SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS';
  SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE                     = 'SDL_JOYSTICK_HIDAPI_GAMECUBE';
  SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE        = 'SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE';
  SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS                     = 'SDL_JOYSTICK_HIDAPI_JOY_CONS';
  SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED              = 'SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED';
  SDL_HINT_JOYSTICK_HIDAPI_LUNA                         = 'SDL_JOYSTICK_HIDAPI_LUNA';
  SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC             = 'SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC';
  SDL_HINT_JOYSTICK_HIDAPI_PS3                          = 'SDL_JOYSTICK_HIDAPI_PS3';
  SDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER           = 'SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER';
  SDL_HINT_JOYSTICK_HIDAPI_PS4                          = 'SDL_JOYSTICK_HIDAPI_PS4';
  SDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL          = 'SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL';
  SDL_HINT_JOYSTICK_HIDAPI_PS5                          = 'SDL_JOYSTICK_HIDAPI_PS5';
  SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED               = 'SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_SHIELD                       = 'SDL_JOYSTICK_HIDAPI_SHIELD';
  SDL_HINT_JOYSTICK_HIDAPI_STADIA                       = 'SDL_JOYSTICK_HIDAPI_STADIA';
  SDL_HINT_JOYSTICK_HIDAPI_STEAM                        = 'SDL_JOYSTICK_HIDAPI_STEAM';
  SDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED               = 'SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED';
  SDL_HINT_JOYSTICK_HIDAPI_STEAMDECK                    = 'SDL_JOYSTICK_HIDAPI_STEAMDECK';
  SDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI                   = 'SDL_JOYSTICK_HIDAPI_STEAM_HORI';
  SDL_HINT_JOYSTICK_HIDAPI_SWITCH                       = 'SDL_JOYSTICK_HIDAPI_SWITCH';
  SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED              = 'SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED';
  SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED            = 'SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS            = 'SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS';
  SDL_HINT_JOYSTICK_HIDAPI_WII                          = 'SDL_JOYSTICK_HIDAPI_WII';
  SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED               = 'SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX                         = 'SDL_JOYSTICK_HIDAPI_XBOX';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_360                     = 'SDL_JOYSTICK_HIDAPI_XBOX_360';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED          = 'SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS            = 'SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE                     = 'SDL_JOYSTICK_HIDAPI_XBOX_ONE';
  SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED            = 'SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED';
  SDL_HINT_JOYSTICK_IOKIT                               = 'SDL_JOYSTICK_IOKIT';
  SDL_HINT_JOYSTICK_LINUX_CLASSIC                       = 'SDL_JOYSTICK_LINUX_CLASSIC';
  SDL_HINT_JOYSTICK_LINUX_DEADZONES                     = 'SDL_JOYSTICK_LINUX_DEADZONES';
  SDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS                  = 'SDL_JOYSTICK_LINUX_DIGITAL_HATS';
  SDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES                 = 'SDL_JOYSTICK_LINUX_HAT_DEADZONES';
  SDL_HINT_JOYSTICK_MFI                                 = 'SDL_JOYSTICK_MFI';
  SDL_HINT_JOYSTICK_RAWINPUT                            = 'SDL_JOYSTICK_RAWINPUT';
  SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT           = 'SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT';
  SDL_HINT_JOYSTICK_ROG_CHAKRAM                         = 'SDL_JOYSTICK_ROG_CHAKRAM';
  SDL_HINT_JOYSTICK_THREAD                              = 'SDL_JOYSTICK_THREAD';
  SDL_HINT_JOYSTICK_THROTTLE_DEVICES                    = 'SDL_JOYSTICK_THROTTLE_DEVICES';
  SDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED           = 'SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED';
  SDL_HINT_JOYSTICK_WGI                                 = 'SDL_JOYSTICK_WGI';
  SDL_HINT_JOYSTICK_WHEEL_DEVICES                       = 'SDL_JOYSTICK_WHEEL_DEVICES';
  SDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED              = 'SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED';
  SDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES               = 'SDL_JOYSTICK_ZERO_CENTERED_DEVICES';
  SDL_HINT_JOYSTICK_HAPTIC_AXES                         = 'SDL_JOYSTICK_HAPTIC_AXES';
  SDL_HINT_KEYCODE_OPTIONS                              = 'SDL_KEYCODE_OPTIONS';
  SDL_HINT_KMSDRM_DEVICE_INDEX                          = 'SDL_KMSDRM_DEVICE_INDEX';
  SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER                    = 'SDL_KMSDRM_REQUIRE_DRM_MASTER';
  SDL_HINT_LOGGING                                      = 'SDL_LOGGING';
  SDL_HINT_MAC_BACKGROUND_APP                           = 'SDL_MAC_BACKGROUND_APP';
  SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK           = 'SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK';
  SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH                    = 'SDL_MAC_OPENGL_ASYNC_DISPATCH';
  SDL_HINT_MAC_OPTION_AS_ALT                            = 'SDL_MAC_OPTION_AS_ALT';
  SDL_HINT_MAC_SCROLL_MOMENTUM                          = 'SDL_MAC_SCROLL_MOMENTUM';
  SDL_HINT_MAIN_CALLBACK_RATE                           = 'SDL_MAIN_CALLBACK_RATE';
  SDL_HINT_MOUSE_AUTO_CAPTURE                           = 'SDL_MOUSE_AUTO_CAPTURE';
  SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS                    = 'SDL_MOUSE_DOUBLE_CLICK_RADIUS';
  SDL_HINT_MOUSE_DOUBLE_CLICK_TIME                      = 'SDL_MOUSE_DOUBLE_CLICK_TIME';
  SDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR                  = 'SDL_MOUSE_DEFAULT_SYSTEM_CURSOR';
  SDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE             = 'SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE';
  SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH                     = 'SDL_MOUSE_FOCUS_CLICKTHROUGH';
  SDL_HINT_MOUSE_NORMAL_SPEED_SCALE                     = 'SDL_MOUSE_NORMAL_SPEED_SCALE';
  SDL_HINT_MOUSE_RELATIVE_MODE_CENTER                   = 'SDL_MOUSE_RELATIVE_MODE_CENTER';
  SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE                   = 'SDL_MOUSE_RELATIVE_SPEED_SCALE';
  SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE                  = 'SDL_MOUSE_RELATIVE_SYSTEM_SCALE';
  SDL_HINT_MOUSE_RELATIVE_WARP_MOTION                   = 'SDL_MOUSE_RELATIVE_WARP_MOTION';
  SDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE                = 'SDL_MOUSE_RELATIVE_CURSOR_VISIBLE';
  SDL_HINT_MOUSE_TOUCH_EVENTS                           = 'SDL_MOUSE_TOUCH_EVENTS';
  SDL_HINT_MUTE_CONSOLE_KEYBOARD                        = 'SDL_MUTE_CONSOLE_KEYBOARD';
  SDL_HINT_NO_SIGNAL_HANDLERS                           = 'SDL_NO_SIGNAL_HANDLERS';
  SDL_HINT_OPENGL_LIBRARY                               = 'SDL_OPENGL_LIBRARY';
  SDL_HINT_EGL_LIBRARY                                  = 'SDL_EGL_LIBRARY';
  SDL_HINT_OPENGL_ES_DRIVER                             = 'SDL_OPENGL_ES_DRIVER';
  SDL_HINT_OPENVR_LIBRARY                               = 'SDL_OPENVR_LIBRARY';
  SDL_HINT_ORIENTATIONS                                 = 'SDL_ORIENTATIONS';
  SDL_HINT_POLL_SENTINEL                                = 'SDL_POLL_SENTINEL';
  SDL_HINT_PREFERRED_LOCALES                            = 'SDL_PREFERRED_LOCALES';
  SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE                    = 'SDL_QUIT_ON_LAST_WINDOW_CLOSE';
  SDL_HINT_RENDER_DIRECT3D_THREADSAFE                   = 'SDL_RENDER_DIRECT3D_THREADSAFE';
  SDL_HINT_RENDER_DIRECT3D11_DEBUG                      = 'SDL_RENDER_DIRECT3D11_DEBUG';
  SDL_HINT_RENDER_VULKAN_DEBUG                          = 'SDL_RENDER_VULKAN_DEBUG';
  SDL_HINT_RENDER_GPU_DEBUG                             = 'SDL_RENDER_GPU_DEBUG';
  SDL_HINT_RENDER_GPU_LOW_POWER                         = 'SDL_RENDER_GPU_LOW_POWER';
  SDL_HINT_RENDER_DRIVER                                = 'SDL_RENDER_DRIVER';
  SDL_HINT_RENDER_LINE_METHOD                           = 'SDL_RENDER_LINE_METHOD';
  SDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE         = 'SDL_RENDER_METAL_PREFER_LOW_POWER_DEVICE';
  SDL_HINT_RENDER_VSYNC                                 = 'SDL_RENDER_VSYNC';
  SDL_HINT_RETURN_KEY_HIDES_IME                         = 'SDL_RETURN_KEY_HIDES_IME';
  SDL_HINT_ROG_GAMEPAD_MICE                             = 'SDL_ROG_GAMEPAD_MICE';
  SDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED                    = 'SDL_ROG_GAMEPAD_MICE_EXCLUDED';
  SDL_HINT_RPI_VIDEO_LAYER                              = 'SDL_RPI_VIDEO_LAYER';
  SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME            = 'SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME';
  SDL_HINT_SHUTDOWN_DBUS_ON_QUIT                        = 'SDL_SHUTDOWN_DBUS_ON_QUIT';
  SDL_HINT_STORAGE_TITLE_DRIVER                         = 'SDL_STORAGE_TITLE_DRIVER';
  SDL_HINT_STORAGE_USER_DRIVER                          = 'SDL_STORAGE_USER_DRIVER';
  SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL          = 'SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL';
  SDL_HINT_THREAD_PRIORITY_POLICY                       = 'SDL_THREAD_PRIORITY_POLICY';
  SDL_HINT_TIMER_RESOLUTION                             = 'SDL_TIMER_RESOLUTION';
  SDL_HINT_TOUCH_MOUSE_EVENTS                           = 'SDL_TOUCH_MOUSE_EVENTS';
  SDL_HINT_TRACKPAD_IS_TOUCH_ONLY                       = 'SDL_TRACKPAD_IS_TOUCH_ONLY';
  SDL_HINT_TV_REMOTE_AS_JOYSTICK                        = 'SDL_TV_REMOTE_AS_JOYSTICK';
  SDL_HINT_VIDEO_ALLOW_SCREENSAVER                      = 'SDL_VIDEO_ALLOW_SCREENSAVER';
  SDL_HINT_VIDEO_DISPLAY_PRIORITY                       = 'SDL_VIDEO_DISPLAY_PRIORITY';
  SDL_HINT_VIDEO_DOUBLE_BUFFER                          = 'SDL_VIDEO_DOUBLE_BUFFER';
  SDL_HINT_VIDEO_DRIVER                                 = 'SDL_VIDEO_DRIVER';
  SDL_HINT_VIDEO_DUMMY_SAVE_FRAMES                      = 'SDL_VIDEO_DUMMY_SAVE_FRAMES';
  SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK          = 'SDL_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK';
  SDL_HINT_VIDEO_FORCE_EGL                              = 'SDL_VIDEO_FORCE_EGL';
  SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES                  = 'SDL_VIDEO_MAC_FULLSCREEN_SPACES';
  SDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY         = 'SDL_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY';
  SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS                 = 'SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS';
  SDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES                  = 'SDL_VIDEO_OFFSCREEN_SAVE_FRAMES';
  SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS                 = 'SDL_VIDEO_SYNC_WINDOW_OPERATIONS';
  SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR                 = 'SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR';
  SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION                 = 'SDL_VIDEO_WAYLAND_MODE_EMULATION';
  SDL_HINT_VIDEO_WAYLAND_MODE_SCALING                   = 'SDL_VIDEO_WAYLAND_MODE_SCALING';
  SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR                = 'SDL_VIDEO_WAYLAND_PREFER_LIBDECOR';
  SDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY               = 'SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY';
  SDL_HINT_VIDEO_WIN_D3DCOMPILER                        = 'SDL_VIDEO_WIN_D3DCOMPILER';
  SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR           = 'SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR';
  SDL_HINT_VIDEO_X11_NET_WM_PING                        = 'SDL_VIDEO_X11_NET_WM_PING';
  SDL_HINT_VIDEO_X11_NODIRECTCOLOR                      = 'SDL_VIDEO_X11_NODIRECTCOLOR';
  SDL_HINT_VIDEO_X11_SCALING_FACTOR                     = 'SDL_VIDEO_X11_SCALING_FACTOR';
  SDL_HINT_VIDEO_X11_VISUALID                           = 'SDL_VIDEO_X11_VISUALID';
  SDL_HINT_VIDEO_X11_WINDOW_VISUALID                    = 'SDL_VIDEO_X11_WINDOW_VISUALID';
  SDL_HINT_VIDEO_X11_XRANDR                             = 'SDL_VIDEO_X11_XRANDR';
  SDL_HINT_VITA_ENABLE_BACK_TOUCH                       = 'SDL_VITA_ENABLE_BACK_TOUCH';
  SDL_HINT_VITA_ENABLE_FRONT_TOUCH                      = 'SDL_VITA_ENABLE_FRONT_TOUCH';
  SDL_HINT_VITA_MODULE_PATH                             = 'SDL_VITA_MODULE_PATH';
  SDL_HINT_VITA_PVR_INIT                                = 'SDL_VITA_PVR_INIT';
  SDL_HINT_VITA_RESOLUTION                              = 'SDL_VITA_RESOLUTION';
  SDL_HINT_VITA_PVR_OPENGL                              = 'SDL_VITA_PVR_OPENGL';
  SDL_HINT_VITA_TOUCH_MOUSE_DEVICE                      = 'SDL_VITA_TOUCH_MOUSE_DEVICE';
  SDL_HINT_VULKAN_DISPLAY                               = 'SDL_VULKAN_DISPLAY';
  SDL_HINT_VULKAN_LIBRARY                               = 'SDL_VULKAN_LIBRARY';
  SDL_HINT_WAVE_FACT_CHUNK                              = 'SDL_WAVE_FACT_CHUNK';
  SDL_HINT_WAVE_CHUNK_LIMIT                             = 'SDL_WAVE_CHUNK_LIMIT';
  SDL_HINT_WAVE_RIFF_CHUNK_SIZE                         = 'SDL_WAVE_RIFF_CHUNK_SIZE';
  SDL_HINT_WAVE_TRUNCATION                              = 'SDL_WAVE_TRUNCATION';
  SDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED                  = 'SDL_WINDOW_ACTIVATE_WHEN_RAISED';
  SDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN                   = 'SDL_WINDOW_ACTIVATE_WHEN_SHOWN';
  SDL_HINT_WINDOW_ALLOW_TOPMOST                         = 'SDL_WINDOW_ALLOW_TOPMOST';
  SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN      = 'SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN';
  SDL_HINT_WINDOWS_CLOSE_ON_ALT_F4                      = 'SDL_WINDOWS_CLOSE_ON_ALT_F4';
  SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS                = 'SDL_WINDOWS_ENABLE_MENU_MNEMONICS';
  SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP                   = 'SDL_WINDOWS_ENABLE_MESSAGELOOP';
  SDL_HINT_WINDOWS_GAMEINPUT                            = 'SDL_WINDOWS_GAMEINPUT';
  SDL_HINT_WINDOWS_RAW_KEYBOARD                         = 'SDL_WINDOWS_RAW_KEYBOARD';
  SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL               = 'SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL';
  SDL_HINT_WINDOWS_INTRESOURCE_ICON                     = 'SDL_WINDOWS_INTRESOURCE_ICON';
  SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL               = 'SDL_WINDOWS_INTRESOURCE_ICON_SMALL';
  SDL_HINT_WINDOWS_USE_D3D9EX                           = 'SDL_WINDOWS_USE_D3D9EX';
  SDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE                = 'SDL_WINDOWS_ERASE_BACKGROUND_MODE';
  SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT                  = 'SDL_X11_FORCE_OVERRIDE_REDIRECT';
  SDL_HINT_X11_WINDOW_TYPE                              = 'SDL_X11_WINDOW_TYPE';
  SDL_HINT_X11_XCB_LIBRARY                              = 'SDL_X11_XCB_LIBRARY';
  SDL_HINT_XINPUT_ENABLED                               = 'SDL_XINPUT_ENABLED';
  SDL_HINT_ASSERT                                       = 'SDL_ASSERT';
  SDL_HINT_PEN_MOUSE_EVENTS                             = 'SDL_PEN_MOUSE_EVENTS';
  SDL_HINT_PEN_TOUCH_EVENTS                             = 'SDL_PEN_TOUCH_EVENTS';

type
  TSDL_HintPriority           = (
                                  SDL_HINT_DEFAULT,
                                  SDL_HINT_NORMAL,
                                  SDL_HINT_OVERRIDE
                                );
  PSDL_HintPriority           = ^TSDL_HintPriority;

  /// <summary>
  ///  Set a hint with a specific priority.
  /// </summary>
  TSDL_SetHintWithPriority    = function (const Aname: PAnsiChar; const Avalue: PAnsiChar; Apriority: TSDL_HintPriority): bool; cdecl;

  /// <summary>
  ///  Set a hint with normal priority.
  /// </summary>
  TSDL_SetHint                = function (const Aname: PAnsiChar; const Avalue:PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Reset a hint to the default value.
  /// </summary>
  TSDL_ResetHint              = function (const Aname: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Reset all hints to the default values.
  /// </summary>
  TSDL_ResetHints             = procedure (); cdecl;

  /// <summary>
  ///  Get the value of a hint.
  /// </summary>
  TSDL_GetHint                = function (const Aname: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the boolean value of a hint variable.
  /// </summary>
  TSDL_GetHintBoolean         = function (const Aname: PAnsiChar; Adefault_value: bool): bool; cdecl;

  /// <summary>
  ///  A callback used to send notifications of hint value changes.
  /// </summary>
  TSDL_HintCallback           = procedure (Auserdata: Pointer; const Aname: PAnsiChar; const AoldValue: PAnsiChar; const AnewValue: PAnsiChar); cdecl;

  /// <summary>
  ///  Add a function to watch a particular hint.
  /// </summary>
  TSDL_AddHintCallback        = function (const Aname: PAnsiChar; Acallback: TSDL_HintCallback; Auserdata: Pointer): bool; cdecl;

  /// <summary>
  ///  Remove a function watching a particular hint.
  /// </summary>
  TSDL_RemoveHintCallback     = procedure (const Aname: PAnsiChar; Acallback: TSDL_HintCallback; Auserdata: Pointer); cdecl;

var
  SDL_SetHintWithPriority     : TSDL_SetHintWithPriority;
  SDL_SetHint                 : TSDL_SetHint;
  SDL_ResetHint               : TSDL_ResetHint;
  SDL_ResetHints              : TSDL_ResetHints;
  SDL_GetHint                 : TSDL_GetHint;
  SDL_GetHintBoolean          : TSDL_GetHintBoolean;
  SDL_AddHintCallback         : TSDL_AddHintCallback;
  SDL_RemoveHintCallback      : TSDL_RemoveHintCallback;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_SetHintWithPriority    := BindProcedure(AHandle, 'SDL_SetHintWithPriority');
  @SDL_SetHint                := BindProcedure(AHandle, 'SDL_SetHint');
  @SDL_ResetHint              := BindProcedure(AHandle, 'SDL_ResetHint');
  @SDL_ResetHints             := BindProcedure(AHandle, 'SDL_ResetHints');
  @SDL_GetHint                := BindProcedure(AHandle, 'SDL_GetHint');
  @SDL_GetHintBoolean         := BindProcedure(AHandle, 'SDL_GetHintBoolean');
  @SDL_AddHintCallback        := BindProcedure(AHandle, 'SDL_AddHintCallback');
  @SDL_RemoveHintCallback     := BindProcedure(AHandle, 'SDL_RemoveHintCallback');
end;

end.
