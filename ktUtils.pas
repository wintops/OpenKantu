unit ktUtils;

interface

uses Classes,SysUtils;



procedure ParseDelimited(const sl: TStrings; const value: string;
  const delimiter: string);


{$IFDEF LLCL}

{
todo:
CommaText

}

type TFormatSettings=record
   ShortDateFormat :string;
  DateSeparator :string;
 DecimalSeparator :string;
end;

function FormatDateTime(const Format: string; DateTime: TDateTime): string;
function FloatToStr(Value: Extended): string;
function StrToFloat(const S: string): Extended;
function StrToFloatDef(const S: string; const Default: Extended): Extended;
function TryStrToFloat(const S: string; out Value: double): Boolean;

function BoolToStr(Value: Boolean): string;
function StrToBoolDef(const S: string;const default:boolean):  Boolean;
function StrToDateTime(const S: string): TDateTime;overload;
function StrToDateTime(const S: string; const AFormatSettings: TFormatSettings): TDateTime;overload;




var
FormatSettings:TFormatSettings;

{$ENDIF}



implementation


{$IFDEF LLCL}
function StrToDateTime(const S: string): TDateTime;
begin
  result:=Now;
end;

function StrToDateTime(const S: string; const AFormatSettings: TFormatSettings): TDateTime;

begin
  result:=Now;
end;
function FormatDateTime(const Format: string; DateTime: TDateTime): string;
begin
  result:='';
end;

function FloatToStr(Value: Extended): string;
begin
  result:=inttostr(round(value));
end;

function BoolToStr(Value: Boolean): string;
begin
 if value then

  result:='True'
  else result:='False';
end;
function StrToFloat(const S: string): Extended;
begin
  result:=0;
end;

function StrToFloatDef(const S: string; const Default: Extended): Extended;
begin
  result:=default;
end;

function TryStrToFloat(const S: string; out Value: double): Boolean;

begin
  result:=false;
end;

function StrToBoolDef(const S: string;const default:boolean):  Boolean;
begin
  result:=default;
end;
{$ENDIF}

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
