object SimulationForm: TSimulationForm
  Left = 297
  Top = 67
  BorderStyle = bsToolWindow
  Caption = 'GHOST'
  ClientHeight = 623
  ClientWidth = 640
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
  object Label15: TLabel
    Left = 304
    Top = 72
    Width = 94
    Height = 13
    Caption = 'Optimization Target'
    Color = clBtnFace
    ParentColor = False
  end
  object Label16: TLabel
    Left = 304
    Top = 173
    Width = 58
    Height = 13
    Caption = 'Ending Date'
    Color = clBtnFace
    ParentColor = False
  end
  object Label1: TLabel
    Left = 304
    Top = 128
    Width = 64
    Height = 13
    Caption = 'Starting Date'
    Color = clBtnFace
    ParentColor = False
  end
  object Label2: TLabel
    Left = 304
    Top = 229
    Width = 75
    Height = 13
    Caption = 'OS Ending Date'
    Color = clBtnFace
    ParentColor = False
  end
  object Label3: TLabel
    Left = 504
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Input Variables '
    Color = clBtnFace
    ParentColor = False
  end
  object OptTargetComboBox: TComboBox
    Left = 304
    Top = 96
    Width = 183
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 8
    Text = 'Balance'
    Items.Strings = (
      'Balance'
      'Max DD'
      'Max DD Length'
      'Profit/Max DD Ratio'
      'Profit Factor'
      'Linear Fit (R^2)'
      'SQN'
      'Winning %'
      'Reward To Risk'
      'Skewness'
      'Kurtosis'
      'Ulcer Index'
      'Standard Deviation'
      'Std.Dev Breach'
      'Total ME'
      'Custom Filter'
      '')
  end
  object EndInSampleEdit: TEdit
    Left = 304
    Top = 197
    Width = 183
    Height = 21
    ReadOnly = True
    TabOrder = 9
    Text = '01/01/2009'
    OnClick = EndInSampleEditClick
  end
  object BeginInSampleEdit: TEdit
    Left = 304
    Top = 144
    Width = 183
    Height = 21
    TabOrder = 10
    Text = '01/01/1985'
    OnClick = BeginInSampleEditClick
  end
  object EndOutOfSampleEdit: TEdit
    Left = 304
    Top = 253
    Width = 183
    Height = 21
    ReadOnly = True
    TabOrder = 11
    Text = '01/01/2020'
    OnClick = EndOutOfSampleEditClick
  end
  object UsedInputsList: TListBox
    Left = 504
    Top = 32
    Width = 120
    Height = 576
    ItemHeight = 13
    TabOrder = 12
  end
  object Button1: TButton
    Left = 304
    Top = 32
    Width = 183
    Height = 25
    Caption = 'Show Options'
    TabOrder = 13
  end
  object UseSLCheck: TCheckBox
    Left = 23
    Top = 16
    Width = 144
    Height = 29
    Caption = 'Use Stop-Loss'
    TabOrder = 0
  end
  object UseTPCheck: TCheckBox
    Left = 23
    Top = 43
    Width = 150
    Height = 29
    Caption = 'Use Take-Profit'
    TabOrder = 1
  end
  object UseHourFilter: TCheckBox
    Left = 23
    Top = 127
    Width = 147
    Height = 29
    Caption = 'Use Hour Filter'
    TabOrder = 2
  end
  object UseDayFilter: TCheckBox
    Left = 23
    Top = 154
    Width = 138
    Height = 29
    Caption = 'Use Day Filter'
    TabOrder = 3
  end
  object LROriginCheck: TCheckBox
    Left = 23
    Top = 192
    Width = 169
    Height = 29
    Caption = 'LR through origin'
    TabOrder = 4
  end
  object UseFixedSLTP: TCheckBox
    Left = 23
    Top = 72
    Width = 154
    Height = 29
    Caption = 'Use Fixed SL/TP'
    TabOrder = 5
  end
  object UseFixedHour: TCheckBox
    Left = 23
    Top = 100
    Width = 150
    Height = 29
    Caption = 'Use Fixed Hour'
    TabOrder = 6
  end
  object OptionsGrid: TStringGrid
    Left = 20
    Top = 8
    Width = 261
    Height = 600
    ColCount = 2
    RowCount = 15
    TabOrder = 7
    ColWidths = (
      180
      81)
  end
end
