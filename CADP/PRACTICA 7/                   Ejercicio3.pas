{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. De
cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y para
un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de
viaje.}

program EJ3P7;

type 
    viaje = record 
        numero: integer;
        codigo: integer;
        dir_origen: integer;
        dir_destino: integer;
        km: real;
    end;

    lista = ^nodo;
    nodo = record 
        data: viaje;
        sig: lista;
    end;
    
procedure leer(var r: viaje);
begin 
    with r do begin 
        writeln('Ingrese el número de viaje:');
        readln(numero);
        writeln('Ingrese el código de auto:');
        readln(codigo);
        writeln('Ingrese la dirección de origen:');
        readln(dir_origen);
        writeln('Ingrese la dirección de destino:');
        readln(dir_destino);
        writeln('Ingrese los kilómetros recorridos:');
        readln(km);
    end;
end;

procedure armarlistaOrdenadaPorCodigo(var pri: lista; r: viaje);
var 
    ant, nue, act: lista;
begin
    new(nue);
    nue^.data := r;
    act := pri;
    ant := nil;
    
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act <> NIL) and (act^.data.codigo < r.codigo) do begin
        ant := act;
        act := act^.sig;
    end;
    
    if (ant = nil) then begin
        pri := nue;  {El dato va al principio}
    end
    else begin
        ant^.sig := nue; {Va entre otros dos o al final}
    end;
    
    nue^.sig := act;
end;

procedure armarlistaOrdenadaPorNumero(var pri: lista; r: viaje);
var 
    ant, nue, act: lista;
begin
    new(nue);
    nue^.data := r;
    act := pri;
    ant := nil;
    
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act <> NIL) and (act^.data.numero < r.numero) do begin
        ant := act;
        act := act^.sig;
    end;
    
    if (ant = nil) then begin
        pri := nue;  {El dato va al principio}
    end
    else begin
        ant^.sig := nue; {Va entre otros dos o al final}
    end;
    
    nue^.sig := act;
end;

procedure puntoA(var max1, max2: real; var c1, c2: integer; km: real; codigo: integer);
begin 
    if (km > max1) then begin 
        max2 := max1;
        c2 := c1;
        max1 := km;
        c1 := codigo;
    end
    else if (km > max2) then begin 
        max2 := km;
        c2 := codigo;
    end;
end; 

procedure cargardatos(var L: lista);
var 
    r: viaje;
begin 
    leer(r);
    while (r.numero <> -1) do begin
        armarlistaOrdenadaPorCodigo(L, r);
        leer(r);
    end; 
end;



procedure procesardatos(L: lista);
var 
    L2: lista;
    max1, max2: real;
    c1, c2: integer;
    viajeACT: integer;
begin 
    max1 := -1;
    max2 := -1;
    c1 := 0;
    c2 := 0;
    L2 := nil;
    
    while (L <> nil) do begin 
        viajeACT := L^.data.codigo;

        while (L <> nil) and (viajeACT = L^.data.codigo) do begin 
            puntoA(max1, max2, c1, c2, L^.data.km, L^.data.codigo);

            if (L^.data.km > 5) then 
                armarlistaOrdenadaPorNumero(L2, L^.data);            
            L := L^.sig;
        end;
    end;
    
    writeln('Los dos códigos de auto que más kilómetros recorrieron son: ', c1, ' y ', c2);
end;

var 
    L: lista;
begin 
    L := nil;
    cargardatos(L);
    procesardatos(L);
end.
