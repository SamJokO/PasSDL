unit Form.Audio;

interface

uses
  SDL.init, SDL.audio, SDL.stdinc,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormAudio = class(TForm)
    btnPlay: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
  private
    { Private declarations }

    FDeviceID                   : TSDL_AudioDeviceID;
    FAudioSpec                  : TSDL_AudioSpec;
  public
    { Public declarations }
  end;

var
  FormAudio: TFormAudio;

implementation

{$R *.fmx}

procedure PostmixCallback (AUserData: Pointer; const ASpec: PSDL_AudioSpec; ABuffer: float; ABuflen: int); cdecl;
begin

end;

procedure TFormAudio.btnPlayClick(Sender: TObject);
var
  vAudioSpec                  : TSDL_AudioSpec;
begin
//
  vAudioSpec.format           := SDL_AUDIO_S16;
  vAudioSpec.channels         := 2;
  vAudioSpec.freq             := 44100;
end;

procedure TFormAudio.FormCreate(Sender: TObject);
begin
  SDL_init(SDL_INIT_AUDIO);
  SDL_InitSubSystem(SDL_INIT_AUDIO);

  FAudioSpec.format           := SDL_AUDIO_S16;
  FAudioSpec.channels         := 2;
  FAudioSpec.freq             := 44100;

  FDeviceID                   := SDL_OpenAudioDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, @FAudioSpec);

  if SDL_SetAudioPostmixCallback(FDeviceID, PostmixCallback, nil) = false then
  begin
    ShowMessage('err');
  end;
end;

end.
