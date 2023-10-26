{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.
De cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en
kilómetros recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura
finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.

}


program EJ5P7;
type
    camion = record 
        patente:integer;
        anio_fabri:integer;
        capacidad:real;
    end;

    viaje = record 
        codigo_viaje:integer;
        codigo_camion:1..100;
        distanciaKM:integer;
        ciudad_destino:string;
        anio_viaje:integer;
        DNI:integer;
    end;

    lista = ^nodo 
    nodo = record 
        data:viaje;
        sig:lista;
    end;

    vector = array [1..100] of integer;

procedure leer(var d:viaje; var c:camion);
begin 
    with c do begin 
        writeln('==DATOS DE CAMION==');
        writeln('patente');
        readln(patente);
        writeln('anio fabricacion');
        readln(anio_fabri);
        writeln('capacidad');
        readln(capacidad);
    end;

    with d do begin 
        writeln('==DATOS DE VIAJE==');
        writeln('codigo viaje');
        readln(codigo_viaje);
        if (codigo_viaje <> -1) do begin 
            writeln('codigo camion');
            readln(codigo_camion);
            writeln('distanciaKM');
            readln(distanciaKM);
            writeln('ciudad destino');
            readln(ciudad_destino);
            writeln('anio de viaje');
            readln(anio_viaje);
            writeln('DNI');
            readln(DNI);
        end;
    end;
end;

procedure cargardatos(L:lista);
var 
    d:viaje;
    c:camion;
begin 
    repeat 
        leer(d,c);
        armarlista(L,d);
    until (d.codigo_viaje = -1);
end;

procedure armarlista(var L:lista; d:viaje);
begin 
    new(aux);
    aux^.data:= d;  
    aux^.sig:= L;
    L:= aux;
end;

procedure inivector(var v:vector);
var 
    i:integer;
begin 
    for i:= 1 to 100 do begin 
        v[i]:= 0;
    end;
end;

procedure punto1 (c:camion; d:viaje; var max,min:integer; var cumpleMAX,cumpleMIN:integer);
begin 
    if (d.distanciaKM > max) then 
        max:= d.distanciaKM;
        cumpleMAX:= c.patente;
    
    if (d.distanciaKM < min) then
        min:= d.distanciaKM; 
        cumpleMIN:= c.patente;
end;

function punto2 (c:camion; d:viaje):boolean;
begin 
    punto2:= (c.capacidad > 30.5) and (d.anio_viaje > 5);
end;

function punto3(d:viaje; c:camion):boolean
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;
    while (digito <> 0) do begin 
        digito:= d.DNI mod 10;

        if (digito mod 10 = 2) then 
            par:= par +1;
        else 
            impar:= impar +1;
        
        digito:= digito div 10;
    end;
    punto3:= (par = 0); 
    
end;

procedure procesarDatos(L:lista);
var 
    c:camion;
    max:integer;
    cumpletres:integer;
    cumpleMAX:integer;
    cumpleMIN:integer;
    cumpledos:integer;
    i:integer;
    v:vector;
begin 
    max:= -1;
    min:= 9999;
    
    i:= 0;

    while (L <> nil) do begin 
        cumpleMAX:= 0;
        cumpleMIN:= 0;
        cumpledos:= 0;
        cumpletres:= 0;
        codactual:= L^.data.codigo_camion;
        while (L <> nil) and (L^.data.codigo_camion = codactual);
            punto1(c,max,cumpleMAX,cumpleMIN);

            if punto2(L^.data,c) then 
                cumpledos:= cumpledos +1;

            for i:= 1 to 100 do begin 
                if punto3(L^.data,c) then 
                    cumpletres:= cumpletres + v[i]
            end;
        L:=L^.sig;
        end;
    
    end;
end; 

var 
    L:lista;
    c:camion;
    v:vector;
begin 
    L:= nil;
    cargardatos(L);
    procesarDatos(L);
end.
