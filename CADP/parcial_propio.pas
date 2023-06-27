program parcial;
type 
    viajes = record 
        codigo:integer;
        num_coche:1000..2500;
        mes:1..12;
        cantPasajes:integer;
        dni:integer;
    end;

    lista = ^nodo;
    nodo = record
        datos:viajes;
        sig:lista;
    end;

    vector = array [1..2500] of integer;
    vectorMes = array [1..12] of integer;

procedure inivector (v:vector; vmes:vectorMes);
var 
	i:integer;
begin 
    for i:=1000 to 2500 do 
        v[i]:= 0;
    for i:=1 to 12 do 
        vmes[i]:= 0;
end;

procedure leer(var d:viajes);
begin 
    with d do begin 
        readln(codigo);
        readln(num_coche);
        readln(mes);
        readln(cantPasajes);
        readln(dni);
    end;
end;

procedure masviajes (var max:integer; v:vector; var cantviajes:integer; puntoA:integer);
var 
    i:integer;
begin 
    for i:= 1000 to 1200 do begin
        if (cantviajes > max) then 
            max:= cantviajes;
            puntoA := v[i];
    end;
end; 

procedure listaviaje (L:lista; d:viajes);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= aux;
end;

procedure cumplir (d:viajes; v:vector; maxcapacidad:integer; cumple:boolean);
begin 
    cumple:=  (d.dni mod 10 = 0) and (d.mes = 2) and (d.cantPasajes < maxcapacidad);
end;

procedure promedios (promedio:real; v:vector; cantviajes:integer; d:viajes);
begin 
    promedio := cantviajes/d.cantPasajes;

end;



procedure procesarDatos (cumpleA:integer; promedio:real; maxcapacidad:integer; L:lista; v:vector; vmes:vectorMes; d:viajes; max:integer; cantviajes:integer; puntoA:integer; cumple:boolean);
begin 
    inivector(v,vmes);
    while (L <> nil) do begin 
        leer(d);
        masviajes(max,v,cantviajes,puntoA);
        cumplir(d,v,maxcapacidad,cumple);
        if (cumple = true) then 
            listaviaje(L,d);
    end;
  


    writeln('puntoA', puntoA);
    writeln('promedio: ', promedio);
end;

var 
    v:vector;
    vMes:vectorMes;
    L:lista;
    d:viajes;
    cumple:boolean;
    puntoA:integer;
    maxcapacidad:integer;
    max:integer;
    cumpleA:integer;
    promedio:real;
begin 
	max:= -1;
	
	
    L:= nil;
    procesarDatos(cumpleA,promedio,maxcapacidad.L,v,vmes,d,max.cantviajes,puntoA,cumple);
end.

