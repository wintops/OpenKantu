unit kantu_utils;

interface

uses SysUtils;

function FormatDateTime(const Format: string; DateTime: TDateTime): string;
function FloatToStr(Value: Extended): string;
function StrToFloat(const S: string): Extended;
function BoolToStr(Value: Boolean): string;
function StrToDateTime(const S: string): TDateTime;


implementation

function StrToDateTime(const S: string): TDateTime;
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

end.
