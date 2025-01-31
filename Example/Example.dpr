program Example;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Main in 'Forms\Form.Main.pas' {Form1},
  SDL_assert in '..\Source\SDL_assert.pas',
  SDL.Types in '..\Source\SDL.Types.pas',
  SDL_asyncio in '..\Source\SDL_asyncio.pas',
  SDL_atomic in '..\Source\SDL_atomic.pas',
  SDL_audio in '..\Source\SDL_audio.pas',
  SDL_properties in '..\Source\SDL_properties.pas',
  SDL_iostream in '..\Source\SDL_iostream.pas',
  SDL_bits in '..\Source\SDL_bits.pas',
  SDL_blendmode in '..\Source\SDL_blendmode.pas',
  SDL_camera in '..\Source\SDL_camera.pas',
  SDL_pixels in '..\Source\SDL_pixels.pas',
  SDL_surface in '..\Source\SDL_surface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
