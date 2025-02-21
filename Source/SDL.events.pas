unit SDL.events;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL_keyboard,
  SDL_keycode,
  SDL_scancode,
  SDL_mouse,
  SDL_joystick,
  SDL_power,
  SDL.camera,
  SDL_touch,
  SDL_pen,
  SDL_sensor,
  SDL.audio,
  SDL_video;

type
  TSDL_EventType              = (
                                  SDL_EVENT_FIRST     = 0,     { Unused (do not remove) }

                                  { Application events }
                                  SDL_EVENT_QUIT           = $100, { User-requested quit }

                                  { These application events have special meaning on iOS and Android, see README-ios.md and README-android.md for details }
                                  SDL_EVENT_TERMINATING,      { The application is being terminated by the OS. This event must be handled in a callback set with SDL_AddEventWatch().
                                                                   Called on iOS in applicationWillTerminate()
                                                                   Called on Android in onDestroy()
                                                              }
                                  SDL_EVENT_LOW_MEMORY,       { The application is low on memory, free memory if possible. This event must be handled in a callback set with SDL_AddEventWatch().
                                                                   Called on iOS in applicationDidReceiveMemoryWarning()
                                                                   Called on Android in onTrimMemory()
                                                              }
                                  SDL_EVENT_WILL_ENTER_BACKGROUND, { The application is about to enter the background. This event must be handled in a callback set with SDL_AddEventWatch().
                                                                   Called on iOS in applicationWillResignActive()
                                                                   Called on Android in onPause()
                                                              }
                                  SDL_EVENT_DID_ENTER_BACKGROUND, { The application did enter the background and may not get CPU for some time. This event must be handled in a callback set with SDL_AddEventWatch().
                                                                   Called on iOS in applicationDidEnterBackground()
                                                                   Called on Android in onPause()
                                                              }
                                  SDL_EVENT_WILL_ENTER_FOREGROUND, { The application is about to enter the foreground. This event must be handled in a callback set with SDL_AddEventWatch().
                                                                   Called on iOS in applicationWillEnterForeground()
                                                                   Called on Android in onResume()
                                                              }
                                  SDL_EVENT_DID_ENTER_FOREGROUND, { The application is now interactive. This event must be handled in a callback set with SDL_AddEventWatch().
                                                                   Called on iOS in applicationDidBecomeActive()
                                                                   Called on Android in onResume()
                                                              }

                                  SDL_EVENT_LOCALE_CHANGED,  { The user's locale preferences have changed. }

                                  SDL_EVENT_SYSTEM_THEME_CHANGED, { The system theme changed }

                                  { Display events }
                                  { $150 was SDL_DISPLAYEVENT, reserve the number for sdl2-compat }
                                  SDL_EVENT_DISPLAY_ORIENTATION = $151,   { Display orientation has changed to data1 }
                                  SDL_EVENT_DISPLAY_ADDED,                 { Display has been added to the system }
                                  SDL_EVENT_DISPLAY_REMOVED,               { Display has been removed from the system }
                                  SDL_EVENT_DISPLAY_MOVED,                 { Display has changed position }
                                  SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED,  { Display has changed desktop mode }
                                  SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED,  { Display has changed current mode }
                                  SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED, { Display has changed content scale }
                                  SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION,
                                  SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED,

                                  { Window events }
                                  { $200 was SDL_WINDOWEVENT, reserve the number for sdl2-compat }
                                  { $201 was SDL_EVENT_SYSWM, reserve the number for sdl2-compat }
                                  SDL_EVENT_WINDOW_SHOWN = $202,     { Window has been shown }
                                  SDL_EVENT_WINDOW_HIDDEN,            { Window has been hidden }
                                  SDL_EVENT_WINDOW_EXPOSED,           { Window has been exposed and should be redrawn, and can be redrawn directly from event watchers for this event }
                                  SDL_EVENT_WINDOW_MOVED,             { Window has been moved to data1, data2 }
                                  SDL_EVENT_WINDOW_RESIZED,           { Window has been resized to data1xdata2 }
                                  SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,{ The pixel size of the window has changed to data1xdata2 }
                                  SDL_EVENT_WINDOW_METAL_VIEW_RESIZED,{ The pixel size of a Metal view associated with the window has changed }
                                  SDL_EVENT_WINDOW_MINIMIZED,         { Window has been minimized }
                                  SDL_EVENT_WINDOW_MAXIMIZED,         { Window has been maximized }
                                  SDL_EVENT_WINDOW_RESTORED,          { Window has been restored to normal size and position }
                                  SDL_EVENT_WINDOW_MOUSE_ENTER,       { Window has gained mouse focus }
                                  SDL_EVENT_WINDOW_MOUSE_LEAVE,       { Window has lost mouse focus }
                                  SDL_EVENT_WINDOW_FOCUS_GAINED,      { Window has gained keyboard focus }
                                  SDL_EVENT_WINDOW_FOCUS_LOST,        { Window has lost keyboard focus }
                                  SDL_EVENT_WINDOW_CLOSE_REQUESTED,   { The window manager requests that the window be closed }
                                  SDL_EVENT_WINDOW_HIT_TEST,          { Window had a hit test that wasn't SDL_HITTEST_NORMAL }
                                  SDL_EVENT_WINDOW_ICCPROF_CHANGED,   { The ICC profile of the window's display has changed }
                                  SDL_EVENT_WINDOW_DISPLAY_CHANGED,   { Window has been moved to display data1 }
                                  SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED, { Window display scale has been changed }
                                  SDL_EVENT_WINDOW_SAFE_AREA_CHANGED, { The window safe area has been changed }
                                  SDL_EVENT_WINDOW_OCCLUDED,          { The window has been occluded }
                                  SDL_EVENT_WINDOW_ENTER_FULLSCREEN,  { The window has entered fullscreen mode }
                                  SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,  { The window has left fullscreen mode }
                                  SDL_EVENT_WINDOW_DESTROYED,         { The window with the associated ID is being or has been destroyed. If this message is being handled
                                                                           in an event watcher, the window handle is still valid and can still be used to retrieve any properties
                                                                           associated with the window. Otherwise, the handle has already been destroyed and all resources
                                                                           associated with it are invalid }
                                  SDL_EVENT_WINDOW_HDR_STATE_CHANGED, { Window HDR properties have changed }
                                  SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN,
                                  SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_HDR_STATE_CHANGED,

                                  { Keyboard events }
                                  SDL_EVENT_KEY_DOWN        = $300, { Key pressed }
                                  SDL_EVENT_KEY_UP,                  { Key released }
                                  SDL_EVENT_TEXT_EDITING,            { Keyboard text editing (composition) }
                                  SDL_EVENT_TEXT_INPUT,              { Keyboard text input }
                                  SDL_EVENT_KEYMAP_CHANGED,          { Keymap changed due to a system event such as an
                                                                          input language or keyboard layout change. }
                                  SDL_EVENT_KEYBOARD_ADDED,          { A new keyboard has been inserted into the system }
                                  SDL_EVENT_KEYBOARD_REMOVED,        { A keyboard has been removed }
                                  SDL_EVENT_TEXT_EDITING_CANDIDATES, { Keyboard text editing candidates }

                                  { Mouse events }
                                  SDL_EVENT_MOUSE_MOTION    = $400, { Mouse moved }
                                  SDL_EVENT_MOUSE_BUTTON_DOWN,       { Mouse button pressed }
                                  SDL_EVENT_MOUSE_BUTTON_UP,         { Mouse button released }
                                  SDL_EVENT_MOUSE_WHEEL,             { Mouse wheel motion }
                                  SDL_EVENT_MOUSE_ADDED,             { A new mouse has been inserted into the system }
                                  SDL_EVENT_MOUSE_REMOVED,           { A mouse has been removed }

                                  { Joystick events }
                                  SDL_EVENT_JOYSTICK_AXIS_MOTION  = $600, { Joystick axis motion }
                                  SDL_EVENT_JOYSTICK_BALL_MOTION,          { Joystick trackball motion }
                                  SDL_EVENT_JOYSTICK_HAT_MOTION,           { Joystick hat position change }
                                  SDL_EVENT_JOYSTICK_BUTTON_DOWN,          { Joystick button pressed }
                                  SDL_EVENT_JOYSTICK_BUTTON_UP,            { Joystick button released }
                                  SDL_EVENT_JOYSTICK_ADDED,                { A new joystick has been inserted into the system }
                                  SDL_EVENT_JOYSTICK_REMOVED,              { An opened joystick has been removed }
                                  SDL_EVENT_JOYSTICK_BATTERY_UPDATED,      { Joystick battery level change }
                                  SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,      { Joystick update is complete }

                                  { Gamepad events }
                                  SDL_EVENT_GAMEPAD_AXIS_MOTION  = $650, { Gamepad axis motion }
                                  SDL_EVENT_GAMEPAD_BUTTON_DOWN,          { Gamepad button pressed }
                                  SDL_EVENT_GAMEPAD_BUTTON_UP,            { Gamepad button released }
                                  SDL_EVENT_GAMEPAD_ADDED,                { A new gamepad has been inserted into the system }
                                  SDL_EVENT_GAMEPAD_REMOVED,              { A gamepad has been removed }
                                  SDL_EVENT_GAMEPAD_REMAPPED,             { The gamepad mapping was updated }
                                  SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,        { Gamepad touchpad was touched }
                                  SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,      { Gamepad touchpad finger was moved }
                                  SDL_EVENT_GAMEPAD_TOUCHPAD_UP,          { Gamepad touchpad finger was lifted }
                                  SDL_EVENT_GAMEPAD_SENSOR_UPDATE,        { Gamepad sensor was updated }
                                  SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,      { Gamepad update is complete }
                                  SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,  { Gamepad Steam handle has changed }

                                  { Touch events }
                                  SDL_EVENT_FINGER_DOWN      = $700,
                                  SDL_EVENT_FINGER_UP,
                                  SDL_EVENT_FINGER_MOTION,
                                  SDL_EVENT_FINGER_CANCELED,

                                  { $800, $801, and $802 were the Gesture events from SDL2. Do not reuse these values! sdl2-compat needs them! }

                                  { Clipboard events }
                                  SDL_EVENT_CLIPBOARD_UPDATE = $900, { The clipboard or primary selection changed }

                                  { Drag and drop events }
                                  SDL_EVENT_DROP_FILE        = $1000, { The system requests a file open }
                                  SDL_EVENT_DROP_TEXT,                 { text/plain drag-and-drop event }
                                  SDL_EVENT_DROP_BEGIN,                { A new set of drops is beginning (NULL filename) }
                                  SDL_EVENT_DROP_COMPLETE,             { Current set of drops is now complete (NULL filename) }
                                  SDL_EVENT_DROP_POSITION,             { Position while moving over the window }

                                  { Audio hotplug events }
                                  SDL_EVENT_AUDIO_DEVICE_ADDED = $1100,  { A new audio device is available }
                                  SDL_EVENT_AUDIO_DEVICE_REMOVED,         { An audio device has been removed. }
                                  SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED,  { An audio device's format has been changed by the system. }

                                  { Sensor events }
                                  SDL_EVENT_SENSOR_UPDATE = $1200,     { A sensor was updated }

                                  { Pressure-sensitive pen events }
                                  SDL_EVENT_PEN_PROXIMITY_IN = $1300,  { Pressure-sensitive pen has become available }
                                  SDL_EVENT_PEN_PROXIMITY_OUT,          { Pressure-sensitive pen has become unavailable }
                                  SDL_EVENT_PEN_DOWN,                   { Pressure-sensitive pen touched drawing surface }
                                  SDL_EVENT_PEN_UP,                     { Pressure-sensitive pen stopped touching drawing surface }
                                  SDL_EVENT_PEN_BUTTON_DOWN,            { Pressure-sensitive pen button pressed }
                                  SDL_EVENT_PEN_BUTTON_UP,              { Pressure-sensitive pen button released }
                                  SDL_EVENT_PEN_MOTION,                 { Pressure-sensitive pen is moving on the tablet }
                                  SDL_EVENT_PEN_AXIS,                   { Pressure-sensitive pen angle/pressure/etc changed }

                                  { Camera hotplug events }
                                  SDL_EVENT_CAMERA_DEVICE_ADDED = $1400,  { A new camera device is available }
                                  SDL_EVENT_CAMERA_DEVICE_REMOVED,         { A camera device has been removed. }
                                  SDL_EVENT_CAMERA_DEVICE_APPROVED,        { A camera device has been approved for use by the user. }
                                  SDL_EVENT_CAMERA_DEVICE_DENIED,          { A camera device has been denied for use by the user. }

                                  { Render events }
                                  SDL_EVENT_RENDER_TARGETS_RESET = $2000, { The render targets have been reset and their contents need to be updated }
                                  SDL_EVENT_RENDER_DEVICE_RESET, { The device has been reset and all textures need to be recreated }
                                  SDL_EVENT_RENDER_DEVICE_LOST, { The device has been lost and can't be recovered. }

                                  { Reserved events for private platforms }
                                  SDL_EVENT_PRIVATE0 = $4000,
                                  SDL_EVENT_PRIVATE1,
                                  SDL_EVENT_PRIVATE2,
                                  SDL_EVENT_PRIVATE3,

                                  { Internal events }
                                  SDL_EVENT_POLL_SENTINEL = $7F00, { Signals the end of an event poll cycle }

                                  { Events SDL_EVENT_USER through SDL_EVENT_LAST are for your use,
                                   *  and should be allocated with SDL_RegisterEvents()
                                   }
                                  SDL_EVENT_USER    = $8000,

                                  {
                                   *  This last event is only for bounding internal arrays
                                   }
                                  SDL_EVENT_LAST    = $FFFF,

                                  { This just makes sure the enum is the size of Uint32 }
                                  SDL_EVENT_ENUM_PADDING = $7FFFFFFF
                                );
  PSDL_EventType              = ^TSDL_EventType;

  TSDL_CommonEvent = record
    &type                       : Uint32;
    reserved                    : Uint32;
    timestamp                   : Uint64;
  end;
  PSDL_CommonEvent = ^TSDL_CommonEvent;

  TSDL_DisplayEvent = record
    &type                       : Uint32;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    displayID                   : TSDL_DisplayID;
    data1                       : Sint32;
    data2                       : Sint32;
  end;
  PSDL_DisplayEvent = ^TSDL_DisplayEvent;

  TSDL_WindowEvent = record
    &type                       : Uint32;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    data1                       : Sint32;
    data2                       : Sint32;
  end;
  PSDL_WindowEvent = ^TSDL_WindowEvent;

  TSDL_KeyboardDeviceEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_KeyboardID;
  end;
  PSDL_KeyboardDeviceEvent = ^TSDL_KeyboardDeviceEvent;

  TSDL_KeyboardEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_KeyboardID;
    scancode                    : TSDL_Scancode;
    key                         : TSDL_Keycode;
    &mod                        : TSDL_Keymod;
    raw                         : Uint16;
    down                        : bool;
    &repeat                     : bool;
  end;
  PSDL_KeyboardEvent = ^TSDL_KeyboardEvent;

  TSDL_TextEditingEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    text                        : PAnsiChar;
    start                       : Sint32;
    length                      : Sint32;
  end;
  PSDL_TextEditingEvent = ^TSDL_TextEditingEvent;

  TSDL_TextEditingCandidatesEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    candidates                  : PPAnsiChar;
    num_candidates              : Sint32;
    selected_candidate          : Sint32;
    horizontal                  : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_TextEditingCandidatesEvent = ^TSDL_TextEditingCandidatesEvent;

  TSDL_TextInputEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    text                        : PAnsiChar;
  end;
  PSDL_TextInputEvent = ^TSDL_TextInputEvent;

  TSDL_MouseDeviceEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_MouseID;
  end;
  PSDL_MouseDeviceEvent = ^TSDL_MouseDeviceEvent;

  TSDL_MouseMotionEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_MouseID;
    state                       : TSDL_MouseButtonFlags;
    x                           : float;
    y                           : float;
    xrel                        : float;
    yrel                        : float;
  end;
  PSDL_MouseMotionEvent = ^TSDL_MouseMotionEvent;

  TSDL_MouseButtonEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_MouseID;
    buton                       : Uint8;
    down                        : bool;
    clicks                      : Uint8;
    padding                     : Uint8;
    x                           : float;
    y                           : float;
  end;
  PSDL_MouseButtonEvent = ^TSDL_MouseButtonEvent;

  TSDL_MouseWheelEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_MouseID;
    x                           : float;
    y                           : float;
    direction                   : TSDL_MouseWheelDirection;
    mouse_x                     : float;
    mouse_y                     : float;
  end;
  PSDL_MouseWheelEvent = ^TSDL_MouseWheelEvent;

  TSDL_JoyAxisEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    axis                        : Uint8;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
    value                       : Sint8;
    padding4                    : Uint16;
  end;
  PSDL_JoyAxisEvent = ^TSDL_JoyAxisEvent;

  TSDL_JoyBallEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    ball                        : Uint8;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
    xrel                        : Sint16;
    yrel                        : Sint16;
  end;
  PSDL_JoyBallEvent = ^TSDL_JoyBallEvent;

  TSDL_JoyHatEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    hat                         : Uint8;
    value                       : Uint8;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_JoyHatEvent = ^TSDL_JoyHatEvent;

  TSDL_JoyButtonEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    button                      : Uint8;
    down                        : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_JoyButtonEvent = ^TSDL_JoyButtonEvent;

  TSDL_JoyDeviceEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
  end;
  PSDL_JoyDeviceEvent = ^TSDL_JoyDeviceEvent;

  TSDL_JoyBatteryEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    state                       : TSDL_PowerState;
    percent                     : int;
  end;
  PSDL_JoyBatteryEvent = ^TSDL_JoyBatteryEvent;

  TSDL_GamepadAxisEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    axis                        : Uint8;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
    value                       : Sint16;
    padding4                    : Uint16;
  end;
  PSDL_GamepadAxisEvent = ^TSDL_GamepadAxisEvent;

  TSDL_GamepadButtonEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    button                      : Uint8;
    down                        : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_GamepadButtonEvent = ^TSDL_GamepadButtonEvent;

  TSDL_GamepadDeviceEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
  end;
  PSDL_GamepadDeviceEvent = ^TSDL_GamepadDeviceEvent;

  TSDL_GamepadTouchpadEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    touchpad                    : Sint32;
    finger                      : Sint32;
    x                           : float;
    y                           : float;
    pressure                    : float;
  end;
  PSDL_GamepadTouchpadEvent = ^TSDL_GamepadTouchpadEvent;

  TSDL_GamepadSensorEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_JoystickID;
    sensor                      : Sint32;
    data                        : array[0..2] of float;
    sensor_timestamp            : Uint64;
  end;
  PSDL_GamepadSensorEvent = ^TSDL_GamepadSensorEvent;

  TSDL_AudioDeviceEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_AudioDeviceID;
    recording                   : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_AudioDeviceEvent = ^TSDL_AudioDeviceEvent;

  TSDL_CameraDeviceEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_CameraID;
  end;
  PSDL_CameraDeviceEvent = ^TSDL_CameraDeviceEvent;

  TSDL_RenderEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
  end;
  PSDL_RenderEvent = ^TSDL_RenderEvent;

  TSDL_TouchFingerEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    touchID                     : TSDL_TouchID;
    fingerID                    : TSDL_FingerID;
    x                           : float;
    y                           : float;
    dx                          : float;
    dy                          : float;
    pressure                    : float;
    windowID                    : TSDL_WindowID;
  end;
  PSDL_TouchFingerEvent = ^TSDL_TouchFingerEvent;

  TSDL_PenProximityEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_PenID;
  end;
  PSDL_PenProximityEvent = ^TSDL_PenProximityEvent;

  TSDL_PenMotionEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_PenID;
    pen_state                   : TSDL_PenInputFlags;
    x                           : float;
    y                           : float;
  end;
  PSDL_PenMotionEvent = ^TSDL_PenMotionEvent;

  TSDL_PenTouchEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_PenID;
    pen_state                   : TSDL_PenInputFlags;
    x                           : float;
    y                           : float;
    eraser                      : bool;
    down                        : bool;
  end;
  PSDL_PenTouchEvent = ^TSDL_PenTouchEvent;

  TSDL_PenButtonEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_PenID;
    pen_state                   : TSDL_PenInputFlags;
    x                           : float;
    y                           : float;
    button                      : Uint8;
    down                        : bool;
  end;
  PSDL_PenButtonEvent = ^TSDL_PenButtonEvent;

  TSDL_PenAxisEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    which                       : TSDL_PenID;
    pen_state                   : TSDL_PenInputFlags;
    x                           : float;
    y                           : float;
    axis                        : TSDL_PenAxis;
    value                       : float;
  end;
  PSDL_PenAxisEvent = ^TSDL_PenAxisEvent;

  TSDL_DropEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    x                           : float;
    y                           : float;
    source                      : PAnsiChar;
    data                        : PAnsiChar;
  end;
  PSDL_DropEvent = ^TSDL_DropEvent;

  TSDL_ClipboardEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    owner                       : bool;
    num_mime_types              : Sint32;
    mime_types                  : PPAnsiChar;
  end;
  PSDL_ClipboardEvent = ^TSDL_ClipboardEvent;

  TSDL_SensorEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    which                       : TSDL_SensorID;
    data                        : array[0..5] of float;
    sensor_timestamp            : Uint64;
  end;
  PSDL_SensorEvent = ^TSDL_SensorEvent;

  TSDL_QuitEvent = record
    &type                       : TSDL_EventType;
    reserved                    : Uint32;
    timestamp                   : Uint64;
  end;
  PSDL_QuitEvent = ^TSDL_QuitEvent;

  TSDL_UserEvent = record
    &type                       : Uint32;
    reserved                    : Uint32;
    timestamp                   : Uint64;
    windowID                    : TSDL_WindowID;
    code                        : Sint32;
    data1                       : Pointer;
    data2                       : Pointer;
  end;
  PSDL_UserEvent = ^TSDL_UserEvent;

  TSDL_Event = record
    case Integer of
      0: (&type                   : Uint32);
      1: (common                  : TSDL_CommonEvent);
      2: (display                 : TSDL_DisplayEvent);
      3: (window                  : TSDL_WindowEvent);
      4: (kdevice                 : TSDL_KeyboardDeviceEvent);
      5: (key                     : TSDL_KeyboardEvent);
      6: (edit                    : TSDL_TextEditingEvent);
      7: (edit_candidates         : TSDL_TextEditingCandidatesEvent);
      8: (text                    : TSDL_TextInputEvent);
      9: (mdevice                 : TSDL_MouseDeviceEvent);
      10: (motion                 : TSDL_MouseMotionEvent);
      11: (button                 : TSDL_MouseButtonEvent);
      12: (wheel                  : TSDL_MouseWheelEvent);
      13: (jdevice                : TSDL_JoyDeviceEvent);
      14: (jaxis                  : TSDL_JoyAxisEvent);
      15: (jball                  : TSDL_JoyBallEvent);
      16: (jhat                   : TSDL_JoyHatEvent);
      17: (jbutton                : TSDL_JoyBatteryEvent);
      18: (jbattery               : TSDL_JoyBatteryEvent);
      19: (gdevice                : TSDL_GamepadDeviceEvent);
      20: (gaxis                  : TSDL_GamepadAxisEvent);
      21: (gbutton                : TSDL_GamepadButtonEvent);
      22: (gtouchpad              : TSDL_GamepadTouchpadEvent);
      23: (gsensor                : TSDL_GamepadSensorEvent);
      24: (adevice                : TSDL_AudioDeviceEvent);
      25: (cdevice                : TSDL_CameraDeviceEvent);
      26: (sensor                 : TSDL_SensorEvent);
      27: (quit                   : TSDL_QuitEvent);
      28: (user                   : TSDL_UserEvent);
      29: (tfinger                : TSDL_TouchFingerEvent);
      30: (pproximity             : TSDL_PenProximityEvent);
      31: (ptouch                 : TSDL_PenTouchEvent);
      32: (pmotion                : TSDL_PenMotionEvent);
      33: (pbutton                : TSDL_PenButtonEvent);
      34: (paxis                  : TSDL_PenAxisEvent);
      35: (render                 : TSDL_RenderEvent);
      36: (drop                   : TSDL_DropEvent);
      37: (clipboard              : TSDL_ClipboardEvent);
      38: (padding                : array[0..127] of Uint8);
  end;
  PSDL_Event = ^TSDL_Event;

  /// <summsary>
  ///  Pump the event loop, gathering events from the input devices.
  /// </summary>
  TSDL_PumpEvents             = procedure (); cdecl;

  TSDL_EventAction            = (
                                  SDL_ADDEVENT,
                                  SDL_PEEKEVENT,
                                  SDL_GETEVENT
                                );
  PSDL_EventAction            = ^TSDL_EventAction;

  /// <summsary>
  ///  Check the event queue for messages and optionally return them.
  /// </summary>
  TSDL_PeepEvents             = function (AEvents: PSDL_Event; ANumevents: int; AAction: TSDL_EventAction; AMinType: Uint32; AMaxType: Uint32): int; cdecl;

  /// <summsary>
  ///  Check for the existence of a certain event type in the event queue.
  /// </summary>
  TSDL_HasEvent               = function (AType: Uint32): bool; cdecl;

  /// <summsary>
  ///  Check for the existence of certain event types in the event queue.
  /// </summary>
  TSDL_HasEvents              = function (AMinType: Uint32; AMaxType: Uint32): bool; cdecl;

  /// <summsary>
  ///  Clear events of a specific type from the event queue.
  /// </summary>
  TSDL_FlushEvent             = procedure (AType: Uint32); cdecl;

  /// <summsary>
  ///  Clear events of a range of types from the event queue.
  /// </summary>
  TSDL_FlushEvents            = procedure (AMinType: Uint32; AMaxType: Uint32); cdecl;

  /// <summsary>
  ///  Poll for currently pending events.
  /// </summary>
  TSDL_PollEvent              = function (AEvent: PSDL_Event): bool; cdecl;

  /// <summsary>
  ///  Wait indefinitely for the next available event.
  /// </summary>
  TSDL_WaitEvent              = function (AEvent: PSDL_Event): bool; cdecl;

  /// <summsary>
  ///  Wait until the specified timeout (in milliseconds) for the next available
  ///  event.
  /// </summary>
  TSDL_WaitEventTimeout       = function (AEvent: PSDL_Event; ATimoutMS: Sint32): bool; cdecl;

  /// <summsary>
  ///  Add an event to the event queue.
  /// </summary>
  TSDL_PushEvent              = function (AEvent: PSDL_Event): bool; cdecl;

  /// <summsary>
  ///  A function pointer used for callbacks that watch the event queue.
  /// </summary>
  TSDL_EventFilter            = function (AUserData: Pointer; AEvent: PSDL_Event): bool; cdecl;

  /// <summsary>
  ///  Set up a filter to process all events before they are added to the internal
  ///  event queue.
  /// </summary>
  TSDL_SetEventFilter         = procedure (AFilter: TSDL_EventFilter; AUserData: Pointer); cdecl;

  /// <summsary>
  ///  Query the current event filter.
  /// </summary>
  TSDL_GetEventFilter         = function (var AFilter: TSDL_EventFilter; var AUserData: Pointer): bool; cdecl;

  /// <summsary>
  ///  Add a callback to be triggered when an event is added to the event queue.
  /// </summary>
  TSDL_AddEventWatch          = function (AFilter: TSDL_EventFilter; AUserData: Pointer): bool; cdecl;

  /// <summsary>
  ///  Remove an event watch callback added with SDL_AddEventWatch().
  /// </summary>
  TSDL_RemoveEventWatch       = procedure (AFilter: TSDL_EventFilter; AUserData: Pointer); cdecl;

  /// <summsary>
  ///  Run a specific filter function on the current event queue, removing any
  ///  events for which the filter returns false.
  /// </summary>
  TSDL_FilterEvents           = procedure (AFilter: TSDL_EventFilter; AUserData: Pointer); cdecl;

  /// <summsary>
  ///  Set the state of processing events by type.
  /// </summary>
  TSDL_SetEventEnabled        = procedure (AType: Uint32; AEnabled: bool); cdecl;

  /// <summsary>
  ///  Query the state of processing events by type.
  /// </summary>
  TSDL_EventEnabled           = function (AType: Uint32): bool; cdecl;

  /// <summsary>
  ///  Allocate a set of user-defined events, and return the beginning event
  ///  number for that set of events.
  /// </summary>
  TSDL_RegisterEvents         = function (ANumEvents: int): Uint32; cdecl;

  /// <summsary>
  ///  Get window associated with an event.
  /// </summary>
  TSDL_GetWindowFromEvent     = function (const AEvent: PSDL_Event): PSDL_Window; cdecl;

var
  SDL_PumpEvents              : TSDL_PumpEvents;
  SDL_PeepEvents              : TSDL_PeepEvents;
  SDL_HasEvent                : TSDL_HasEvent;
  SDL_HasEvents               : TSDL_HasEvents;
  SDL_FlushEvent              : TSDL_FlushEvent;
  SDL_FlushEvents             : TSDL_FlushEvents;
  SDL_PollEvent               : TSDL_PollEvent;
  SDL_WaitEvent               : TSDL_WaitEvent;
  SDL_WaitEventTimeout        : TSDL_WaitEventTimeout;
  SDL_PushEvent               : TSDL_PushEvent;
  SDL_SetEventFilter          : TSDL_SetEventFilter;
  SDL_GetEventFilter          : TSDL_GetEventFilter;
  SDL_AddEventWatch           : TSDL_AddEventWatch;
  SDL_RemoveEventWatch        : TSDL_RemoveEventWatch;
  SDL_FilterEvents            : TSDL_FilterEvents;
  SDL_SetEventEnabled         : TSDL_SetEventEnabled;
  SDL_EventEnabled            : TSDL_EventEnabled;
  SDL_RegisterEvents          : TSDL_RegisterEvents;
  SDL_GetWindowFromEvent      : TSDL_GetWindowFromEvent;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_PumpEvents             := BindProcedure(AHandle, 'SDL_PumpEvents');
  @SDL_PeepEvents             := BindProcedure(AHandle, 'SDL_PeepEvents');
  @SDL_HasEvent               := BindProcedure(AHandle, 'SDL_HasEvent');
  @SDL_HasEvents              := BindProcedure(AHandle, 'SDL_HasEvents');
  @SDL_FlushEvent             := BindProcedure(AHandle, 'SDL_FlushEvent');
  @SDL_FlushEvents            := BindProcedure(AHandle, 'SDL_FlushEvents');
  @SDL_PollEvent              := BindProcedure(AHandle, 'SDL_PollEvent');
  @SDL_WaitEvent              := BindProcedure(AHandle, 'SDL_WaitEvent');
  @SDL_WaitEventTimeout       := BindProcedure(AHandle, 'SDL_WaitEventTimeout');
  @SDL_PushEvent              := BindProcedure(AHandle, 'SDL_PushEvent');
  @SDL_SetEventFilter         := BindProcedure(AHandle, 'SDL_SetEventFilter');
  @SDL_GetEventFilter         := BindProcedure(AHandle, 'SDL_GetEventFilter');
  @SDL_AddEventWatch          := BindProcedure(AHandle, 'SDL_AddEventWatch');
  @SDL_RemoveEventWatch       := BindProcedure(AHandle, 'SDL_RemoveEventWatch');
  @SDL_FilterEvents           := BindProcedure(AHandle, 'SDL_FilterEvents');
  @SDL_SetEventEnabled        := BindProcedure(AHandle, 'SDL_SetEventEnabled');
  @SDL_EventEnabled           := BindProcedure(AHandle, 'SDL_EventEnabled');
  @SDL_RegisterEvents         := BindProcedure(AHandle, 'SDL_RegisterEvents');
  @SDL_GetWindowFromEvent     := BindProcedure(AHandle, 'SDL_GetWindowFromEvent');
end;

end.
