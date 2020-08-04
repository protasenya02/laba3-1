Program laba3;
{$APPTYPE CONSOLE}

uses
  SysUtils;


var

  f1, f2, h, x, eps, PredStep, CurrStep, chisl: real;
  k, N, i: byte;

Begin

  writeln('------------------------------------------------------------------------');
  writeln('|       |        |     e=10^-2     |     e=10^-3     |     e=10^-4     |');
  writeln('|   x   |  f1(x) |------------------------------------------------------');
  writeln('|       |        |  f2(x) |   N    |  f2(x) |   N    |  f2(x) |   N    |');
  writeln('------------------------------------------------------------------------');
  x := -0.6; // начальное значение
  h := 0.05; // шаг

  for i := 1 to 20 do
  begin

    f1 := 2 * x / 3 + 2 * x * x * x / 9 - x * x * x / 3 * ln(1 - x * x) - 2 / 3 * arctan(x); // подсчет функции 1
    write('|', x:7:2, '|', f1:8:4, '|');

    k := 1;
    N := 0;
    CurrStep := 0;
    eps := 0.01;
    f2 := 0;
    chisl := x * x * x * x * x;

    repeat // подсчет функции 2

      PredStep := CurrStep;
      CurrStep := chisl / (k * (2 * k + 3));
      k := k + 1;
      N := N + 1;
      f2 := f2 + CurrStep;

      if Abs(abs(CurrStep)- abs(PredStep)) < eps then  //условие изменения точности

      begin
        write(f2:8:4, '|', N:8, '|');
        eps := eps / 10;           // изменение точности
      end;

      chisl := chisl * x * x;    // домножение числителя на коэффициент

    until (eps < 0.0001);     // условие выхода из цикла и остановки вычислений

    writeln;
    x := x + h + 0.0000001;

  end;
  writeln('------------------------------------------------------------------------');
  readln;

end.
