

una carniceria necesita analizar la informacion de las compras a frigorificos realizadas en el ultimo año
a) realizar un modulo que cargue en una estructura de datos adecuada la informacion de las compras
de cada compra se conoce el monto abonado, el mes en que se realizo la compra, la cantidad de kilos de carge comprados 
y el nombre del frigorifico. por cada frigorifico puede haber mas de una compra. la informacion de las compras debe 
quedar ordenada por nombre de frigorifico. la lectura finaliza al ingresar la compra con 100 kilos de carne que debe procesarse 

b) realizar un programa que utilice la informacion generada en el inciso a) e informe 
i) los nombres de los frigorificos para los cuales el monto total facturado supero los 45.0000
ii) los dos meses en los que se realizaron menor cantidad de compras 
iii) el monto promedio de las compras realizadas durante el mes de septiembre



program ej;
type 
    compra = record 
        monto:real;
        mes:1..12;
        cantKG:real;
        nombre:string;
    end;

    lista = nodo 
    nodo = record 
        data:compra;
        sig:lista;
    end;

    vmes = array [1..12] of integer;

procedure procesardatos(L:lista);
var 
    vm:vmes; montoTotal:real; min1,min2:integer; p1,p2:real;
    nombreACT:string; promedio:real;
begin 
    min1:= 999; min2:= 999; p1:= 0; p2:= 0;
    inivector(vm:vmes);
    while (L <> nil) do begin 
        nombreACT:= L^.data.nombre;
        montoTotal:= 0;
        while (L <> nil) and (L^.data.nombre = nombreACT) do begin 
            montoTotal:= L^.data.monto + montoTotal;

            vm[L^.data.mes]:= vm[L^.data.mes] +1;

            if (L^.data.mes = 9) then 
                cantC:= cantC +1;
        
        L:= L^.sig;
        end;

        if (montoTotal > 45.000) then 
            writeln(L^.data.nombre);
        
    end;
    puntoB(vm,min1,min2,p1,p2);
    writeln(p1,p2);

    promedio:= montoTotal/cantC;
    writeln(promedio);

end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);

end.


