unit ktInit;

interface

uses SysUtils, Classes, Forms,
kantu_singleSystem,kantu_indicators,
   kantu_definitions,kantu_main;

procedure init;

implementation

procedure assignMainCaption();
begin
  MainForm.Caption := KANTU_NAME;
end;

function slash(value: string): string;
begin
  if (value = '') then
    result := ''
  else
  begin
{$IFDEF WINDOWS}
    if (value[length(value)] <> '\') then
      result := value + '\'
{$ELSE}
    if (value[length(value)] <> '/') then
      result := value + '/'
{$ENDIF}
    else
      result := value;
  end;
end;

function getinstalldir: string;
begin
  result := slash(extractfiledir(paramstr(0)));
end;

procedure setMainFolder;
{$IFDEF DARWIN}
var
  authenticationLoad: TStringList;
{$ENDIF}
begin

  MainForm.mainProgramFolder := GetCurrentDir;

{$IFDEF DARWIN}
  MainForm.mainProgramFolder := copy(getinstalldir, 1,
    pos(extractfilename(paramstr(0)), getinstalldir) - 1);
  SetCurrentDir(copy(getinstalldir, 1, pos(extractfilename(paramstr(0)) +
    '.app/Contents/MacOS', getinstalldir) - 1));
{$ENDIF}
end;

procedure init;
begin
  Application.Title := 'Kantu  Trading System ';
  Randomize;
  // CheckValidity();
  assignMainCaption;


  MainForm.Enabled := true;
  setMainFolder;
  MainForm.parseConfig;
 LoadIndicatorsAndHistory('data/RM409.TXT');
 SingleSystem.SymbolsCombo.Items.Add('RM409');

end;

end.
