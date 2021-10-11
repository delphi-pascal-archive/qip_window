object Form1: TForm1
  Left = 225
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'QIP Window'
  ClientHeight = 82
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 233
    Height = 65
    Caption = 'Show Window'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ida: TIdAntiFreeze
    Left = 16
    Top = 16
  end
end
