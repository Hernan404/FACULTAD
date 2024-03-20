una empresa de venta de pasajes aereos esta analizando la informacion de los viajes
realizados por sus aviones, para ello se dispone de una estructura de datos con la informacion de todos los viajes
de cada viaje se conoce el codigo de avion (entre 1000 y 2500). 
el año que se realizo el viaje, cantidad de pasajeros que viajaron
y ciudad de destino

la info no se encuentra ordenada por ningun criterio,
ademas, la empresa dispone de una estructura de datos con 
informacion sobre la capacidad maxima de cada avion.

realiza un programa que procese la informacion de los viajes e 
    1. informe el codigo del avion que realizo la mayor cantidad de viajes
    2. genere una lista con los viajes realizados en años multiplo de 10 
    con destino "punta cana" en los que el avion no alcanzo su capacidad maxima 
    3. para cada avion, informe el promedio que viajaron entre todos sus viajes 


program parcial1;

type 
    codaviones = 1000..2500;
    viaje = record 
        avion:codaviones;
        año:integer;
        pasajeros: integer;
        ciudad:string;
    end;

    lista = nodo 
    nodo = record 
        dato:viaje;
        sig:lista;
    end;

    vector = array [codaviones] of integer;

procedure cargarLista (var L:lista);
procedure cargarVector(var v:vectorcapacidad);
procedure inicializarVectores(var v1,v2:vectorcapacidad);
var 
    i:codaviones;
begin 
    for i:=1000 to 2500 do begin 
        v1[i]:= 0;
        v2[i]:= 0;
    end;
end;

procedure procesarViajes (L:lista; v:vectorcapacidad; var viajesPorAvion,totalPasajeros:vectorcapacidad; var L2:lista);
var 
    avion:codaviones
begin 
    L2 = nil;
    inicializarVectores(viajesPorAvion,totalPasajeros);
    while (L <> nil) do begin 
        avion := L.dato.avion;
        viajesPorAvion[avion]:= viajesPorAvion[avion] +1;
        totalPasajeros[avion] := totalPasajeros[avion] + L.dato.pasajeros;
        if (cumple(L.dato.v)) then 
            agregarAdelante(puntaCana,L.dato);

        L:= L.sig;
    end;


function cumple (via:viaje; v:vectorcapacidad):boolean,
begin 
    cumple := (via.año MOD 10 = 0) and (via.ciudad = 'punta cana') and (via.pasajeros < v[avion]);
end;

function promedio (pasajeros,viajes:integer) : real;
begin 
        promedio:= pasajeros / viajes
    else 
        promedio:= 0;
end;

function maximo (v:vectorcapacidad):integer;
begin 

end;
var 
    avionMax:integer;
    L,viajesPuntaCana:lista;(
    v,totalPasajeros,viajesPorAvion:vectorcapacidad;

begin 
    cargarLista(L);
    cargarVector(v);

    procesarViajes(L,v,viajesPorAvion,viajesPuntaCana,totalPasajeros);

    avionMax := maximo(viajesPorAvion)
    writeln('puntoa ', avionMax);
    writeln('punto c', i, promedio(totalPasajeros[i],viajesPorAvion[i]));

    for i:=1000 to 2500
end.
