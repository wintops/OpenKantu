object MainForm: TMainForm
  Left = 740
  Top = 473
  Caption = 'Kantu'
  ClientHeight = 902
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OutOfSampleAnalysisLabel: TLabel
    Left = 21
    Top = 296
    Width = 3
    Height = 13
    Color = clBtnFace
    ParentColor = False
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 879
    Height = 902
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Simulation Results'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Splitter1: TSplitter
        Left = 0
        Top = 259
        Width = 871
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 59
        ExplicitWidth = 203
      end
      object ResultsGrid: TStringGrid
        Left = 0
        Top = 59
        Width = 871
        Height = 200
        Align = alClient
        ColCount = 57
        RowCount = 2
        FixedRows = 0
        ParentShowHint = False
        PopupMenu = PopupMenu1
        ShowHint = True
        TabOrder = 3
        OnClick = ResultsGridClick
      end
      object plChartOHLC: TPanel
        Left = 0
        Top = 59
        Width = 871
        Height = 200
        Align = alClient
        Caption = 'plChartOHLC'
        TabOrder = 1
        Visible = False
        object ChartOHLC: TChart
          Left = 1
          Top = 1
          Width = 869
          Height = 198
          Legend.Visible = False
          Title.Text.Strings = (
            ' ')
          View3D = False
          Align = alClient
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object GraphOHLC_Up: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object GraphOHLC_Down: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object GraphOpenTrades: TBubbleSeries
            Marks.Frame.Visible = False
            ClickableLine = False
            Pointer.HorizSize = 16
            Pointer.InflateMargins = True
            Pointer.Style = psCircle
            Pointer.VertSize = 16
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
            RadiusValues.Name = 'Radius'
            RadiusValues.Order = loNone
          end
          object GraphCloseTrades: TBubbleSeries
            Marks.Frame.Visible = False
            ClickableLine = False
            Pointer.HorizSize = 16
            Pointer.InflateMargins = True
            Pointer.Style = psCircle
            Pointer.VertSize = 16
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
            RadiusValues.Name = 'Radius'
            RadiusValues.Order = loNone
          end
        end
        object Button2: TButton
          Left = 26
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Hide graph'
          TabOrder = 1
          OnClick = Button2Click
        end
        object LabelCheck: TCheckBox
          Left = 26
          Top = 67
          Width = 177
          Height = 29
          Caption = 'Show Trade Labels'
          TabOrder = 2
        end
        object ohlcCheck: TCheckBox
          Left = 26
          Top = 37
          Width = 125
          Height = 29
          Caption = 'Show OHLC'
          TabOrder = 3
        end
      end
      object plStatus: TPanel
        Left = 0
        Top = 0
        Width = 871
        Height = 59
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object StatusLabel: TLabel
          Left = 4
          Top = 2
          Width = 549
          Height = 19
          AutoSize = False
          Color = clBtnFace
          ParentColor = False
        end
        object extraLabel: TLabel
          Left = 657
          Top = 2
          Width = 214
          Height = 19
          AutoSize = False
          Color = clBtnFace
          ParentColor = False
        end
        object selectedPatternLabel: TLabel
          Left = 559
          Top = 4
          Width = 6
          Height = 13
          Caption = '0'
          Color = clBtnFace
          ParentColor = False
          Visible = False
        end
        object ProgressBar1: TProgressBar
          Left = 125
          Top = 23
          Width = 497
          Height = 23
          TabOrder = 0
        end
        object Button1: TButton
          Left = 44
          Top = 23
          Width = 75
          Height = 18
          Caption = 'Cancel'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Pitch = fpVariable
          Font.Style = []
          Font.Quality = fqDraft
          ParentFont = False
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 262
        Width = 871
        Height = 612
        ActivePage = TabSheet3
        Align = alBottom
        TabOrder = 2
        object TabSheet3: TTabSheet
          Caption = 'Balance Curve'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Chart1: TChart
            Left = 0
            Top = 0
            Width = 863
            Height = 584
            Legend.Title.Text.Strings = (
              'Balance')
            Legend.Visible = False
            Title.Text.Strings = (
              ' ')
            BottomAxis.Title.Caption = 'Date'
            LeftAxis.Title.Caption = 'Balance'
            View3D = False
            Align = alClient
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            ColorPaletteIndex = 13
            object BalanceCurve: TLineSeries
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Mathematical Expectancy'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Chart2: TChart
            Left = 0
            Top = 0
            Width = 863
            Height = 584
            Legend.Visible = False
            Title.Text.Strings = (
              ' ')
            BottomAxis.Title.Caption = 'Bas from entry'
            LeftAxis.Title.Caption = 'Total ME(MFE-MAE)'
            View3D = False
            Align = alClient
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            ColorPaletteIndex = 13
            object ME_Shorts: TBarSeries
              Marks.Visible = False
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Bar'
              YValues.Order = loNone
            end
            object ME_Longs: TBarSeries
              Marks.Visible = False
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Bar'
              YValues.Order = loNone
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Trade Analysis'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TradeGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 871
        Height = 874
        Align = alClient
        ColCount = 10
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
        PopupMenu = PopupMenu2
        TabOrder = 0
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 24
    object MenuItem1: TMenuItem
      Caption = 'Simulation'
      object MenuItem3: TMenuItem
        Caption = 'Options'
        OnClick = MenuItem3Click
      end
      object MenuItem5: TMenuItem
        Caption = 'Filters'
        object MenuItem18: TMenuItem
          Caption = 'Define filters'
          OnClick = MenuItem18Click
        end
        object MenuItem19: TMenuItem
          Caption = 'Define Custom Filter'
          OnClick = MenuItem19Click
        end
      end
      object MenuItem8: TMenuItem
        Caption = 'Find Systems'
        object MenuItem16: TMenuItem
          Caption = 'Main Symbol'
          OnClick = MenuItem16Click
        end
        object MenuItem28: TMenuItem
          Caption = 'Multiple Symbol'
          OnClick = MenuItem28Click
        end
      end
      object MenuItem35: TMenuItem
        Caption = 'Run Single System'
        OnClick = MenuItem35Click
      end
    end
    object MenuItem9: TMenuItem
      Caption = 'Selection'
      object MenuItem23: TMenuItem
        Caption = 'Export to MQL4'
        OnClick = MenuItem23Click
      end
      object MenuItem11: TMenuItem
        Caption = 'Show Pattern Composition'
        OnClick = MenuItem11Click
      end
      object MenuItem29: TMenuItem
        Caption = 'Show Trade Analysis on Click'
        OnClick = MenuItem29Click
      end
      object MenuItem30: TMenuItem
        Caption = 'Show Portfolio Result'
        OnClick = MenuItem30Click
      end
    end
    object MenuItem2: TMenuItem
      Caption = 'History'
      object MenuItem4: TMenuItem
        Caption = 'Load Symbol'
        OnClick = showloadSymbol
      end
    end
    object MenuItem20: TMenuItem
      Caption = 'More information...'
      OnClick = MenuItem20Click
    end
  end
  object OpenSymbolHistoryDialog: TOpenDialog
    DefaultExt = '.csv'
    Filter = 'History data file|*.csv'
    Left = 456
    Top = 96
  end
  object SaveDialog1: TSaveDialog
    Left = 456
    Top = 152
  end
  object PopupMenu1: TPopupMenu
    Left = 632
    Top = 240
    object MenuItem13: TMenuItem
      Caption = 'Save contents to CSV'
      OnClick = MenuItem13Click
    end
    object MenuItem37: TMenuItem
      Caption = 'Hide/Show Columns'
      object MenuItem38: TMenuItem
        Caption = 'Abs. Profit'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem39: TMenuItem
        Caption = 'Profit/trade'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem40: TMenuItem
        Caption = 'Profit Longs'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem41: TMenuItem
        Caption = 'Profit Shorts'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem42: TMenuItem
        Caption = 'No. Longs'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem43: TMenuItem
        Caption = 'No. Shorts'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem44: TMenuItem
        Caption = 'Total Trades'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem45: TMenuItem
        Caption = 'Max DD'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem46: TMenuItem
        Caption = 'Ideal R'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem47: TMenuItem
        Caption = 'R^2'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem48: TMenuItem
        Caption = 'Ulcer Index'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem49: TMenuItem
        Caption = 'Max DD Length'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem50: TMenuItem
        Caption = 'Cons.Loss'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem52: TMenuItem
        Caption = 'Cons.Wins'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem53: TMenuItem
        Caption = 'Profit:MaxDD'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem54: TMenuItem
        Caption = 'Win %'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem51: TMenuItem
        Caption = 'Reward:Risk'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem56: TMenuItem
        Caption = 'Skewness'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem57: TMenuItem
        Caption = 'Kurtosis'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem58: TMenuItem
        Caption = 'PF'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem55: TMenuItem
        Caption = 'Std. Dev'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem60: TMenuItem
        Caption = 'Std.Dev.Breach'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem59: TMenuItem
        Caption = 'Total ME'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem62: TMenuItem
        Caption = 'SQN'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem63: TMenuItem
        Caption = 'Mod. Sharpe Ratio'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem61: TMenuItem
        Caption = 'Custom Criteria'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem64: TMenuItem
        Caption = 'Bars out'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem65: TMenuItem
        Caption = 'OSP'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem66: TMenuItem
        Caption = 'OSP/trade'
        Checked = True
        OnClick = showOrHideColumn
      end
      object MenuItem67: TMenuItem
        Caption = 'Lowest Lag'
        Checked = True
        OnClick = showOrHideColumn
      end
    end
  end
  object OpenKantuLibraryDialog: TOpenDialog
    Left = 448
    Top = 208
  end
  object SaveDialogMQL4: TSaveDialog
    DefaultExt = '.mq4'
    Filter = '*.mq4'
    Left = 568
    Top = 88
  end
  object PopupMenu2: TPopupMenu
    Left = 600
    Top = 344
    object MenuItem24: TMenuItem
      Caption = 'Save contents to CSV'
      OnClick = MenuItem24Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 688
    Top = 184
    object MenuItem25: TMenuItem
      Caption = 'Save contents to CSV'
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 560
    Top = 392
    object MenuItem26: TMenuItem
      Caption = 'Save contents to CSV'
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 568
    Top = 280
    object MenuItem27: TMenuItem
      Caption = 'Save graph to BMP'
      OnClick = MenuItem27Click
    end
  end
  object PopupMenu6: TPopupMenu
    Left = 326
    Top = 365
    object MenuItem34: TMenuItem
      Caption = 'Save contents to CSV'
    end
  end
  object PopupMenu7: TPopupMenu
    Left = 319
    Top = 157
    object MenuItem33: TMenuItem
      Caption = 'Save graph to BMP'
    end
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = '.csv'
    Filter = 'csv|*.csv'
    Left = 558
    Top = 150
  end
end
