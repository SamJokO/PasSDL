unit Form.Main;

interface

uses
  SDL.audio,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TFormMain = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    
    procedure                   WriteLog(const AMessage: string);
    
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  SDL.init,
  SDL.PascalEntry,
  SDL.version,
  SDL.stdinc,
  SDL.error,
  SDL.clipboard,
  SDL.camera;

{$R *.fmx}

procedure TFormMain.FormCreate(Sender: TObject);
var
  vCount                      : int;
  vIds                        : PSDL_CameraID;
  vId                         : TSDL_CameraID;    
  i                           : Integer;
  vAudIds                     : PSDL_AudioDeviceID;                                              
  vAudId                      : TSDL_AudioDeviceID; 
  vSize                       : size_t;
  vMimes                      : PPAnsiChar;
  vMime                       : PAnsiChar;      
begin
  SDL_init(SDL_INIT_AUDIO);
  SDL_init(SDL_INIT_VIDEO);
  SDL_init(SDL_INIT_EVENTS);

  WriteLog('Version : ' + SDL_GetVersion().ToString);
  WriteLog('Major ' + SDL_VERSIONNUM_MAJOR(SDL_GetVersion()).ToString );
  WriteLog('Major ' + SDL_VERSIONNUM_MINOR(SDL_GetVersion()).ToString );
  WriteLog('Major ' + SDL_VERSIONNUM_MICRO(SDL_GetVersion()).ToString );


  vMimes                      := SDL_GetClipboardMimeTypes(vSize);
  WriteLog('Mimi type size is ' + vSize.ToString);
  if vSize > 0 then
  begin
    for i := 0 to vSize - 1 do
    begin
    
    end;
  end;

  SDL_ClearError();
  if not SDL_SetClipboardText('test') then
    WriteLog('clipboard set failed, ' + SDL_GetError());
  if SDL_HasClipboardText() then
  begin
    WriteLog('clipboard text is  ' + SDL_GetClipboardText());
  end;

  vCount                      := 0;
  vAudIds                     := SDL_GetAudioPlaybackDevices(vCount);
  WriteLog('Audio device count ' + vCount.ToString);
  for i := 0 to vCount - 1 do
  begin
    WriteLog('Audio driver is ' + SDL_GetAudioDriver(i));
  end;

  vCount                      := SDL_GetNumCameraDrivers;
  WriteLog('Camera driver count is ' + vCount.ToString);
  for i := 0 to vCount - 1 do
  begin
    WriteLog('Camera driver name is ' + SDL_GetCameraDriver(i));
  end;

  vIds                        := SDL_GetCameras(vCount);
  for i := 0  to vCount - 1 do
  begin
    vId                         := vIds^;
    WriteLog('Camera id is ' + vId.ToString);
    Inc(vIds, SizeOf(TSDL_Camera));
  end;
    
end;

procedure TFormMain.WriteLog(const AMessage: string);
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
