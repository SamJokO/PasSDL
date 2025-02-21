unit Form.Main;

interface

uses
  SDL.audio,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    
    procedure                   WriteLog(const AMessage: string);
    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error,
  SDL.clipboard,
  SDL.camera;

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
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
//
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

  vAudIds                     := SDL_GetAudioPlaybackDevices(vCount);
  WriteLog('Audio device count ' + vCount.ToString);
  for i := 0 to vCount - 1 do
  begin
  
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

procedure TForm1.WriteLog(const AMessage: string);
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
