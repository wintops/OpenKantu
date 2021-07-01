object PricePatternForm: TPricePatternForm
  Left = 527
  Top = 218
  BorderStyle = bsToolWindow
  Caption = 'Price Pattern Decomposition'
  ClientHeight = 345
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 32
    Top = 8
    Width = 488
    Height = 296
    TabOrder = 0
  end
  object Button1: TButton
    Left = 445
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
end
