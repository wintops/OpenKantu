unit ktTradeGrid;

interface

uses kantu_definitions,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TFormTradeGrid = class(TForm)
    TradeGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTradeGrid: TFormTradeGrid;

implementation

{$R *.dfm}

procedure TFormTradeGrid.FormCreate(Sender: TObject);
begin
 TradeGrid.rows[0].commatext := TradeTitle;

 {$IFDEF DELPHI}
{$ELSE}
  if SaveDialog1.Execute then
    TradeGrid.SaveToCSVFile(SaveDialog1.FileName);
{$ENDIF}
end;

end.
