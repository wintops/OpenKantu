unit kantu_custom_filter;
{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}

interface
uses

{$IFDEF DELPHI}

{$ELSE}
  FileUtil,
{$ENDIF}
  Classes, SysUtils,  Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls;
type
  { TCustomFilterForm }
  TCustomFilterForm = class(TForm)
    Button1: TButton;
    CustomFilterGrid: TStringGrid;
    CustomFormulaEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  CustomFilterForm: TCustomFilterForm;
implementation
{$IFDEF DELPHI}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}
{ TCustomFilterForm }
procedure TCustomFilterForm.Button1Click(Sender: TObject);
begin
  CustomFilterForm.Visible := False;
end;
end.
