{un supermercado esta procesando las compras que realizaron sus clientes. para ello, dispone de una 
estructura de datos con todas las compras sin ningun orden en particular, de cada compra se conoce codigo, mes, año (entre 2014 y 2024), monto y el DNI del cliente. 
un cliente puede haber realizado mas de una compra.
realizar un programa lea de teclado un año y luego:

A. Almacene en otra estructura de datos las compras realizadas en el año leido. esta estructura debe
quedar ordenada por DNI del cliente

B. una vez almacenada la informacion, procese los datos del inciso a. e informe:
    1. para cada cliente, el monto total facturado entre todas sus compras 
    2. los dos meses con menor facturacion
    3. la cantidad de compras con codigo multiplo de 10}



program PARCIAL;
type 
    compras = record 
        codigo:integer;
        mes:1..12;
        año:2014..2024;
        monto:real;
        dni:integer;
    end;

    lista = ^nodo;
    nodo = record 
        data:codigo;
        sig:lista;
    end;

    vmes = array[1..12] of real;

procedure cargarcompras(var L:lista); // se dispone

Procedure InsertarElemento ( var pri: lista; r:compras);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := r;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.dni < r.dni) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;



procedure cargardatos(var L,L2:lista; año:2014..2024);
begin 
    while (L <> NIL) do begin 
        if (L^.data.año = año) then 
            armarlista2(L2,L);
        L:= L^.sig;
    end;
end;

procedure puntoB (vm:vmes; var min1,min2:real; var p1,p2:integer);
var 
    i:integer;
begin 
    for i:=1 to 12 do begin 
        if (vm[i] < min1) then begin 
            min2:= min1;
            p2:= p1;
            min1:= vm[i];
            p1:= i;
        end 
        else if (min1 < min2) then begin 
            min2:= v[i];
            p2:= i;
        end;
    end;
end;

procedure procesardatos (L2:lista; va:vanios);
var 
    vm:vmes; montoTotal:real; cant3:integer;
    min1,min2:real; p1,p2:integer;
begin 
    min1:= 999; min2:= 999; p1:= 0; p2:= 0;
    cant3:= 0;
    inivector(vm);
    while (L2 <> nil) do begin 
        clienteACT:= L2^.data.DNI;
        montoTotal:= 0;
        while (L2 <> nil) and (clienteACT = L2^.data.DNI) do begin 
            montoTotal:= L2^.data.monto + montoTotal;
        
            vm[L2^.data.mes]:= vm[L2^.data.mes] + montoTotal;

            if (L2^.data.codigo mod 10 = 0) then 
                cant3:= cant3 +1;
        L:= L^.sig;
        end;

        writeln(montoTotal);
    end;
        puntoB(vm,min1,min2,p1,p2);
        writeln(p1,p2);

        writeln(cant3);
end; 

var 
    L:lista; va:vanios;
begin 
    L:= nil; 
    cargarcompras(L)
    cargardatos(L2);
    procesardatos(L2,va);
end.
