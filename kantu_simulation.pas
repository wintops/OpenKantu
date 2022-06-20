unit kantu_simulation;

{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF DELPHI}
  FileUtil,
{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ExtDlgs, kantu_definitions, Math, dateutils, Grids,
  Buttons;

type
  TGridDrawState = integer;

{$IFDEF DELPHI}

  TCalendarDialog = class(TOpenDialog)
  public
    Date: TDateTime;
  end;
{$ENDIF}
  { TSimulationForm }

  TSimulationForm = class(TForm)
    BeginInSampleCalendar: TCalendarDialog;
    BeginInSampleEdit: TEdit;
    Button1: TButton;
    EndInSampleCalendar: TCalendarDialog;
    EndInSampleEdit: TEdit;
    EndOutOfSampleCalendar: TCalendarDialog;
    EndOutOfSampleEdit: TEdit;
    Label1: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LROriginCheck: TCheckBox;
    OptionsGrid: TStringGrid;

    OptTargetComboBox: TComboBox;
    UseDayFilter: TCheckBox;
    UsedInputsList: TListBox;
    UseFixedHour: TCheckBox;
    UseFixedSLTP: TCheckBox;
    UseHourFilter: TCheckBox;
    UseSLCheck: TCheckBox;
    UseTPCheck: TCheckBox;
    procedure BeginInSampleCalendarDayChanged(Sender: TObject);
    procedure BeginInSampleEditClick(Sender: TObject);
    procedure EndInSampleEditClick(Sender: TObject);
    procedure EndOutOfSampleEditClick(Sender: TObject);
    procedure OptionsGridPrepareCanvas(Sender: TObject; aCol, aRow: integer;
      aState: TGridDrawState);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SimulationForm: TSimulationForm;

implementation

uses kantu_main;

{$IFDEF DELPHI}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}

procedure TSimulationForm.EndInSampleEditClick(Sender: TObject);
begin

  if EndInSampleCalendar.Execute then
    EndInSampleEdit.Text := DateTimeToStr(EndInSampleCalendar.Date);

end;

procedure TSimulationForm.EndOutOfSampleEditClick(Sender: TObject);
begin
  if EndOutOfSampleCalendar.Execute and
    (EndOutOfSampleCalendar.Date > EndInSampleCalendar.Date) then
  begin
    EndOutOfSampleEdit.Text := DateTimeToStr(EndOutOfSampleCalendar.Date);
  end;

  if (EndOutOfSampleCalendar.Date < EndInSampleCalendar.Date) then
    EndOutOfSampleCalendar.Date := Now;

end;

procedure TSimulationForm.FormCreate(Sender: TObject);
begin
{$IFDEF DELPHI}
  BeginInSampleCalendar := TCalendarDialog.Create(Self);

  EndInSampleCalendar := TCalendarDialog(Self);

  EndOutOfSampleCalendar := TCalendarDialog(Self);
{$ENDIF}
end;

procedure TSimulationForm.OptionsGridPrepareCanvas(Sender: TObject;
  aCol, aRow: integer; aState: TGridDrawState);
begin
  If (aRow = 1) or (aRow = 6) or (aRow = 10) or (aRow = 14) or (aRow = 16) then
    OptionsGrid.Canvas.Brush.Color := clLtGray;
end;

procedure TSimulationForm.BeginInSampleCalendarDayChanged(Sender: TObject);
begin
  BeginInSampleEdit.Text := DateTimeToStr(BeginInSampleCalendar.Date);
end;

procedure TSimulationForm.BeginInSampleEditClick(Sender: TObject);
begin

  if BeginInSampleCalendar.Execute then
    BeginInSampleEdit.Text := DateTimeToStr(BeginInSampleCalendar.Date);

end;

end.
