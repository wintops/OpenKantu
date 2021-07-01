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
  object SymbolsList: TCheckListBox
    Left = 24
    Top = 40
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
  object DBNavigator1: TDBNavigator
    Left = 600
    Top = 8
    Width = 240
    Height = 25
    DataSource = Datasource1
    TabOrder = 1
  end
  object SymbolsGrid: TDBGrid
    Left = 216
    Top = 40
    Width = 625
    Height = 336
    DataSource = Datasource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    TabOrder = 3
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
    TabOrder = 4
  end
  object Button3: TButton
    Left = 432
    Top = 384
    Width = 120
    Height = 25
    Caption = 'Load Inputs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Datasource1: TDataSource
    Left = 280
    Top = 248
  end
  object OpenDialog1: TOpenDialog
    Left = 347
    Top = 16
  end
end
