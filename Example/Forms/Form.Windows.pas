unit Form.Windows;

interface

uses
  SDL.stdinc,
  SDL.init, SDL.video,
  SDL.render, SDL.properties,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TFormWindows = class(TForm)
    btnCreateWindow: TButton;
    Memo1: TMemo;
    btnDrawLine: TButton;
    procedure btnCreateWindowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDrawLineClick(Sender: TObject);
  private
    { Private declarations }

    FWindow                     : PSDL_Window;
    FProperties                 : TSDL_PropertiesID;
    FRenderer                   : PSDL_Renderer;

    procedure                   WriteToMemo(const AMessage: string);
    procedure                   WriteLog(const AMessage: string; AInThread: Boolean = False);
  public
    { Public declarations }
  end;

var
  FormWindows: TFormWindows;

implementation

uses
  SDL.error,
  SDL.pixels,
  SDL.rect,
  SDL.events, SDL.mouse;

{$R *.fmx}

procedure TFormWindows.btnCreateWindowClick(Sender: TObject);
var
  vEvent                      : TSDL_Event;
  vX, vY                      : float;
begin

{$REGION 'With Renderer'}
//{
  if not SDL_CreateWindowAndRenderer('test', 640, 480,  SDL_WINDOW_RESIZABLE, FWindow, FRenderer)  then
  begin
    WriteLog('SDL_CreateWindowAndRenderer failed : ' + SDL_GetError());
    Exit;
  end;
//}
{$ENDREGION}

{$REGION 'Without Renderer'}
{
  FProperties                 := SDL_CreateProperties();
  if FProperties = 0 then
  begin
    WriteLog('SDL_CreateProperties failed : ' + SDL_GetError());
    Exit;
  end;

  SDL_SetStringProperty(FProperties, SDL_PROP_WINDOW_CREATE_TITLE_STRING, 'Test SDL windows');
  SDL_SetBooleanProperty(FProperties, SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN, True);

  SDL_SetNumberProperty(FProperties, SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER, 640);
  SDL_SetNumberProperty(FProperties, SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER, 480);


  FWindow                     := SDL_CreateWindowWithProperties(FProperties);
  if FWindow = nil then
  begin
    WriteLog('SDL_CreateWindowWithProperties failed : ' + SDL_GetError());
    Exit;
  end;
}
{$ENDREGION}

// SDL_CaptureMouse must use in Main thread
//  if not SDL_CaptureMouse(True) then
//    WriteLog('Can not capture');

  while True do
  begin
    // SDL_PollEvent should use in Main-thread (UI - thread)
    if SDL_PollEvent(vEvent) then
    begin
      if vEvent.&type = Ord(SDL_EVENT_MOUSE_MOTION) then
      begin
        WriteLog(Format('Mouse move to [%f][%f]', [vEvent.motion.x, vEvent.motion.y]));
      end
      else
      begin
//            WriteLog('event ' + vEvent.&type.toString);
      end;

    end;
    Application.ProcessMessages;
  end;

end;

procedure TFormWindows.btnDrawLineClick(Sender: TObject);
var
  vRect                       : TSDL_Rect;
begin
  if FRenderer = nil then
    Exit;
  // dary gray, full alpha
  SDL_SetRenderDrawColor(FRenderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
  // start with a blank canvas
  SDL_RenderClear(FRenderer);

  if SDL_GetWindowSafeArea(FWindow, vRect) then
  begin
    SDL_SetRenderDrawColor(FRenderer, 255, 0, 0, 255);
    SDL_RenderLine(FRenderer, 0, 0, Random(vRect.w), Random(vRect.h));
  end
  else
  begin
    WriteLog('Can not get WindowSafeArea : ' + SDL_GetError());
  end;

//  SDL_SetRenderDrawColor(FRenderer, 255, 0, 0, 255);
//  SDL_RenderLine(FRenderer, 0, 0, Random(640), Random(480));


//  SDL_SetRenderDrawColor(FRenderer, 0, 0, 255, 0);
//  vRect.x                     := 100;
//  vRect.y                     := 100;
//  vRect.w                     := 440;
//  vRect.h                     := 280;
//  SDL_RenderFillRect(FRenderer, @vRect);

  SDL_RenderPresent(FRenderer);

//  SDL_GetRenderDrawColor(FRenderer, 128, 128, 128,
//  SDL_RenderLine(FRenderer, 0, 0, 120, 240);
end;

procedure TFormWindows.FormCreate(Sender: TObject);
begin
  FRenderer                   := nil;
  FWindow                     := nil;

  if not SDL_init(SDL_INIT_VIDEO) then
  begin
    WriteLog('SDL_INIT_VIDEO failed');
    Exit;
  end;

  if not SDL_init(SDL_INIT_EVENTS) then
  begin
    WriteLog('SDL_INIT_EVENTS failed');
    Exit;
  end;
end;

procedure TFormWindows.WriteLog(const AMessage: string; AInThread: Boolean);
  procedure Write(const AMsg: string);
  begin

  end;
begin
  if AInThread then
  begin
    TThread.Synchronize(
      TThread.CurrentThread,
      procedure
      begin
        WriteToMemo(AMessage);
      end
    );
  end
  else
  begin
    WriteToMemo(AMessage);
  end;
end;

procedure TFormWindows.WriteToMemo(const AMessage: string);
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
