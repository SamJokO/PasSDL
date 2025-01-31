unit Form.Main;

interface

uses
  SDL_audio,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
//
//  TByteOrder.
//  SDL_AUDIO_S16LE := $1111;
//  SDL_AUDIO_S16 := $0101;
end;

end.
