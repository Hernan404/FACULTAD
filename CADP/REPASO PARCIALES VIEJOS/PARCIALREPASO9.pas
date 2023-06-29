program sadfd;
type 
    viajes = record 
        codigo:1000..2500;
        anio:integer;
        cantPasajeros:integer;
        ciudad:string;
    end;

    lista = ^nodo;
    nodo = record 
        datos:viajes;
        sig:lista;
    end;

    vector = array [1000..2500] of integer;
procedure inivector(v:vector; var viajesPorAvion,vTotalPasajeros:vector);
var 
    i:integer;
begin 
    for i:=1000 to 2500 do begin 
        v[i]:= 0;
    end; 
end;

procedure leer(var d:viajes);
begin 
	with d do begin
	writeln('ingrese un codigo entre 1000 y 2500');
    readln(codigo);
    writeln('anio');
    readln(anio);
    writeln('cantidad de pasajerso');
    readln(cantPasajeros);
    writeln('ciudad de destino');
    readln(ciudad);
    end;
end;

procedure listaviajes(L:lista; d:viajes);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargarLista (var L:lista; var d:viajes);
begin 
	leer(d);
	while (d.anio <> 0) do begin 
	leer(d);
	listaviajes(L,d);
	end;
end;

procedure mayorviajes (max:integer; d:viajes; v:vector; var cantViajes:integer; var cumpleA:integer);
var 
    i:integer;
begin 
    for i:=1000 to 2500 do begin 
        if (cantViajes > max) then 
            max:= cantViajes;
            cumpleA:= v[i];
    end;
end;



procedure puntoB (L:lista; d:viajes; var cumpleB:integer);
begin 
    if (d.anio mod 10 = 0) and (d.ciudad = 'punta cana') then 
        listaviajes(L,d);
end;

procedure puntoC (d:viajes; promedio:real; cantViajes:integer;cumpleC:real);
begin 
    promedio:= d.cantPasajeros/cantViajes;
    cumpleC:= promedio;
end;

procedure procesarDatos(L:lista; v:vector; var viajesPorAvion,vTotalpasajeros:vector; var d:viajes);
var 
    max:integer;
    promedio:real;
    cumpleA:integer;
    cantViajes:integer;
    cumpleB:integer;
    cumpleC:integer;
    {viajeActual:integer;}
	avion:integer;
begin 
	{viajeActual:= 0};
	cumpleC:= 0;
    max:= -1;
    promedio:= 0;
	avion:= 0;
    
	inivector(v,viajesPorAvion,vTotalpasajeros);

    while (L <> nil) do begin 
		avion:= L^.datos.codigo;
		viajesPorAvion[avion]:= viajesPorAvion[avion] +1;
		vTotalpasajeros[avion]:= vTotalpasajeros[avion] + L^.datos.cantPasajeros;
				mayorviajes(max,d,v,cantViajes,cumpleA);
				puntoB(L,d,cumpleB);
		end;
   
    puntoC(d,promedio,cantViajes,cumpleC);
	writeln('promedio', cumpleC);
	writeln('codigo de mayor cantidad de viajes', cumpleA);
    
end;
	
var 
    L:lista;
    v,viajesPorAvion,vTotalpasajeros:vector;
    d:viajes;
   
begin 
    cargarLista(L,d);
    procesarDatos(L,v,viajesPorAvion,vTotalpasajeros,d);
	
end.
