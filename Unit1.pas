unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ida: TIdAntiFreeze;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure fShowHint(Text:String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.fShowHint(Text:String);
var H:HWND;
    Rec:TRect;
    NeededTop:integer;
    HintForm:TForm;
    HintLabel:TLabel;
    aw:hwnd;
begin

  H := FindWindow('Shell_TrayWnd', nil);
  if h=0 then exit;

  GetWindowRect(h, Rec);

  HintForm:=TForm.Create(nil);
  with HintForm do
  begin
    Width:=245;
    Height:=100;

    Color:=clSkyBlue;
    BorderStyle:=bsNone;

    //Создаём текст
    HintLabel:=TLabel.Create(nil);
    with HintLabel do
    begin
        Parent:=HintForm;

        WordWrap:=true;

        Caption:=' '+Trim(Text)+' ';

        Align:=alClient;
        Layout:=tlCenter;
        Alignment:=taCenter;
    end;

    AlphaBlend:=true;
    AlphaBlendValue:=220;

    aw:=GetActiveWindow;
    ShowWindow(handle,SW_SHOWNOACTIVATE);
    SetActiveWindow(aw);

    Left:=Screen.Width-Width;
    Top:=Screen.Height-20;

    //Выезжаем вверх
    NeededTop:=Rec.Top-Height;
    while Top>NeededTop do
    begin
      Top:=Top-2;
      Repaint;
      ida.Sleep(10);
      ida.Process;
    end;

    ida.Sleep(2000);

    //Выезжаем вниз
    NeededTop:=Screen.Width-20;
    while Top<NeededTop do
    begin
      Top:=Top+2;
      Repaint;
      ida.Sleep(10);
      ida.Process;
    end;

    HintLabel.Free;
    Free;
  end;

end;
procedure TForm1.Button1Click(Sender: TObject);
begin
 Form1.fShowHint('Проверка всплывающих окон');
end;

end.
