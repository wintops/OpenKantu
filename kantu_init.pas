unit kantu_init;

interface

uses SysUtils, Classes, Forms,
  kantu_main;

procedure init;

implementation

procedure assignMainCaption();
begin
  MainForm.Caption := 'OpenKantu 2022';
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
var
  authenticationLoad: TStringList;
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
{$IFDEF DELPHI}
{$ELSE}
  // set proper formatting
  DefaultFormatSettings.ShortDateFormat := 'yyyy.mm.dd';
  DefaultFormatSettings.DateSeparator := '.';
  DefaultFormatSettings.DecimalSeparator := '.';

{$ENDIF}
  MainForm.Enabled := true;
  setMainFolder;
  MainForm.parseConfig;

end;

end.
