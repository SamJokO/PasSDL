unit Form.Audio;

interface

uses
  SDL.init, SDL.audio, SDL.stdinc,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TFormAudio = class(TForm)
    btnPlay: TButton;
    btnRecord: TButton;
    btnStop: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnRecordClick(Sender: TObject);
  private
    { Private declarations }

    FDeviceID                   : TSDL_AudioDeviceID;
    FAudioSpec                  : TSDL_AudioSpec;
    FWaveBuffer                 : PUint8;
    FWaveLength                 : Uint32;

    FRecordBuffer               : PUint8;
    FRecordLength               : Uint32;

    FStream                     : PSDL_AudioStream;

    procedure                   WriteLog(const AMessage: string);
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

procedure loadStream(AUserData: Pointer; AStream: PSDL_AudioStream; AAdditional_amount: int; ATotal_amount: int); cdecl;
begin

end;

procedure TFormAudio.btnPlayClick(Sender: TObject);
var
  vAudioSpec                  : TSDL_AudioSpec;
begin
  FWaveBuffer                 := nil;

{$IF DEFINED(MSWINDOWS)}
  if SDL_LoadWAV('..\..\..\Media\sample.wav', FAudioSpec, FWaveBuffer, FWaveLength) = False then
{$ELSE}
  if SDL_LoadWAV('sample.wav', FAudioSpec, FWaveBuffer, FWaveLength) = False then
{$ENDIF}
  begin
    ShowMessage('err load');
    Exit;
  end;

  FStream := SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, @FAudioSpec, nil, nil);


  SDL_ResumeAudioStreamDevice(FStream);

  SDL_PutAudioStreamData(FStream, FWaveBuffer, FWaveLength);


end;

procedure TFormAudio.btnRecordClick(Sender: TObject);
var
  vCount                      : int;
  vDevices                    : PSDL_AudioDeviceID;
  vDevice                     : PSDL_AudioDeviceID;
  i                           : Integer;
  vName                       : AnsiString;
  vSamplerate                 : int;

  vRecordSpec                 : TSDL_AudioSpec;

  vAudioStream                : PSDL_AudioStream;
begin

//  SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_RECORDING, @FAudioSpec, loadStream, nil);
//
//  Exit;

  vCount                      := 0;

  vDevices                    := SDL_GetAudioRecordingDevices(vCount);
  if vCount = 0 then
  begin
    ShowMessage('Recording device not found');
    Exit;
  end;

  vRecordSpec.format          := SDL_AUDIO_F32;
  vRecordSpec.channels        := 2;
  vRecordSpec.freq            := 48000;

  for i := 0 to vCount - 1 do
  begin
    vDevice                     := vDevices;
    vName                       := SDL_GetAudioDeviceName(vDevice^);
    WriteLog((i + 1).ToString + '. devices name; ' + vName);
    if not SDL_GetAudioDeviceFormat(vDevice^, vRecordSpec, vSamplerate) then
      WriteLog('Can not get info');

    Inc(vDevices);
  end;





end;

procedure TFormAudio.btnStopClick(Sender: TObject);
begin
  SDL_PauseAudioStreamDevice(FStream);
  SDL_DestroyAudioStream(FStream);
end;

procedure TFormAudio.FormCreate(Sender: TObject);
begin
  SDL_init(SDL_INIT_AUDIO);
  SDL_InitSubSystem(SDL_INIT_AUDIO);
end;

procedure TFormAudio.WriteLog(const AMessage: string);
begin
  Memo1.Lines.BeginUpdate;
  try
    Memo1.Lines.Add(Format('[%s] %s', [DateTimeToStr(Now), AMessage]));
    Memo1.GoToTextEnd;
  finally
    Memo1.Lines.EndUpdate;
  end;
end;

end.
