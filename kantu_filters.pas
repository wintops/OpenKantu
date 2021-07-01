unit kantu_filters;

{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}


interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids;

type

  { TFiltersForm }

  TFiltersForm = class(TForm)
    Button1: TButton;
    isLastYearProfitCheck: TCheckBox;
    FiltersGrid: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FiltersForm: TFiltersForm;

implementation

{$IFDEF DELPHI}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}

{ TFiltersForm }

procedure TFiltersForm.Button1Click(Sender: TObject);
begin
  FiltersForm.Visible := False;
end;

end.

