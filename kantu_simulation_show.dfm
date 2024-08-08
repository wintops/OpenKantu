object SimulationForm2: TSimulationForm2
  Left = 779
  Top = 353
  BorderStyle = bsToolWindow
  Caption = 'Simulation Options'
  ClientHeight = 520
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label15: TLabel
    Left = 321
    Top = 72
    Width = 108
    Height = 14
    Caption = 'Optimization Target'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label16: TLabel
    Left = 321
    Top = 173
    Width = 67
    Height = 14
    Caption = 'Ending Date'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 321
    Top = 128
    Width = 73
    Height = 14
    Caption = 'Starting Date'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 321
    Top = 229
    Width = 87
    Height = 14
    Caption = 'OS Ending Date'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 521
    Top = 8
    Width = 85
    Height = 14
    Caption = 'Input Variables '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object OptTargetComboBox: TComboBox
    Left = 321
    Top = 96
    Width = 183
    Height = 22
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 8
    Text = 'Balance'
    OnChange = OptTargetComboBoxChange
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
  object EndInSampleCalendar: TDateTimePicker
    Left = 321
    Top = 197
    Width = 183
    Height = 22
    Date = 45512.000000000000000000
    Time = 0.838751249997585500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = EndInSampleEditClick
  end
  object BeginInSampleCalendar: TDateTimePicker
    Left = 321
    Top = 144
    Width = 183
    Height = 22
    Date = 45512.000000000000000000
    Time = 0.838800636571249900
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = BeginInSampleEditClick
  end
  object EndOutOfSampleCalendar: TDateTimePicker
    Left = 321
    Top = 253
    Width = 183
    Height = 22
    Date = 45512.000000000000000000
    Time = 0.838800659723347100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = EndOutOfSampleEditClick
  end
  object UsedInputsList: TListBox
    Left = 521
    Top = 32
    Width = 119
    Height = 480
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 12
  end
  object Button1: TButton
    Left = 321
    Top = 32
    Width = 183
    Height = 25
    Caption = 'Show Options'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object UseSLCheck: TCheckBox
    Left = 22
    Top = 16
    Width = 104
    Height = 29
    Caption = 'Use Stop-Loss'
    TabOrder = 0
  end
  object UseTPCheck: TCheckBox
    Left = 22
    Top = 45
    Width = 111
    Height = 29
    Caption = 'Use Take-Profit'
    TabOrder = 1
  end
  object UseHourFilter: TCheckBox
    Left = 22
    Top = 132
    Width = 108
    Height = 29
    Caption = 'Use Hour Filter'
    TabOrder = 2
  end
  object UseDayFilter: TCheckBox
    Left = 22
    Top = 161
    Width = 101
    Height = 29
    Caption = 'Use Day Filter'
    TabOrder = 3
  end
  object LROriginCheck: TCheckBox
    Left = 22
    Top = 190
    Width = 123
    Height = 29
    Caption = 'LR through origin'
    TabOrder = 4
  end
  object UseFixedSLTP: TCheckBox
    Left = 22
    Top = 74
    Width = 113
    Height = 29
    Caption = 'Use Fixed SL/TP'
    TabOrder = 5
  end
  object UseFixedHour: TCheckBox
    Left = 22
    Top = 103
    Width = 109
    Height = 29
    Caption = 'Use Fixed Hour'
    TabOrder = 6
  end
  object OptionsGrid: TStringGrid
    Left = 20
    Top = 8
    Width = 284
    Height = 504
    ColCount = 2
    RowCount = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    ColWidths = (
      180
      81)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
end
