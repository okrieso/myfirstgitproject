unit DateTimeMethods;
interface
///возращает истину если год високосный 
function IsLeapYear(year: integer): boolean;
///находит количество дней в месяце
function DaysInMonth(month, year: integer): integer;

function LaterInYear(p1, p2: DateTime): DateTime;

function DaysInYear(year: integer): integer;

function DaysInYearRange(year1, year2: integer): integer;

function SecondsInHours(hours: integer): integer;

function monthtoday(p:Datetime):integer;

implementation

function isLeapYear(year: integer): boolean;
begin
  result:=false;
  if (year mod 4) = 0 then
    result:=true;
  if ((year mod 100) = 0) and not((year mod 400) = 0) then
    result:=false;
end;

function DaysInMonth(month, year: integer): integer;
begin
  case month of
    1,3,5,7,8,10,12: result:=31;
    4,6,9,11: result:=30;
    2: begin
    result:=28;
    if isLeapYear(year) then
      result:=29;
    end;
  end;
end;

function monthtoday(p:Datetime):integer;
begin
  result:=p.day;
  for var i:=1 to p.month do 
  begin
    result+=DaysInMonth(p.Month, p.Year);
  end;
end;

function LaterInYear(p1, p2: DateTime): DateTime;
begin
  var d1:=monthToDay(p1);  
  var d2:=monthToDay(p2);
  result:=p1;
  if d2 > d1 then
    result:=p2;
end;

function DaysInYear(year: integer): integer;
begin
  result:=365;
  if isLeapYear(year) then
    result:=366;
end;

function DaysInYearRange(year1, year2: integer): integer;
begin
  result:=0;
  for var i:=year1 to year2 do
    result+=DaysInYear(i);
end;

function SecondsInHours(hours: integer): integer;
begin
  result:=hours*3600;
end;

begin  
end.