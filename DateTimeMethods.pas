unit DateTimeMethods;
interface
///возращает истину если год високосный 
function IsLeapYear(year: integer): boolean;
///находит количество дней в месяце
function DaysInMonth(month, year: integer): integer;
///находит время, ближайшее к 12 часам
function LaterInDay(p1, p2: DateTime): DateTime;
{
function LaterInYear(p1, p2: DateTime): DateTime := p1;

function DaysInYear(year: integer): integer := 0;

function DaysInYearRange(year1, year2: integer): integer := 0;

function SecondsInHours(hours: integer): integer := 0;
}
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

function LaterInDay(p1, p2: DateTime): DateTime;
begin
  var s1, s2: integer;
  s1:=p1.Hour*3600+p1.Minute*60+p1.Second;    
  s2:=p2.Hour*3600+p2.Minute*60+p2.Second;
  result:=p2;
  if s1 > s2 then
    result:=p1;
end;

begin  
end.