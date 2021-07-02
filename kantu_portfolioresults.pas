unit kantu_portfolioResults;
{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}
interface
uses
{$IFDEF DELPHI}

{$ELSE}
  FileUtil,
{$ENDIF}
  Classes, SysUtils,  Forms, Controls, Graphics, Dialogs, Grids;
type
  { TPortfolioResultForm }
  TPortfolioResultForm = class(TForm)
    PortfolioResultsGrid: TStringGrid;
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  PortfolioResultForm: TPortfolioResultForm;
implementation
{$IFDEF DELPHI}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}
end.
