
program parcial;
type 
    viajes = record 
        codigo:integer;
        num_coche:1..2500;
        mes:1..12;
        cantPasajes:integer;
        dni:integer;
    end;

    lista = ^nodo;
    nodo = record;
        datos:lista;
    end;

    vector = array [1..2500] of integer;
    vectorMes = array [1..12] of integer;

procedure masviajes ();
begin 
    for i:= 1 to 1200 do begin
        if (cantviajes > max) then 
            max:= cantviajes;
            puntoA := v[i];
    end;
end; 

procedure listaviaje ();
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= sig;
end;

function cumple (d:viaje; v:vector):boolean;
begin 
    cumple:=  (d.dni mod 10 = 0) and (d.mes = 2) and (d.cantPasajes < v[cod_coche]);
end;


procedure procesarDatos ();
begin 
    inivector();
    while (L <> nil) do begin 
        leer();
        masviajes();
        cumple();
        if (cumple = true) then 
            listaviaje();
        end;
    end;

    writeln('puntoA', puntoA);
    writeln('promedio: ', promeido);
end;

function promedios (v:vector);
begin 
    promedio := cantviajes/cantPasajes;
else 
    promedio := 0;
end;

var 
    v:vector;
    v:vectorMes;
    L:lista;
    d:viajes;
begin 
    L:= nil;
    procesarDatos(v,d,cantviajes)
end.
