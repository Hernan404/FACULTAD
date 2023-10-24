program PARCIAL;
const 
    equipos = 28;
    fechas = 27;

type
    rango_equipos = 1..equipos;
    rango_fechas = 1..fechas;

    jugador = record 
        apellidoynombre:string;
        codigo:1..28;
        anio:integer;
        calificacion:vector_puntuaciones;
    end;

    lista = nodo 
    nodo = record 
        data:jugador;
        sig:lista;
    end;

    vector = array [rango_fechas] of integer;
    vector_equipos = array [rango_equipos] of integer; 

procedure cargardatos(L:lista) // dispone
procedure leer(j) //dispone 
procedure inivector(var v:vector) // dispone

// forma 1 de analizar las puntuaciones
procedure analizarpuntuacionesB (v:vector_puntuaciones; var promedio:real; var fechas:integer);
var 
    i:rango_fechas;
begin 
    suma:= 0;
    fechas:= 0;

    for i:= 1 to fechas do begin 
        if (v[i] <> 0) then 
            suma:= suma v[i]
            fechas:= fechas +1;
    end;
    promedio:= suma/fechas;
end;

// forma 2 de analizar las puntuaciones
//sumo las fechas para tener un total y calcular el promedio
function promedio (v:vector_puntuaciones):real;
var 
    i:integer;
begin 
    for i:=1 to fechas do begin 
        fechas:= fechas +1;
    end;
end;

//cantidad de veces que aparecio
function cantfecha(v:vector_puntuaciones):integer;
var 
    i:integer; 
begin 
    for i:=1 to fechas do begin 
        if (v[i] <> 0) then 
            suma:= suma[i];
    end;
end;

//puntob
procedure punto2 (var j1,j2:integer; prom1,prom2:real; j:jugador; promedio:real);
begin 
    if (promedio < prom1) then begin 
        j2:= j1;
        prom2:= prom1;
        jug1:= j.codigo;
        prom1:= promedio;
    end
        else 
            if (promedio < prom2) then begin
                prom2:= promedio;
                j2:= j.codigo;
            end;
end;

procedure imprimir (v:vector_equipos);
var 
    i:rango_equipos;
begin 
    for i:=1 to equipos do begin 
        writeln(i,v[i])
    end;
end;

procedure impares (num:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;

    while (num <> 0) do begin
        digito:= num mod 10; 
        if (digito mod 2 = 0) then 
            par:= par +1;
        else 
            impar:= impar +1;

        num:= num div 10;
    end;

    impares:= (par = 2);
end;

procedure armarlista (L:lista; var L2:lista);
begin 
    while (L <> nil) do begin 
        if (impares) and (L.data.anio >= 1987) and (L.data.anio <= 1991) then 
            insertarordenado(L2,L.data)
        L:= L.sig;
    end;
end;

procedure procesarDatos (L,L35:lista);
var 
    r:jugador;
    v:vector;
    prom:real;
    cant:integer;
    j1,j2:integer;
begin

    prom_jugador:= 0;
    prom_jugador2:= 0;

    inivector(v);
    while (L <> nil) do begin 
        analizarpuntuacionesB(L.data.calificaciones; prom,cant);

        //punto A
        if (2023 - L.data.anio > 35) then 
            v[L.data.equipo]:= v[L.data.equipo] +1;

        //punto B
        if (cant > 14) then 
            puntoB(); // dos minimos
        L:= L.sig;
    end;

    imprimir(v);
    writeln();
    armarlista(L,L35);
end;

var 
    L,L35:lista;
begin 
    L:= nil;
    L35:= nil;
    cargardatos(L);
    procesarDatos(L);
end;

una revista dispone de informacion de los jugadores de basquet 
participantes de la liga profesional 2022 de cada jugador se conoce codigo de jugador 
apellido y nombre, codigo de equipo (1..20) año de nacimineto y la calificacion obtenida para cada
una de las 18 fechas del torneo ya finalizado. la calificacion es numerica de 0 a 10donde el valor 0 
significa que el jugador no ha participado de la fecha 

a. informar para cada equipo la cantidad de jugadores de 30 años 
b. informar los codigos de los 2 jugadores con menor calificacion promedio 
en los partidos en los que participo. solo deben considerarse los jugadores que participaron en 
mas de 9 fechas 
c. implementar e invocar a un modulo que genere una lista con los jugadores cuyo codigo posee 
exactamente 2 digitos pares y haya nacido entre 1987 y 1991. la lista debe estar ordenada por codigo de 
jugador 
