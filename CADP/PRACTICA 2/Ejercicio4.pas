4. Dado los siguientes programas, explicar la diferencia.

program alcance4a;                          
var a,b: integer;
procedure uno;
begin
a := 1;
writeln(a);
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.



program alcance4b;
procedure uno;
begin
a := 1;
writeln(a);
end;
var a,b: integer;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.


ALCANZE A TIENE VARIABLES GLOBALES Y B NO TIENE, B NO FUNCIONARIA
