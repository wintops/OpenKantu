object loadSymbol: TloadSymbol
  Left = 205
  Top = 193
  Caption = 'loadSymbol'
  ClientHeight = 472
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = UpdateData
  OnShow = UpdateData
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
    MultiSelect = True
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 710
    Top = 378
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
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 560
    Top = 378
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
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 424
    Top = 378
    Width = 120
    Height = 25
    Caption = 'Load '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = LoadData
  end
  object SymbolsGrid: TStringGrid
    Left = 240
    Top = 36
    Width = 601
    Height = 336
    ColCount = 11
    RowCount = 2
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 155
    Top = 72
  end
end
