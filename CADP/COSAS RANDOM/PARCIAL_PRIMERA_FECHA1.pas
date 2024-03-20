
. una empresa de ventas de tickets esta analizando la informacion de los cantViajes
realizados por sus trenes durante el año 2022 para ello, se dispone de una estructura
de datos con la informacion de todos los viajes. de cada viaje se conoce le CODIGO DEL TREN,
EL MES en el que se realizo el viaje (entre 1 y 12) LA CANTIDAD DE PASAJEROS QUE VIAJARON y  
EL CODIGO de la ciudad de destino (entre 1 y 20) la informacion se encuentra ordenada por codigo de tren 
ademas la empresa dispone de una estructura de datos con informacion del costo del ticket por 
ciudad destino 

realizar un programa que procese la info de los viajes y 
1. genera una lista por cada codigo del tren, la cantidad de viajes realizados 
2. infome el mes con mayor monto recaudado 
3. informe el promedio de pasajeros por cada tren entre sus viajes 



program parcial;
type 
    rangoMeses = 1..12;
    rangoCiudades = 1..20;

    viaje = record 
        tren:integer;
        mes:rangoMeses;
        pasajeros: integer;
        destino:rangoCiudades;
    end;

listaViajes = ^nodoviajes;
nodoviajes = record 
    dato:viaje;
    sig:listaViajes;
end;

vector = array [rangoCiudades] of real;

infoTren = record 
    tren:integer;
    cant:integer;
end;

procedure cargarlista(var L:listaViajes);
procedure cargarVector(var v:vector);

procedure inicializarVector (var v:vector)
var 
    i:rangoMeses;
begin 
    for i:=1 to 12 do v[i] := 0;
end;

procedure maximo (v:vector): real;
var 
    max:real;
    masMax,i:rangoMeses;
begin 
    max:= -1;
    for i:=1 to 12 do begin 
        if (v[i] > max) then 
            max:= v[i];
            mesmax:= i;
    end;
end;

procedure procesarViajes(L:listaViajes; v:vector; var L2:listaTrenes);
var 
    trenActual,cantViajes:integer;
begin 

    while (L <> nil) do begin 
        trenActual:=L^.dato.tren;
        cantViajes := 0;
        cantPasajeros:= 0;
        while (L <> nil) and (trenActual = L^.dato.tren) do begin 
            cantViajes:= cantViajes +1;
            cantPasajeros := cantPasajeros + L^.dato.pasajeros;
            costo := v[L^.dato.pasajero] * L^.dato.pasajero;
            v2[L^.dato.mes] := v2[L^.dato.mes] + costo;

            L:= L^.sig;
        end;
            infoTren.tren := trenActual;
            infoTren.cant := cantPasajerosM
            agregarAdelante(L2,infoTren);
            writeln('promedio de pasajeros', trenActual,'es',cantPasajeros/cantViajes);
        end;
    end;
var 
    L:lista;
    v:vector;
    trenes:listaTrenes;
    recaudaciones:vector;
begin 
    cargarlista(L);
    cargarVector(v);
    listaTrenes:= nil;

    inicializarVector(v);

    procesarViajes(L,v,listaTrenes,recaudaciones);
    writeln('el mes con mayor recaudacion fue ', maximo(recaudaciones));

end.
