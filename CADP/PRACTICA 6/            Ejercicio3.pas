program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
end;
//________________________________________________________________________________________________________
procedure armarNodo(var L: lista; v: integer);
var
    aux,nue : lista;
begin
    new(aux);   {agregar memoria}
    aux^.num := v;   {datos en la memoria}
    aux^.sig := nil;    {siguiente posicion}
    if L <> nil then begin   { si la lista no termino entonces}
        aux:= L;    {lista en auxiliar}
        while (aux^.sig <> nil) do aux^.sig; {mientras la posicion siguiente no sea el final entonces que siga}
        aux^.sig:= nue;
    end;
    else
        L:=nue; {si es el final acaba}
end;

//________________________________________________________________________________________________________
procedure imprimirNodo(ListaF:lista);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num) ;
        ListaF:= ListaF^.sig
    end;
end;
//________________________________________________________________________________________________________
procedure imprimirSuma(ListaF:lista;valorF:integer);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num+valorF) ;
        ListaF:= ListaF^.sig
    end;
end;
//________________________________________________________________________________________________________
var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do
       begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    //c
    imprimirNodo(pri);
    //d
    ReadLn(valor);
    imprimirSuma(pri,valor);
end.
