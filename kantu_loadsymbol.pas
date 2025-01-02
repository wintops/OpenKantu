unit kantu_loadSymbol;

{$IFNDEF DELPHI}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFDEF DELPHI}
  Grids, ExtCtrls,
  {$IFDEF VCL}
  Vcl.CheckLst,
  {$ENDIF}
{$ELSE}
  // ZMConnection, ZMQueryDataSet, FileUtil, DbCtrls, DBGrids, db,
{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, // CheckLst,
  StdCtrls, kantu_definitions, kantu_simulation, kantu_singleSystem;

type

  { TloadSymbol }

  TloadSymbol = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SymbolsList: TListBox;

    Label1: TLabel;
    SymbolsGrid: TStringGrid;
    procedure LoadData(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure UpdateData(Sender: TObject);
{$IFNDEF DELPHI}
    Datasource1: TDatasource;
    SymbolsGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    ZMConnection1: TZMConnection;
    ZMQueryDataSet1: TZMQueryDataSet;

{$ENDIF}
  private
    { private declarations }
  public
    { public declarations }

    procedure updateIndicatorLoadedSymbols;

  end;

var
  loadSymbol: TloadSymbol;

implementation

{$IFDEF DELPHI}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}

{ TloadSymbol }
uses kantu_main, kantu_indicators;

procedure TloadSymbol.updateIndicatorLoadedSymbols;
var
  i: integer;
begin

  LoadedIndiHistoryData := nil;
  SingleSystem.SymbolsCombo.Clear;
{$IFDEF DELPHI}

{$IFDEF LLCL}
     i:= SymbolsList.ItemIndex;
     if i>=0 then
      begin
      LoadIndicatorsAndHistory(GetCurrentDir+'/data/' + loadSymbol.SymbolsGrid.Cells[1,i+1]);
      SingleSystem.SymbolsCombo.Items.Add(SymbolsList.Items[i]);
      end;

{$ELSE}
  for i := 0 to SymbolsList.Count - 1 do
  begin

    if SymbolsList.Selected[i] then
    begin
      LoadIndicatorsAndHistory(GetCurrentDir+'/data/' + loadSymbol.SymbolsGrid.Cells[1,i+1]);
      SingleSystem.SymbolsCombo.Items.Add(SymbolsList.Items[i]);
      break;
    end;

  end;
 {$ENDIF}

  if Length(LoadedIndiHistoryData) = 0 then
    ShowMessage('Data not found');
{$ELSE}
  for i := 0 to SymbolsList.Count - 1 do
  begin

    if SymbolsList.Checked[i] then
    begin
      loadSymbol.ZMQueryDataSet1.SQL.Clear;
      loadSymbol.ZMQueryDataSet1.SQL.Add('SELECT * FROM symbols');
      loadSymbol.ZMQueryDataSet1.SQL.Add('WHERE Symbol = ' +
        SymbolsList.Items[i]);
      loadSymbol.ZMQueryDataSet1.QueryExecute;
      if FileExists(SymbolsGrid.DataSource.DataSet.Fields[1].AsString) = false
      then
      begin
        ShowMessage
          ('Selected history file does not exist. Please check path to be valid.');
        Exit;
      end;

      LoadIndicatorsAndHistory(SymbolsGrid.DataSource.DataSet.Fields[1]
        .AsString);
      SingleSystem.SymbolsCombo.Items.Add(SymbolsGrid.DataSource.DataSet.Fields
        [0].AsString);

    end;

  end;

  if Length(LoadedIndiHistoryData) = 0 then
    ShowMessage
      ('No instruments were selected for loading. Make sure you check the checkbox for the instruments you wish to load');

  loadSymbol.ZMQueryDataSet1.SQL.Clear;
  loadSymbol.ZMQueryDataSet1.SQL.Add('SELECT * FROM symbols');
  loadSymbol.ZMQueryDataSet1.QueryExecute;
{$ENDIF}
end;

procedure TloadSymbol.Button1Click(Sender: TObject);
begin
{$IFNDEF DELPHI}
  ZMQueryDataSet1.TableName := 'symbols';
  ShowMessage('Dataset is going to be saved to: ' +
    ZMQueryDataSet1.ZMConnection.DatabasePathFull + ZMQueryDataSet1.TableName
    + '.csv');
  ZMQueryDataSet1.SaveToTable(';');

  loadSymbol.SymbolsList.Clear;

  loadSymbol.Datasource1.Enabled := false; // Manual refresh of linked DBGrid
  loadSymbol.Datasource1.Enabled := True;
  loadSymbol.ZMQueryDataSet1.SQL.Clear;
  loadSymbol.ZMQueryDataSet1.SQL.Add('SELECT * FROM symbols');
  loadSymbol.ZMQueryDataSet1.QueryExecute;

  with loadSymbol.SymbolsGrid.DataSource.DataSet do
    // begin
    // first;
    while not loadSymbol.SymbolsGrid.DataSource.DataSet.EOF do
    begin
      loadSymbol.SymbolsList.Items.Add(loadSymbol.SymbolsGrid.Columns[0]
        .Field.AsString);
      loadSymbol.SymbolsGrid.DataSource.DataSet.Next;
    end;
{$ENDIF}
end;

procedure TloadSymbol.Button2Click(Sender: TObject);
var
  symbol, datafile, timeframe, minStop, slippage, spread, contractSize,
    commission, isVolume, pointConversion, roundLots: string;
  database: TStringList;
begin
  symbol := InputBox('Symbol', 'Please enter the desired symbol name', '');

  ShowMessage('Please now select the data file that you want to use.');

  datafile := '';

  If OpenDialog1.Execute then
    datafile := OpenDialog1.FileName;

  if datafile = '' then
  begin
    ShowMessage
      ('No valid data file selected. Aborting new instrument addition');
    Exit;
  end;

  timeframe := InputBox('Timeframe',
    'Please enter the time frame for the data in minutes', '');
  slippage := InputBox('Slippage',
    'Please enter the maximum slippage desired', '');
  spread := InputBox('Spread', 'Please enter the spread used', '');
  contractSize := InputBox('Contract size',
    'Please enter the dollar values per pip when trading the standard contract size (1 lot)',
    '');
  commission := InputBox('Commission',
    'Please enter the commission charger per trade in USD', '');
  isVolume := InputBox('Volume',
    'Does the data contain volume information ? (0=no, 1=yes))', '');
  pointConversion := InputBox('Point Conversion',
    'Please enter the multiplication factor to convert from absolute price value to pips',
    '');
  roundLots := InputBox('Lot size rounding',
    'To how many decimal places do you want to round lot sizes?', '');
  minStop := InputBox('Min stop size',
    'How many price units do you want to have as a minimum SL/TP distance? (Should be number with decimal, if you want 0 type 0.0)',
    '');

  database := TStringList.Create;

{$IFDEF DARWIN}
  database.LoadFromFile(GetCurrentDir +
    '/kantu.app/Contents/MacOS/symbols/symbols.csv');
{$ELSE}
  database.LoadFromFile(GetCurrentDir + '/symbols/symbols.csv');
{$ENDIF}
  database.Add(symbol + ';' + datafile + ';' + timeframe + ';' + slippage + ';'
    + spread + ';' + contractSize + ';' + commission + ';' + isVolume + ';' +
    pointConversion + ';' + roundLots + ';' + minStop);

{$IFDEF DARWIN}
  database.SaveToFile(GetCurrentDir +
    '/kantu.app/Contents/MacOS/symbols/symbols.csv');
{$ELSE}
  database.SaveToFile(GetCurrentDir + '/data/symbols.csv');
{$ENDIF}
  database.Free;

{$IFNDEF DELPHI}
  loadSymbol.SymbolsList.Clear;

  loadSymbol.Datasource1.Enabled := false; // Manual refresh of linked DBGrid
  loadSymbol.Datasource1.Enabled := True;
  loadSymbol.ZMQueryDataSet1.SQL.Clear;
  loadSymbol.ZMQueryDataSet1.SQL.Add('SELECT * FROM symbols');
  loadSymbol.ZMQueryDataSet1.QueryExecute;

  with loadSymbol.SymbolsGrid.DataSource.DataSet do
    // begin
    // first;
    while not loadSymbol.SymbolsGrid.DataSource.DataSet.EOF do
    begin
      loadSymbol.SymbolsList.Items.Add(loadSymbol.SymbolsGrid.Columns[0]
        .Field.AsString);
      loadSymbol.SymbolsGrid.DataSource.DataSet.Next;
    end;
{$ENDIF}
end;

procedure TloadSymbol.LoadData(Sender: TObject);
begin
  Hide;
  updateIndicatorLoadedSymbols;
  MainForm.simulationTime := 0;
  MainForm.simulationRuns := 0;
  MainForm.simulationType := SIMULATION_TYPE_INDICATORS;

end;

procedure TloadSymbol.UpdateData(Sender: TObject);
var
  database: TStringList;
  i: integer;
begin

  loadSymbol.SymbolsList.Clear;

{$IFDEF DELPHI}
  database := TStringList.Create;
{$IFDEF DARWIN}
  database.LoadFromFile(GetCurrentDir +
    '/kantu.app/Contents/MacOS/symbols/symbols.csv');
{$ELSE}
  database.LoadFromFile(GetCurrentDir + '/data/symbols.csv');
{$ENDIF}
  SymbolsGrid.RowCount := database.Count;

  for i := 0 to database.Count - 1 do
  begin

  {$IFNDEF LLCL}
  SymbolsGrid.Rows[i].CommaText := database.Strings[i];
  {$ELSE}
 SymbolsGrid.Rows[i].CommaText := database.Strings[i];
{$ENDIF}

    if(i>0) then
     SymbolsList.Items.Add(SymbolsGrid.Cells[0, i]);
  end;

  database.Free;

{$ELSE}
  loadSymbol.Datasource1.Enabled := false; // Manual refresh of linked DBGrid
  loadSymbol.Datasource1.Enabled := True;

  loadSymbol.ZMQueryDataSet1.SQL.Clear;
  loadSymbol.ZMQueryDataSet1.SQL.Add('SELECT * FROM symbols');
  loadSymbol.ZMQueryDataSet1.QueryExecute;

  with loadSymbol.SymbolsGrid.DataSource.DataSet do
    // begin
    // first;
    while not loadSymbol.SymbolsGrid.DataSource.DataSet.EOF do
    begin
      loadSymbol.SymbolsList.Items.Add(loadSymbol.SymbolsGrid.Columns[0]
        .Field.AsString);
      loadSymbol.SymbolsGrid.DataSource.DataSet.Next;
    end;

  // loadSymbol.SymbolsGrid.Columns[0].Width := 150;
  // loadSymbol.SymbolsGrid.Columns[1].Width := 250;
{$ENDIF}

{$IFNDEF LLCL}
SymbolsList.Selected[0]:=True;
 {$ENDIF}
  SymbolsList.ItemIndex:=0;

end;

end.
