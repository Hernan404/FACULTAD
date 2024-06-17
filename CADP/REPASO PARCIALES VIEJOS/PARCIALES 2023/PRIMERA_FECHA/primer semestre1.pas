{una empresa de ventas de pasajeros en colectivo esta analizando la informacion de los viajes realizados a mar del plata en el ultimo año. para ello se dispone de una estructura de datos con la informacion de todos los viajes realizados. de cada viaje se conoce el codigo de viaje, el numero de coche (entre 1000 y 2500), el mes en que se realizo el viaje, la cnatida de pasajes vendidos y el dni del chofer. la informacion no se encuentra ordenada por ningun criterio.
ademas la empresa dispone de una estructura de datos con informacion sobre la capiacidad maxima de cada coche;

realizar un programa que procese la infromacion  de los viajes e: 
A. informar el numero de coche con le cual se realizaron mas viajes.
B. genere una lista con los viajes realizados en el mes 2 por un chofer con DNI multiplo de 10 donde la cantidad de pasajes vendidos no alcanza la capacidad maxima del coche;
C. para cada coche, informe el promedio de pasajeros que viajaron entre todos sus viajes.}



program PARCIALMARDELPLATA;
type 
	rango_numero = 1000..2500;
	
	viajes = record 
		codigo:integer;
		numero:rango_numero;
		mes:1..12;
		cant_pasajes:integer;
		dni:integer;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:viajes;
		sig:lista;
	end;

	vector = array [rango_numero] of integer;
	vcapacidad = array [rango_numero] of integer;
	
procedure armarlista(var L:lista; r:viajes); // se dispone

procedure leer(var r:viajes); // se dispone

procedure cargarcapacidad(var vc:vcapacidad); // se dispone

procedure cargardatos(var L:lista); // se dispone

procedure inivector(var v:vector); 
var 
	i:rango_numero;
begin 
	for i:=1000 to 2500 do v[i]:= 0;
end;

procedure puntoA(v:vector; var max,p1:integer);
var 
	i:rango_numero;
begin 
	for i:=1000 to 2500 do begin 
		if (v[i] > max) then begin 
			max:= v[i];
			p1:= i;
		end;
	end;
end;

function cumpleB(r:viajes; cap:integer):boolean;
begin 
	cumpleB:= (r.mes = 2) and (r.dni mod 10 = 0) and (r.cant_pasajes < cap);
end;

procedure armarlista2(var L2:lista; r:viajes);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L2;
	L:= aux;
end;

procedure procesardatos(L:lista);
var 
	v:vector; vc:vcapacidad; max,p1:integer;
	L2:Lista; promedio:real; i,cap:integer;
begin 
	max:= -1; p1:= 0; L2:= NIL; promedio:= 0; cap:= 0;
	inivector(v);
	while (L <> nil) do begin 
		
		cap:= vc[L^.data.numero] + cap;
		
		v[L^.data.numero]:= v[L^.data.numero] +1;
		
		if (cumpleB(L^.data,cap)) then 
			armarlista(L2,L^.data);
		
		promedio:= L^.data.cant_pasajes + promedio;
		
	L:= L^.sig;
	end;
	for i:=1 to 2500 do 
		writeln(promedio/v[i]);
	
	puntoA(v,max,p1);
	writeln(p1);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
