un supermercado esta procesando las compras que realizaron sus clientes. para ello, dispone de una
estructura dedatos con todas las ocmpras realizadas, sin ningun orden en particular. de cada compra 
se conoce: codigo, año (entre 1980 y 2024); monto y DNI del cliente un cliente 
puede haber realizado mas de una compra 
realizar un programa procese la informacion de las compras y 

A. Almacene en otra estructura de datos las compras realizadas entre los años 2010 y 2020. esta 
estructura debe quedar ordenada por el DNI del cliente 

B. una vez almacenada la estructura del inciso A, procesar estos datos e informar.
    1. el año con menor facturacion 
    2. los dos DNI de los clientes que realizaron mayor cantidad de compras 
    3. monto total facturado de compras con codigo multiplo de 10


program TEMA2;
type
    rango_años = 1980..2024;

    compra = record 
        codigo:integer;
        año:rango_años;
        monto:real;
        DNI:integer;
    end;

    lista = ^nodo;
    nodo = record 
        data:compra;
        sig:lista;
    end;

    vector = array [2010..2020] of real;

procedure inivector(var v:vector);

procedure cargardatos(L:lista; var L2:Lista; a1,a2:rango_años);
begin 
    while (L <> nil) do begin 
        if (L^.data.año >= a1) and (L^.data.año <= año2) then 
            armarlista2(L2,L^.data);
        L:= L^.sig;
    end;
end;    

procedure armarlista(var L:lista); //se dispone
procedure armarlista2(var L:lista; r:compra);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := per;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.datos.nombre < per.nombre) do //De menor a mayor
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

var 
    L,l2:lista;
    año:rango_años;
begin
    L2:= nil;
    cargarlista(L);
    readln(año);
    cargardatos(L,L2,2010,2020);
    procesardatos(L2);
end.
