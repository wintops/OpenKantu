unit ktUtils;

interface

uses Classes,SysUtils;

function FormatDateTime(const Format: string; DateTime: TDateTime): string;
function FloatToStr(Value: Extended): string;
function StrToFloat(const S: string): Extended;
function BoolToStr(Value: Boolean): string;
function StrToDateTime2(const S: string): TDateTime;
procedure ParseDelimited(const sl: TStrings; const value: string;
  const delimiter: string);

implementation

function StrToDateTime2(const S: string): TDateTime;
begin
  result:=Now;
end;

function FormatDateTime(const Format: string; DateTime: TDateTime): string;
begin
  result:='';
end;

function FloatToStr(Value: Extended): string;
begin
  result:='';
end;

function BoolToStr(Value: Boolean): string;
begin
  result:='';
end;
function StrToFloat(const S: string): Extended;
begin
  result:=0;
end;

procedure ParseDelimited(const sl: TStrings; const value: string;
  const delimiter: string);
var
  dx: Integer;
  ns: string;
  txt: string;
  delta: Integer;
begin
  delta := Length(delimiter);
  txt := value + delimiter;
  // sl.BeginUpdate;
  sl.Clear;
  try
    while Length(txt) > 0 do
    begin
      dx := Pos(delimiter, txt);
      ns := Copy(txt, 0, dx - 1);
      sl.Add(ns);
      txt := Copy(txt, dx + delta, MaxInt);
    end;
  finally
    // sl.EndUpdate;
  end;
end;

end.
