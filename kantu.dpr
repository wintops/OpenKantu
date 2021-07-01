program kantu;

{$DEFINE DELPHI}

{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}

uses
  {$DEFINE UseCThreads}
  {$IFDEF UNIX}
  {$IFDEF UseCThreads}
  cthreads,
  {$ENDIF }
  {$ENDIF }
  {$IFNDEF DELPHI}
  Interfaces,
  {$ENDIF }
  Forms,
  kantu_definitions,
  SysUtils,
  FileUtil,
  Controls,
  Graphics,
  Dialogs,
  Menus,
  Grids,
  StdCtrls,
  ComCtrls,
  Buttons,
  Classes,
  kantu_multithreading,
  kantu_indicators,
  kantu_regular_simulation,
  kantu_main in 'kantu_main.pas' {MainForm},
  kantu_loadsymbol in 'kantu_loadsymbol.pas' {loadSymbol},
  kantu_pricepattern in 'kantu_pricepattern.pas' {PricePatternForm},
  kantu_filters in 'kantu_filters.pas' {FiltersForm},
  kantu_custom_filter in 'kantu_custom_filter.pas' {CustomFilterForm},
  kantu_portfolioresults in 'kantu_portfolioresults.pas' {PortfolioResultForm},
  kantu_simulation in 'kantu_simulation.pas' {SimulationForm},
  kantu_simulation_show in 'kantu_simulation_show.pas' {SimulationForm2},
  kantu_singlesystem in 'kantu_singlesystem.pas' {SingleSystem};

{$R *.res}

procedure assignMainCaption();
begin
  MainForm.Caption := 'OpenKantu v' + KANTU_VERSION + '- Parameterless system generator. by Daniel Fernandez, Copyright Asirikuy.com 2013-2015. This version is licensed under the GPL v2.';
end;

function slash(value:string):string;
begin
if (value='') then result:=''
              else begin
                   {$IFDEF WINDOWS}
                   if (value[length(value)]<>'\') then result:=value+'\'
                   {$ELSE}
                   if (value[length(value)]<>'/') then result:=value+'/'
                   {$ENDIF}
                                                  else result:=value;
                   end;
end;

function getinstalldir:string;
begin
result:=slash(extractfiledir(paramstr(0)));
end;

procedure setMainFolder;
var
  authenticationLoad: TStringList;
begin

     MainForm.mainProgramFolder:= GetCurrentDir;

     {$IFDEF DARWIN}
     MainForm.mainProgramFolder:= copy(getinstalldir,1,pos(extractfilename(paramstr(0)),getinstalldir)-1);
     SetCurrentDir(copy(getinstalldir,1,pos(extractfilename(paramstr(0))+'.app/Contents/MacOS',getinstalldir)-1));
     {$ENDIF}
end;


begin
  Application.Title:='Kantu - Price Pattern Parameter-lessTrading System '
    +'Generator';
  Application.Initialize;
  Randomize;
  //CheckValidity();
  Application.CreateForm(TMainForm, MainForm);

  setMainFolder;


     Application.CreateForm(TSimulationForm, SimulationForm);
  Application.CreateForm(TPricePatternForm, PricePatternForm);



  assignMainCaption;

  Application.CreateForm(TFiltersForm, FiltersForm);
  Application.CreateForm(TCustomFilterForm, CustomFilterForm);

  Application.CreateForm(TloadSymbol, loadSymbol);
  {$IFDEF DELPHI}
{$ELSE}
     // set proper formatting
  DefaultFormatSettings.ShortDateFormat 	 := 'yyyy.mm.dd' ;
  DefaultFormatSettings.DateSeparator 	         := '.' ;
  DefaultFormatSettings.DecimalSeparator 	 := '.' ;

{$ENDIF}


  MainForm.Enabled := true;


  Application.CreateForm(TPortfolioResultForm, PortfolioResultForm);
  Application.CreateForm(TSimulationForm2, SimulationForm2);
  Application.CreateForm(TSingleSystem, SingleSystem);

  // Please do not remove these messages //
  //ShowMessage('OpenKantu provides a framework for the automatic generation of trading systems using price action based patterns. The program does NOT contain any tools for the evaluation of curve-fitting or data-mining bias. Using it without proper knowledge about these sources of bias can lead to financial loses. To learn more about these sources of bias and get access to more advanced system generators please visit Asirikuy.com');
  //

  setMainFolder;
  MainForm.parseConfig;
  Application.Run;
end.

