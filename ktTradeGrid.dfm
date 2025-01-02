object FormTradeGrid: TFormTradeGrid
  Left = 0
  Top = 0
  Caption = 'FormTradeGrid'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TradeGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 472
    Height = 242
    Align = alClient
    ColCount = 10
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
    TabOrder = 0
    ExplicitLeft = -332
    ExplicitTop = -331
    ExplicitWidth = 804
    ExplicitHeight = 573
  end
end
