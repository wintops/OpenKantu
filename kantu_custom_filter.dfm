object CustomFilterForm: TCustomFilterForm
  Left = 619
  Top = 353
  BorderStyle = bsToolWindow
  Caption = 'Custom Filter'
  ClientHeight = 294
  ClientWidth = 360
  Color = clBtnFace
  DefaultMonitor = dmDesktop
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
  object Label1: TLabel
    Left = 160
    Top = 184
    Width = 104
    Height = 13
    Caption = 'Custom Filter Formula'
    Color = clBtnFace
    ParentColor = False
  end
  object Label2: TLabel
    Left = 152
    Top = 8
    Width = 195
    Height = 160
    AutoSize = False
    Caption = ' '
    Color = clBtnFace
    ParentColor = False
    WordWrap = True
  end
  object CustomFilterGrid: TStringGrid
    Left = 16
    Top = 8
    Width = 128
    Height = 264
    ColCount = 2
    DefaultColWidth = 65
    DefaultRowHeight = 12
    RowCount = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial Narrow'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 272
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CustomFormulaEdit: TEdit
    Left = 160
    Top = 208
    Width = 187
    Height = 21
    TabOrder = 2
    Text = '0'
  end
end
