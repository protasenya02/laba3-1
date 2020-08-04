program laba3dop11;
uses
  System.SysUtils;

var
  a, b, h, x: real;
procedure Myfunction(x: real);
var
  slt, s, n, y: real;
begin
  y := 0;
  s := 1;
  slt := x;
  n := 1;
  while abs(slt) > 0.001 do

  begin
    s := s + slt;
    n := n + 1;
    slt := slt * x / n;
  end;
  y := x * s / (1 + x * x * x * x);
  writeln('x=', x:7:3, '    y=', y:7:3);
end;

begin
  writeln('Enter the initial value of x');
  readln(a);
  writeln('Enter the final value of x');
  readln(b);
  writeln('Enter a step value');
  readln(h);

  x := a;
  if ((a < b) and (h <= 0)) or ((a > b) and (h >= 0)) then
  begin
    Myfunction(x);
    Myfunction(b);
  end
   else
    if h > 0 then
    begin
      while x < b - h / 10 do
      begin
        Myfunction(x);
        x := x + h;
      end;
      Myfunction(b);
    end
      else
      begin
        while x > b - h / 10 do
        begin
          Myfunction(x);
          x := x + h;
        end;
        Myfunction(b);
      end;
  readln;
end.
