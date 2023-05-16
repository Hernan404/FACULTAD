
a) program punteros;
type
cadena = string[50];
puntero_cadena = ^cadena;

var
pc: puntero_cadena;
begin
pc^:= 'un nuevo texto';
new(pc);
writeln(pc^);
end.


program punteros;

type
cadena = string[50];
puntero_cadena = ^cadena;
var
pc: puntero_cadena;

begin
new(pc);  /reserva espacio en la memoria/
pc^:= 'un nuevo nombre';  /ingresa el texto en lo que apunta pc/
writeln(sizeof(pc^), ' bytes'); /imprime la cantidad de bytes de lo que apunta pc/
writeln(pc^); /imrime un "un nuevo nobmre"/
dispose(pc); /libera el espacio en la memoria y queda vacio/
pc^:= 'otro nuevo nombre'; /ingresa el texto en lo que apunta pc/
end.




c) program punteros;
type
cadena = string[50];
puntero_cadena = ^cadena;


procedure cambiarTexto(pun: puntero_cadena);
begin
pun^:= 'Otro texto';
end;

var
pc: puntero_cadena;

begin
new(pc);
pc^:= 'Un texto';
writeln(pc^);
cambiarTexto(pc); /cambia el texto "un texto" por "otro texto"/
writeln(pc^);
end.


d) program punteros;
type
cadena = string[50];
puntero_cadena = ^cadena;


procedure cambiarTexto(pun: puntero_cadena);
begin
new(pun);
pun^:= 'Otro texto';
end; /agrega un nuevo espacio de memoria y le pone "otro texto" no cambia nada/ 

var
pc: puntero_cadena;

begin
new(pc);
pc^:= 'Un texto';
writeln(pc^);
cambiarTexto(pc);
writeln(pc^);
end.
