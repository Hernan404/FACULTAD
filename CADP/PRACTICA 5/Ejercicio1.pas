program punteros;

type
cadena = string[50];
puntero_cadena = ^cadena;

var
pc: puntero_cadena;

begin
writeln(sizeof(pc), ' bytes');  /sizeof retorna catidad de bytes  char = 1 byte/
new(pc);
writeln(sizeof(pc), ' bytes'); /imprime la cantidad de bytes/
pc^:= 'un nuevo nombre';
writeln(sizeof(pc), ' bytes');
writeln(sizeof(pc^), ' bytes'); /imprime la cantiad de bytes de "un nuevo nombre"/
pc^:= 'otro nuevo nombre distinto al anterior';
writeln(sizeof(pc^), ' bytes');
end.
