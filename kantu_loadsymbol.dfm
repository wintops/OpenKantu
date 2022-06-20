object loadSymbol: TloadSymbol
  Left = 205
  Top = 193
  Caption = 'loadSymbol'
  ClientHeight = 420
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 120
    Height = 14
    Caption = 'Symbols for simulation'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object SymbolsList: TListBox
    Left = 24
    Top = 36
    Width = 184
    Height = 336
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 710
    Top = 384
    Width = 131
    Height = 25
    Caption = 'Save Database'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 560
    Top = 384
    Width = 131
    Height = 25
    Caption = 'Add new entry to DB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button3: TButton
    Left = 434
    Top = 387
    Width = 120
    Height = 25
    Caption = 'Load '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 243
    Top = 368
  end
end
