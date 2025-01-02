unit kantu_pricepattern;
{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}
interface
uses


{$IFDEF LLCL}
LLCLmore,
{$ENDIF}
{$IFDEF DELPHI}

{$ELSE}
  FileUtil,
{$ENDIF}
  Classes, SysUtils,  Forms, Controls, Graphics, Dialogs, StdCtrls, kantu_definitions, kantu_simulation;
type
  { TPricePatternForm }
  TPricePatternForm = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure decomposeIndicatorPattern(indicatorPattern: TIndicatorPattern; patternType: integer);
  end;
var
  PricePatternForm: TPricePatternForm;
implementation
uses kantu_main,ktUtils;
{$IFDEF DELPHI}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}
{ TPricePatternForm }
procedure TPricePatternForm.decomposeIndicatorPattern(indicatorPattern: TIndicatorPattern; patternType: integer);
var
  i,j : integer;
  firstIndicator, secondIndicator, firstShift, secondShift: string;
  logicType: integer;
  firstIndicatorSell, secondIndicatorSell: integer;
  typeString1, typeString2: string;
  logicToken: string;
begin
  if (patternType = ENTRY_PATTERN) then
  begin
  Memo1.Lines.Add('---- Entry Pattern Decomposition ----');
  Memo1.Lines.Add('*************************************');
  if (SimulationForm.useSLCheck.Checked) then
  Memo1.Lines.Add('Price pattern SL = ' + FloatToStr(indicatorPattern.SL));
  if (SimulationForm.useTPCheck.Checked) then
  Memo1.Lines.Add('Price pattern TP = ' + FloatToStr(indicatorPattern.TP));
  if (SimulationForm.UseHourFilter.Checked) then
  Memo1.Lines.Add('Trade only on hour = ' + FloatToStr(indicatorPattern.hourFilter));
  if (SimulationForm.UseDayFilter.Checked) then
  Memo1.Lines.Add('Trade only on day = ' + FloatToStr(indicatorPattern.dayFilter));
  end;
    Memo1.Lines.Add('------------------------------------');
    Case patternType of
    EXIT_PATTERN    : Memo1.Lines.Add('Short Exit rules');
    ENTRY_PATTERN : Memo1.Lines.Add('Long entry rules');
    end;

    for i:= 0 to Length(indicatorPattern.tradingRules)-1 do
    begin
         firstIndicator  := FloatToStr(indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR]);
         secondIndicator := FloatToStr(indicatorPattern.tradingRules[i][IDX_SECOND_INDICATOR]);
         firstShift      := FloatToStr(indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR_SHIFT]+1);
         secondShift     := FloatToStr(indicatorPattern.tradingRules[i][IDX_SECOND_INDICATOR_SHIFT]+1);
         Case indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR] of
       0 : typeString1 := 'Open';
       1 : typeString1 := 'High';
       2 : typeString1 := 'Low';
       3 : typeString1 := 'Close';
       end;
       Case indicatorPattern.tradingRules[i][IDX_SECOND_INDICATOR] of
       0 : typeString2 := 'Open';
       1 : typeString2 := 'High';
       2 : typeString2 := 'Low';
       3 : typeString2 := 'Close';
       end;
         logicToken := 'AND ' ;
         Memo1.Lines.Add(logicToken + typeString1 +'[' + firstShift + ']' + ' > ' + typeString2 +'[' + secondShift + ']');
    end;
    Memo1.Lines.Add('------------------------------------');
    Case patternType of
    EXIT_PATTERN    : Memo1.Lines.Add('Long Exit rules');
    ENTRY_PATTERN : Memo1.Lines.Add('Short entry rules');
    end;
    for i:= 0 to Length(indicatorPattern.tradingRules)-1 do
    begin
     firstIndicator  := FloatToStr(indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR]);
     secondIndicator := FloatToStr(indicatorPattern.tradingRules[i][IDX_SECOND_INDICATOR]);
     firstShift      := FloatToStr(indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR_SHIFT]+1);
     secondShift     := FloatToStr(indicatorPattern.tradingRules[i][IDX_SECOND_INDICATOR_SHIFT]+1);
       Case indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR] of
       0 : typeString1 := 'Open';
       1 : typeString1 := 'Low';
       2 : typeString1 := 'High';
       3 : typeString1 := 'Close';
       4 : typeString1 := 'Body';
       5 : typeString1 := 'Range';
       else typeString1 := 'Input'+ IntToStr(StrToInt(firstIndicator)-2);
       end;
       Case indicatorPattern.tradingRules[i][IDX_SECOND_INDICATOR] of
       0 : typeString2 := 'Open';
       1 : typeString2 := 'Low';
       2 : typeString2 := 'High';
       3 : typeString2 := 'Close';
       4 : typeString2 := 'Body';
       5 : typeString2 := 'Range';
       else typeString2 := 'Input'+ IntToStr(StrToInt(secondIndicator)-2);
       end;
       logicToken := 'AND ' ;
         if (indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR] <> 4) and (indicatorPattern.tradingRules[i][IDX_FIRST_INDICATOR] <> 5) then
         Memo1.Lines.Add(logicToken + typeString1 +'[' + firstShift + ']' + ' < ' + typeString2 +'[' + secondShift + ']') else
         Memo1.Lines.Add(logicToken + typeString1 +'[' + firstShift + ']' + ' > ' + typeString2 +'[' + secondShift + ']')
       end;

    Memo1.Lines.Add('------------------------------------');
    Memo1.Lines.Add('************************************');

   Memo1.Lines.Add(' ');
end;

procedure TPricePatternForm.Button1Click(Sender: TObject);
begin
  PricePatternForm.Visible := false;
end;
end.
