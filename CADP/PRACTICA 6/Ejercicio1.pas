program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
end;
procedure armarNodo(var L: lista; v: integer);
var
  aux : lista;
begin
  new(aux);
  aux^.num := v;
  aux^.sig := L;
  L := aux;
end;

//punto c)
procedure imprimir(pri:lista; valor:integer);
begin 
  while (pri <> nil) do begin 
      writeln(pri^.valor);
      pri:= pri^.sig;
  end;
end;

//punto d)
procedure incremento(var pri:lista; num:integer; var valor:integer)
begin 
  while (pri <> nil) do begin 
    pri^.valor:= pri^.valor + num;
    pri:= pri^.sig;
  end;
end;

var
pri : lista;
valor : integer;
num:integer;
begin
  pri := nil;
  writeln(‘Ingrese un numero’);
  read(valor);
  while (valor <> 0) then begin
    armarNodo(pri, valor);

    writeln(‘Ingrese un numero’);
    read(valor);
  end;
  imprimir(pri,valor);
  readln(num);
  incremento(pri,valor,num);

end.

{ a) lee numeros y los agrega a la lista 
  b) la secuencia queda 49 10 21 10, en orden en el que fueron ingresados (o leidos) al ser agregar adelante
}
