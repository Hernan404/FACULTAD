{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados, manteniendo un puntero al último ingresado.}
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
    act, nue : lista;
begin 
 new (nue);
 nue^.num:= v;
 nue^.sig := NIL;
 if L <> Nil then 
 begin
    act := L ;
    while  (act^.sig <> NIL ) do 
        act := act^.sig ;
        act^.sig := nue ;
    end
    else
        L:= nue;
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

procedure maximos (listaF:lista; max:integer);
begin 
    if (listaF^.num > max) then begin 
        max:= listaF^.num; 
        listaF:= listaF^.sig
    end;
end;

procedure minimos (listaF:lista; min:integer);
begin 
    if (listaF^.num < min) then begin 
        min:= listaF^.num;
        listaF:= listaF^.sig
    end;
end;
procedure multiplo (var listaF:lista; var resultado:integer);
var 
    A:integer;
begin 
    A:= 4;
    if (listaF^.num MOD A = 0) then 
        resultado:= listaF^.num; 
        listaF:= listaF^.sig 
end;





var
    L : lista;
    valor : integer;
    max,min:integer;
    resultado:integer; 
begin
    max:= -1;
    min:= 9999;

    L := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do
       begin
        armarNodo(L, valor);
        writeln('Ingrese un numero');
        read(valor);
        maximos (lista,max);
        minimos (lista,min);
        multiplo (lista,resultado);

    end;
    
    
    //c
    imprimirNodo(L);
    //d
    ReadLn(valor);
    imprimirSuma(L,valor);
end.
