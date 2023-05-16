program punteros;
type
numeros = array[1..10000] of integer;
puntero_numeros = ^numeros;

var
n: puntero_numeros;
num: numeros;
i:integer;

begin
writeln(sizeof(n), ' bytes');{ cantidad de bytes de n}
writeln(sizeof(num), ' bytes'); {cantidad de bytes de num}
new(n);
writeln(sizeof(n^), ' bytes'); 

for i:= 1 to 5000 do
    n^[i]:= i; {el for se hace donde apunta n}
    writeln(sizeof(n^), ' bytes'); {imprimo la cantidad de bytes de lo que apunta n}
end.
