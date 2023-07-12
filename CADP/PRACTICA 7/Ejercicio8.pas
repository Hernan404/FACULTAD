8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la 
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de 
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada 
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta 
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia 

(1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura 
no posee orden alguno. 
Se pide:

a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las 
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar 
ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:

b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.

c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo. 

d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las 
cuales el número de cuenta destino posea menos dígitos pares que impares.




program EJ8P7;
type 
    rangomotivo = 1..7;
    transferencia = record 
        numero_origen:integer;
        DNI_origen:integer;
        numero_destino:integer;
        DNI_destino:integer;
        fecha:integer;
        hora:integer;
        monto:real;
        codmotivo:rangomotivo;
    end;

    lista = nodo 
    nodo = record 
        datos:transferencia;
        sig:lista;
    end;

    vector = array [rangomotivo] of integer;

procedure cargarlista(L:lista); {se dispone}


Procedure InsertarElemento ( var pri: lista; per: persona);
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

procedure puntoB ();
begin 
    montoTotal:= montoTotal + v[L.datos.monto]
    vc[L.datos.numero_origen] 
end;
procedure procesarlista (L:lista);
var 
    v:vector;
    t:transferencia;
begin 
    inivector(v);
    while (L <> nil) do begin 




        if (t.DNI_destino <> t.DNI_origen) then begin 
            armarlistaA(L,t);
        end;
    end;
end;

var 
    L:lista;
begin 
    cargarlista(L);
    procesarlista(L);
end.




