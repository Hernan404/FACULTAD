program esj;
type 
    codigo_avion = 1000..2500;
    anio_viaje = 2015..2020;

    viaje = record 
        codigo:codigo_avion;
        anio:anio_viaje;
        cant_pasajeros:integer;
        ciudad_destino:string;
    end;
    
    lista = ^nodo; 
    nodo = record 
        datos:viaje;
        sig:lista;
    end;

    vector = array [codigo_avion] of integer;
    vector2 = array [anio_viaje] of integer;

procedure leer (d:viajes);
begin 
    writeln('codigo');
    readln(codigo);
    writeln('anio');
    readln(anio);
    writeln('cantidad de pasajeros');
    readln(cant_pasajeros);
    writeln('ciudad de destno');
    readln(ciudad_destino);
end;

procedure cargarVector(v:vector; v2:vector2);
var 
    i:integer;
begin 
    for i:=1000 to 2500 do begin 
        v[i]:= d.codigo;
    end;

    for i:=2015 to 2020 do begin 
        v2[i]:= d.anio;
    end;
end;

procedure inicializar_vector(v:vector; v2:vector2);
var 
    i:integer;
begin 
    for i:=1 to 2500 do begin 
        v[i]:= 0;
    end;

    for i:= 2015 to 2020 do begin 
        v[i]:= 0;
    end;
end;

procedure masviajes (var v:vector; var max:integer; var d:viaje; var cantViajes:integer);
begin 
    if (cantViajes > max) then 
        mas_viajes:=v[i];
        max:=cantViajes;
end;

procedure listaA(var L:lista; d:viajes);
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= sig;
end;

procedure lista (var v2:vector2; d:viajes; L:lista);
var 
    i:integer;
begin 
    for i:= 2015 to 2020 do begin 
    if (v2[i] * 10 / 2 = 0) then  
        listaA(L,d);
    end;
end;

procedure procesarDatos (var v:vector; var max:integer; var d:viaje; var L:lista );
begin 
    inicializar_vector(v,v2); 
    while (L <> 0) do begin 
        leer(d);
        cargarVector(v,v2);
        masviajes(max,d,cantViajes); 
        listaA(L,d);
        lista(v2,d,L);
    end;
end;

var 
    v2:vector2
    v:vector;
    d:viajes;
    L:lista;
    cantViajes:integer;

begin 
    L:= nil;
    cantViajes:= 0;
    max:= -1;

    writeln('codigo con mayor cantidad de viajes', mas_viajes);
    writeln('promedio ', cant_pasajeros/cantViajes);
end.
