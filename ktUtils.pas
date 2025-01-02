unit ktUtils;

interface

uses
{$IFDEF LLCL}
LLCLmore,
{$ENDIF}

Classes,SysUtils,StdCtrls;

type
TEditHelper =class helper for TEdit

private

   function GetDate:TDateTime;
   procedure SetDate(d:TDateTime);
public

 property  Date:TDateTime read GetDate write SetDate;
end;


procedure ParseDelimited(const sl: TStrings; const value: string;
  const delimiter: string);





implementation
   procedure TEditHelper.SetDate(d:TDateTime);
   begin
     Text:=DateTimeToStr(d);
   end;

  function TEditHelper.GetDate:TDateTime;
  begin
    result:=StrToDateTime(Text);
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
