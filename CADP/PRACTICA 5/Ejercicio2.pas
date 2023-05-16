program punteros;

type
cadena = string[20];
producto = record
    codigo: integer;
    descripcion: cadena;
    precio: real;

end;
puntero_producto = ^producto;

var
p: puntero_producto;
prod: producto;

begin
writeln(sizeof(p), ' bytes'); {imprime la cantida de bytes de P ""4 BYTES MAS LO QUE DE EL TEXTO"" }
writeln(sizeof(prod), ' bytes');
new(p);
writeln(sizeof(p), ' bytes');
p^.codigo := 1; {codigo en 1 lo que apunta}
p^.descripcion := 'nuevo producto'; {desc texto lo que apunta}
writeln(sizeof(p^), ' bytes'); {imprime la cantidad de bytes de lo que apunta}
p^.precio := 200; {precio en 200 lo que apunta}
writeln(sizeof(p^), ' bytes'); {imprime la cantiad de bytes de lo que apunta}
prod.codigo := 2; {codigo de lo que apunta en 2, es como guardar en otro registro distinto}
prod.descripcion := 'otro nuevo producto'; {lo mismo de arriba guarda el texto en otro registro el prod}
writeln(sizeof(prod), ' bytes'); {imprime la cantidad de bytes de prod}
end.
