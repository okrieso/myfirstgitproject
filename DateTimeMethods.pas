unit DateTimeMethods;
interface
///возращает истину если год високосный 
function IsLeapYear(year: integer): boolean;
///находит количество дней в месяце
function DaysInMonth(month, year: integer): integer;

function LaterInDay(p1, p2: DateTime): DateTime;

function LaterInYear(p1, p2: DateTime): DateTime;
{
function DaysInYear(year: integer): integer := 0;

function DaysInYearRange(year1, year2: integer): integer := 0;

function SecondsInHours(hours: integer): integer := 0;
}
function monthtoday(p:Datetime):integer;

implementation

function isLeapYear(year: integer): boolean;
begin
  result:=false;
  if (year mod 4) = 0 then
    result:=true;
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

begin  
end.