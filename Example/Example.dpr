program Example;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Main in 'Forms\Form.Main.pas' {Form1},
  SDL.Types in '..\Source\SDL.Types.pas',
  SDL_assert in '..\Source\SDL_assert.pas',
  SDL_asyncio in '..\Source\SDL_asyncio.pas',
  SDL_atomic in '..\Source\SDL_atomic.pas',
  SDL_audio in '..\Source\SDL_audio.pas',
  SDL_bits in '..\Source\SDL_bits.pas',
  SDL_blendmode in '..\Source\SDL_blendmode.pas',
  SDL_camera in '..\Source\SDL_camera.pas',
  SDL_clipboard in '..\Source\SDL_clipboard.pas',
  SDL_error in '..\Source\SDL_error.pas',
  SDL_events in '..\Source\SDL_events.pas',
  SDL_inits in '..\Source\SDL_inits.pas',
  SDL_iostream in '..\Source\SDL_iostream.pas',
  SDL_loadso in '..\Source\SDL_loadso.pas',
  SDL_pixels in '..\Source\SDL_pixels.pas',
  SDL_properties in '..\Source\SDL_properties.pas',
  SDL_rect in '..\Source\SDL_rect.pas',
  SDL_stdinc in '..\Source\SDL_stdinc.pas',
  SDL_surface in '..\Source\SDL_surface.pas',
  SDL_video in '..\Source\SDL_video.pas',
  SDL_keycode in '..\Source\SDL_keycode.pas',
  SDL_scancode in '..\Source\SDL_scancode.pas',
  SDL_keyboard in '..\Source\SDL_keyboard.pas',
  SDL_mouse in '..\Source\SDL_mouse.pas',
  SDL_joystick in '..\Source\SDL_joystick.pas',
  SDL_power in '..\Source\SDL_power.pas',
  SDL_sensor in '..\Source\SDL_sensor.pas',
  SDL_guid in '..\Source\SDL_guid.pas',
  SDL_touch in '..\Source\SDL_touch.pas',
  SDL_pen in '..\Source\SDL_pen.pas',
  SDL_vulkan in '..\Source\SDL_vulkan.pas',
  SDL_metal in '..\Source\SDL_metal.pas',
  SDL_locale in '..\Source\SDL_locale.pas',
  SDL_logs in '..\Source\SDL_logs.pas',
  SDL_mains in '..\Source\SDL_mains.pas',
  SDL_messagebox in '..\Source\SDL_messagebox.pas',
  SDL_misc in '..\Source\SDL_misc.pas',
  SDL_mutex in '..\Source\SDL_mutex.pas',
  SDL_thread in '..\Source\SDL_thread.pas',
  SDL_platform in '..\Source\SDL_platform.pas',
  SDL_process in '..\Source\SDL_process.pas',
  SDL_render in '..\Source\SDL_render.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
