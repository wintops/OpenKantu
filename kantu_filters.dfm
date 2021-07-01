object FiltersForm: TFiltersForm
  Left = 801
  Top = 169
  BorderStyle = bsToolWindow
  Caption = 'Result Filters'
  ClientHeight = 506
  ClientWidth = 359
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
  object Button1: TButton
    Left = 272
    Top = 472
    Width = 80
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object FiltersGrid: TStringGrid
    Left = 16
    Top = 8
    Width = 336
    Height = 464
    DefaultColWidth = 120
    RowCount = 20
    ScrollBars = ssNone
    TabOrder = 1
    ColWidths = (
      120
      50
      50
      50
      50)
  end
  object isLastYearProfitCheck: TCheckBox
    Left = 16
    Top = 472
    Width = 131
    Height = 19
    Caption = 'Last year is profitable'
    TabOrder = 2
  end
end
