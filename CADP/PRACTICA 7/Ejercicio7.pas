program EJ5P7;

type 
    data = record 
        codigo_viaje:integer;
        codigo_camion:integer;
        distanciaKM:real;
        ciudad_destino:integer;
        anioviaje:integer;
        DNI:integer;
    end;

    datadis = record 
        patente:string;
        anio_fabri:integer;
        capacidad:real;
    end;

    lista = ^nodo;
    nodo = record 
        lista:data;
        sig:lista;
    end;



procedure leer(d:data);
begin 
	with d do begin 
    readln(codigo_viaje);
    readln(codigo_camion);
    readln(distanciaKM);
    readln(ciudad_destino);
    readln(anioviaje);
    readln(DNI);
	end;
end;

procedure armarnodo(var L:lista; d:data);
var 
    aux:lista;
begin 
	new(aux);
    aux^.data:= d;
    aux^.sig:= L;
    aux:= lista
end;



procedure masrecor (var max:real; var min:real; var d:data; var masrecorrido:real; menosrecorrido:real);
begin 
    if (d.distanciaKM > max) then begin  
        max:=d.distanciaKM;
        masrecorrido:= max;
    end;
    if (d.distanciaKM < min) then begin 
        min:= d.distanciaKM;
        menosrecorrido:= min;
    end;
end;

procedure mayorcapacidad (var d:data; var b:datadis; var cantViajes:integer);
begin 
    if (b.capacidad > 30.5) and (d.anioviaje > 5) then begin 
        cantViajes:= cantViajes + 1;
    end;
end;

procedure digitos (var L:lista; d:data; var codigocumple:integer; cumple:boolean);
var 
    dig:integer;
begin 

    while (d.DNI <> 0) and (cumple <> true) do begin 
        dig:= d.DNI mod 10;
        if (dig / 2 <> 0) then
            cumple:= true;
    end; 
    codigocumple:= d.codigo_viaje;
end;

procedure cargarDatos (L:lista; b:datadis; d:data; max,min:real; cantViaje:integer; masrecorrido,menosrecorrido:real; cumple:boolean; codigocumple:integer);
begin 
    while (d.codigo_viaje <> -1) do begin 
        leer(d);
        armarnodo(L,d);
        masrecor(max,min,d,masrecorrido,menosrecorrido);
        mayorcapacidad(d,b,cantViaje);
        digitos(L,d,codigocumple,cumple);
    end;
    
end;

var
    cantViajes:integer;
    max,min:real;
    menosrecorrido:real;
    masrecorrido:real;
    d:data;
    L:lista;
    b:datadis;
    cumple:boolean;
    dnidigitos:integer;
    codigocumple:integer;
begin
	codigocumple:= 0;
	cumple:= false;
    menosrecorrido:= 0;
    masrecorrido:= 0;
    cantViajes:= 0;
    max:= -1;
    min:= 99999;
    
    L:= nil;
    
    cargarDatos(L,b,d,max,min,cantViajes,masrecorrido,menosrecorrido,cumple,codigocumple);
  

    writeln('menos recorrido ', menosrecorrido , 'mas recorrido: ', masrecorrido);
    writeln('cantidad de viajes: ', cantViajes);
    if (cumple = true) then 
        writeln('el dni contiene pares')
    else 
        writeln('el dni no contiene pares');
end.
