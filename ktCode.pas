unit ktCode;

interface

uses Classes, SysUtils, dateUtils, Math,
  kantu_definitions,  kantu_indicators,
  kantu_simulation, kantu_pricepattern, kantu_filters,
  kantu_custom_filter,
  kantu_loadSymbol, kantu_portfolioresults,  kantu_singleSystem;

procedure ExportToMQL4;
procedure LinearLeastSquares(data: TRealPointArray; var M, B, R: extended);
procedure LinearLeastSquaresNormal(data: TRealPointArray;
  var M, B, R: extended);

procedure addPricePatternLogic(var F4_Code: TStringList;
  pricePattern: TIndicatorPattern; logic: Integer; useLibrary: boolean;
  strategyNumber: Integer);

 function isDataLoaded: boolean;
function findSymbol(symbolString: string): Integer;
procedure pricePatternToMQL4(var Code_MQL4: TStringList;
  pricePattern: TIndicatorPattern; logic: Integer);

implementation

uses kantu_main,ktUtils;

function isDataLoaded: boolean;
begin

  Result := True;

  if (Length(LoadedIndiHistoryData) = 0) then
  begin

    //ShowMessage('Please load data before running a simulation.');
    Result := False;

  end;

end;

function  findSymbol(symbolString: string): Integer;
var
  i: Integer;
begin

  Result := -1;

  if MainForm.simulationType = SIMULATION_TYPE_INDICATORS then
  begin
    for i := 0 to Length(LoadedIndiHistoryData) - 1 do
    begin
      if symbolString = LoadedIndiHistoryData[i].symbol then
        Result := i;

    end;
  end;

end;

procedure LinearLeastSquares(data: TRealPointArray;
  var M, B, R: extended);
var
  SumY, SumX, SumX2, SumXY, SumY2: extended;
  Sx, Sy: extended;
  n, i: Integer;
begin
  if SimulationForm.LROriginCheck.Checked then
  begin;
    n := Length(data); { number of points }
    SumY := 0.0;
    SumX2 := 0.0;
    SumXY := 0.0;
    Sx := 0.0;
    Sy := 0.0;

    for i := 0 to n - 1 do
    begin
      SumY := SumY + (data[i].Y - INITIAL_BALANCE);
      SumX2 := SumX2 + (data[i].X - data[0].X) * (data[i].X - data[0].X);
      SumXY := SumXY + (data[i].X - data[0].X) * (data[i].Y - INITIAL_BALANCE);
    end;

    SumY := SumY / n;

    M := 0;
    R := 0;

    if SumX2 <> 0 then
      M := (SumXY) / SumX2; { Slope M }

    B := INITIAL_BALANCE; { Intercept B }
    for i := 0 to n - 1 do
    begin
      Sx := Sx + ((data[i].Y - INITIAL_BALANCE) - M * (data[i].X - data[0].X)) *
        ((data[i].Y - INITIAL_BALANCE) - M * (data[i].X - data[0].X));
      Sy := Sy + (data[i].Y - INITIAL_BALANCE - SumY) *
        (data[i].Y - INITIAL_BALANCE - SumY)
    end;

    if Sy <> 0 then
      R := 1 - (Sx / Sy);

  end
  else
  begin

    n := Length(data); { number of points }
    SumX := 0.0;
    SumY := 0.0;
    SumX2 := 0.0;
    SumY2 := 0.0;
    SumXY := 0.0;

    for i := 0 to n - 1 do
      with data[i] do
      begin
        SumX := SumX + (X - data[0].X);
        SumY := SumY + Y;
        SumX2 := SumX2 + (X - data[0].X) * (X - data[0].X);
        SumY2 := SumY2 + Y * Y;
        SumXY := SumXY + (X - data[0].X) * Y;
      end;

    if (n * SumX2 = SumX * SumX) or (n * SumY2 = SumY * SumY) then
    begin
      M := 0;
      B := 0;
    end
    else
    begin
      M := ((n * SumXY) - (SumX * SumY)) / ((n * SumX2) - (SumX * SumX));
      { Slope M }
      B := (SumY - M * SumX) / n; { Intercept B }
      Sx := sqrt(SumX2 - sqr(SumX) / n);
      Sy := sqrt(SumY2 - sqr(SumY) / n);
      R := (SumXY - SumX * SumY / n) / (Sx * Sy);
      // RSquared:=r*r;
    end;

  end;

end;

procedure LinearLeastSquaresNormal(data: TRealPointArray;
  var M, B, R: extended);
var
  SumY, SumX, SumX2, SumXY, SumY2: extended;
  Sx, Sy: extended;
  n, i: Integer;
begin

  n := Length(data); { number of points }
  SumX := 0.0;
  SumY := 0.0;
  SumX2 := 0.0;
  SumY2 := 0.0;
  SumXY := 0.0;

  for i := 0 to n - 1 do
    with data[i] do
    begin
      SumX := SumX + (X - data[0].X);
      SumY := SumY + Y;
      SumX2 := SumX2 + (X - data[0].X) * (X - data[0].X);
      SumY2 := SumY2 + Y * Y;
      SumXY := SumXY + (X - data[0].X) * Y;
    end;

  if (n * SumX2 = SumX * SumX) or (n * SumY2 = SumY * SumY) then
  begin
    M := 0;
    B := 0;
  end
  else
  begin
    M := ((n * SumXY) - (SumX * SumY)) / ((n * SumX2) - (SumX * SumX));
    { Slope M }
    B := (SumY - M * SumX) / n; { Intercept B }
    Sx := sqrt(SumX2 - sqr(SumX) / n);
    Sy := sqrt(SumY2 - sqr(SumY) / n);
    R := (SumXY - SumX * SumY / n) / (Sx * Sy);
    // RSquared:=r*r;
  end;

end;

procedure ExportToMQL4;
var
  i: Integer;
  Code_MQL4: TStringList;
  template_MQL4: TStringList;
  selectedPattern: Integer;
  priceEntryPattern: TIndicatorPattern;
  maxShiftUsed: Integer;

begin

  selectedPattern := StrToInt(MainForm.selectedPatternLabel.Caption);

  priceEntryPattern := indicatorEntryPatterns[selectedPattern];

  maxShiftUsed := 0;

  for i := 0 to Length(priceEntryPattern.tradingRules) - 1 do
  begin
    if priceEntryPattern.tradingRules[i][IDX_FIRST_INDICATOR_SHIFT] + 1 > maxShiftUsed
    then
      maxShiftUsed := priceEntryPattern.tradingRules[i]
        [IDX_FIRST_INDICATOR_SHIFT] + 1;

    if priceEntryPattern.tradingRules[i][IDX_SECOND_INDICATOR_SHIFT] + 1 > maxShiftUsed
    then
      maxShiftUsed := priceEntryPattern.tradingRules[i]
        [IDX_SECOND_INDICATOR_SHIFT] + 1;
  end;

  template_MQL4 := TStringList.Create;
  Code_MQL4 := TStringList.Create;

  if MainForm.SaveDialogMQL4.Execute then
  begin

    SetCurrentDir(mainProgramFolder);
    template_MQL4.LoadFromFile('kantu_template.mq4');

    for i := 0 to template_MQL4.Count - 1 do
    begin

      if (((template_MQL4.Strings[i] <>
        'extern double TAKE_PROFIT         = 0;') or
        (SimulationForm.UseTPCheck.Checked = False)) and
        ((template_MQL4.Strings[i] <> 'extern double STOP_LOSS           = 0;')
        or (SimulationForm.UseSLCheck.Checked = False))) then
        Code_MQL4.Add(template_MQL4.Strings[i]);

      if (template_MQL4.Strings[i] = '//addOpenKantuVersion') then
        Code_MQL4.Add('#define COMPONENT_VERSION     "KT_v' +
          KANTU_VERSION + '"');

      if (template_MQL4.Strings[i] = '//insertInstanceID') then
        Code_MQL4.Add('extern int    INSTANCE_ID         = ' +
          IntToStr(RandomRange(12345, 12345 + 25000)) + ' ;');

      if (template_MQL4.Strings[i] = '//defineMaxShiftNeeded') then
        Code_MQL4.Add('int g_maxShift = ' + IntToStr(maxShiftUsed) + ' ;');

      if (template_MQL4.Strings[i] = '// insertDayFilter') and
        (SimulationForm.UseDayFilter.Checked) then
        Code_MQL4.Add('if(DayOfWeek() != ' +
          IntToStr(priceEntryPattern.dayFilter) + '){return(PATTERN_NONE);}');

      if (template_MQL4.Strings[i] = 'extern double TAKE_PROFIT         = 0;')
        and (SimulationForm.UseTPCheck.Checked) then
        Code_MQL4.Add('extern double TAKE_PROFIT         = ' +
          FloatToStr(priceEntryPattern.TP) + ';');

      if (template_MQL4.Strings[i] = 'extern double STOP_LOSS           = 0;')
        and (SimulationForm.UseSLCheck.Checked) then
        Code_MQL4.Add('extern double STOP_LOSS           = ' +
          FloatToStr(priceEntryPattern.sl) + ';');

      if (template_MQL4.Strings[i] = '// insertHourFilter') and
        (SimulationForm.UseHourFilter.Checked) then
        Code_MQL4.Add('if(Hour() != ' + IntToStr(priceEntryPattern.hourFilter) +
          '){return(PATTERN_NONE);}');

      if template_MQL4.Strings[i] = '//insertLongEntryLogic' then
        pricePatternToMQL4(Code_MQL4, priceEntryPattern, BUY);

      if template_MQL4.Strings[i] = '//insertShortEntryLogic' then
        pricePatternToMQL4(Code_MQL4, priceEntryPattern, SELL);

      if (template_MQL4.Strings[i] = '//noExitPatternInsertReturn') then
        Code_MQL4.Add('return(PATTERN_NONE);');
    end;

    Code_MQL4.SaveToFile(MainForm.SaveDialogMQL4.FileName);
  end;

  template_MQL4.Free;
  Code_MQL4.Free;

end;

procedure pricePatternToMQL4(var Code_MQL4: TStringList;
  pricePattern: TIndicatorPattern; logic: Integer);
var
  i, j: Integer;
  directionString: string;
  logicType: Integer;
  typeString1, typeString2, firstShift, secondShift: string;
begin

  for j := 0 to Length(pricePattern.tradingRules) - 1 do
  begin

    firstShift := FloatToStr(pricePattern.tradingRules[j]
      [IDX_FIRST_INDICATOR_SHIFT] + 1);
    secondShift := FloatToStr(pricePattern.tradingRules[j]
      [IDX_SECOND_INDICATOR_SHIFT] + 1);

    if (Code_MQL4.Strings[Code_MQL4.Count - 1] <> '&&') and
      (Code_MQL4.Strings[Code_MQL4.Count - 1][1] <> '/') then
    begin
      Code_MQL4.Add('&&');
    end;

    if (logic = SHORT_EXIT) or (logic = LONG_ENTRY) then
    begin

      Case pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] of
        0:
          typeString1 := 'Open';
        1:
          typeString1 := 'High';
        2:
          typeString1 := 'Low';
        3:
          typeString1 := 'Close';
      end;

      Case pricePattern.tradingRules[j][IDX_SECOND_INDICATOR] of
        0:
          typeString2 := 'Open';
        1:
          typeString2 := 'High';
        2:
          typeString2 := 'Low';
        3:
          typeString2 := 'Close';
      end;

      if (pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] <> 4) and
        (pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] <> 5) then
        Code_MQL4.Add(typeString1 + '[' + firstShift + ']' + ' > ' + typeString2
          + '[' + secondShift + ']')
      else
        Code_MQL4.Add(typeString1 + ' > ' + typeString2);

    end;

    if (logic = LONG_EXIT) or (logic = SHORT_ENTRY) then
    begin

      Case pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] of
        0:
          typeString1 := 'Open';
        1:
          typeString1 := 'Low';
        2:
          typeString1 := 'High';
        3:
          typeString1 := 'Close';
      end;

      Case pricePattern.tradingRules[j][IDX_SECOND_INDICATOR] of
        0:
          typeString2 := 'Open';
        1:
          typeString2 := 'Low';
        2:
          typeString2 := 'High';
        3:
          typeString2 := 'Close';
      end;

      if (pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] <> 4) and
        (pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] <> 5) then
        Code_MQL4.Add(typeString1 + '[' + firstShift + ']' + ' < ' + typeString2
          + '[' + secondShift + ']')
      else
        Code_MQL4.Add(typeString1 + ' > ' + typeString2);

    end;
  end;

end;

procedure addPricePatternLogic(var F4_Code: TStringList;
  pricePattern: TIndicatorPattern; logic: Integer; useLibrary: boolean;
  strategyNumber: Integer);
var
  i, j, logicType: Integer;
  firstIndicator, secondIndicator, firstShift, secondShift: string;
  typeString1, typeString2: string;
begin

  if SimulationForm.UseSLCheck.Checked then
    F4_Code.Add('// pattern SL= ' + FloatToStr(pricePattern.sl));

  if SimulationForm.UseTPCheck.Checked then
    F4_Code.Add('// pattern TP= ' + FloatToStr(pricePattern.TP));

  F4_Code.Add('if (');

  case logic of
    LONG_EXIT:
      F4_Code.Add('(pParams->openOrdersCount[BUY] != 0) && ');
    SHORT_EXIT:
      F4_Code.Add('(pParams->openOrdersCount[SELL] != 0) && ');
  end;

  if (SimulationForm.UseDayFilter.Checked) then
    F4_Code.Add('(dayOfWeek() == ' + IntToStr(pricePattern.dayFilter) + ') &&');

  if (SimulationForm.UseHourFilter.Checked) then
    F4_Code.Add('(hour() == ' + IntToStr(pricePattern.hourFilter) + ') &&');

  F4_Code.Add('(tradingStrategyUsed == ' + IntToStr(strategyNumber) + ')');

  for j := 0 to Length(pricePattern.tradingRules) - 1 do
  begin

    firstIndicator := FloatToStr(pricePattern.tradingRules[j]
      [IDX_FIRST_INDICATOR]);
    secondIndicator := FloatToStr(pricePattern.tradingRules[j]
      [IDX_SECOND_INDICATOR]);
    firstShift := FloatToStr(pricePattern.tradingRules[j]
      [IDX_FIRST_INDICATOR_SHIFT] + 1);
    secondShift := FloatToStr(pricePattern.tradingRules[j]
      [IDX_SECOND_INDICATOR_SHIFT] + 1);

    F4_Code.Add('&&');

    if (logic = SHORT_EXIT) or (logic = LONG_ENTRY) then
    begin

      Case pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] of
        0:
          typeString1 := 'cOpen';
        1:
          typeString1 := 'high';
        2:
          typeString1 := 'low';
        3:
          typeString1 := 'cClose';
      end;

      Case pricePattern.tradingRules[j][IDX_SECOND_INDICATOR] of
        0:
          typeString2 := 'cOpen';
        1:
          typeString2 := 'high';
        2:
          typeString2 := 'low';
        3:
          typeString2 := 'cClose';
      end;

      F4_Code.Add(typeString1 + '(' + firstShift + ')' + ' > ' + typeString2 +
        '(' + secondShift + ')');

    end;

    if (logic = LONG_EXIT) or (logic = SHORT_ENTRY) then
    begin

      Case pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] of
        0:
          typeString1 := 'cOpen';
        1:
          typeString1 := 'low';
        2:
          typeString1 := 'high';
        3:
          typeString1 := 'cClose';
      end;

      Case pricePattern.tradingRules[j][IDX_SECOND_INDICATOR] of
        0:
          typeString2 := 'cOpen';
        1:
          typeString2 := 'low';
        2:
          typeString2 := 'high';
        3:
          typeString2 := 'cClose';
      end;

      if (pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] <> 4) and
        (pricePattern.tradingRules[j][IDX_FIRST_INDICATOR] <> 5) then
        F4_Code.Add(typeString1 + '(' + firstShift + ')' + ' < ' + typeString2 +
          '(' + secondShift + ')')
      else
        F4_Code.Add(typeString1 + '(' + firstShift + ')' + ' > ' + typeString2 +
          '(' + secondShift + ')')

    end;

  end;

  F4_Code.Add(')');

  F4_Code.Add('{');

  if (useLibrary = False) then
  begin
    case logic of
      LONG_ENTRY:
        F4_Code.Add
          ('openOrUpdateLongTrade(pParams, PRIMARY_RATES, stopLoss, takeProfit, USE_INTERNAL_SL, USE_INTERNAL_TP);');
      SHORT_ENTRY:
        F4_Code.Add
          ('openOrUpdateShortTrade(pParams, PRIMARY_RATES, stopLoss, takeProfit, USE_INTERNAL_SL, USE_INTERNAL_TP);');
      LONG_EXIT:
        F4_Code.Add('returnCode = closeLongTrade(pParams);');
      SHORT_EXIT:
        F4_Code.Add('returnCode = closeShortTrade(pParams);');
    end;
  end;

  if (useLibrary) then
    F4_Code.Add('return TRUE;');

  F4_Code.Add('}');

  F4_Code.Add(' ');

end;

end.
