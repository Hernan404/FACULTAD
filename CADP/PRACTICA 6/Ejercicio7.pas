program EJ6P6;

type 
	str20= string[20];
	datosSonda = record 
		nombre:str20;
		duracion:integer;
		costo_c:real;
		costo_m:real;
		rango:integer;
	end;

	lista = ^nodo;
		nodo = record
			sonda:datoSonda;
		end;
	
	lista2 = ^nodo;
		nodo = record
			nombre:str20;
		end;

	vnodo = array [1..7] of integer;


procedure armarnodo (var L:lista; d:datoSonda);
var 
	aux:lista;
begin 
	new(aux);
	aux^.sonda := d;
	aux^.sig := L;
	L:= aux
end;
procedure armarnodo2 (var L:lista2; d:datoSonda);
var 
	aux:lista2;
begin 
	new(aux);
	aux^.nombre := d;
	aux^.sig2 := L;
	L:= aux
end;

procedure leersonda (var d:datoSonda);
begin 
	readln(d.nombre);
	readln(d.duracion);
	readln(d.costo_c);
	readln(d.costo_m);
	readln(d.rango);
end;


procedure cargarlista (var L1:lista; var d:datoSonda);
begin 
	writeln('ingrese un producto');
	leersonda(sonda)
	while (d.nombre <> 'GAIA') do begin 
		armarNodo(L1,d);
		writeln('ingrese un producto')
		leersonda(d);
end.

procedure sonda_costosa (L:lista; var Sonda_mascost; var max);
begin 
 if ((L^.datoSonda.costo_c) and (L^.datoSonda.costo_m) > max) then
	max:= L^.datosSonda.costo_c + L^.datoSonda.costo_m;
	Sonda_mascost:= L^.datoSonda.nombre;
end;

procedure inicializarvector (var v:vrango);
var 
	i:integer;
begin 
	for i:=1 to 7 do begin 
		v:[i]:= 0;
	end;
end;

procedure imprimirvectorcontador (v:vrango);
var 
	i:integer;
begin 
	for i:=1 to 7 do begin 
		writeln('EN LA POSICION ', i, 'se contaron ', v[i], 'veces');

procedure mayor_promedio_costo (L:lista; promedio:real; var supera_tiempo:integer; costo_promedio:real; var L2:lista2);
var 
	nombre:str20;
begin 
	while (L <> nil) do begin  
		while (L^.datoSonda.duracion > promedio) then 
		nombre:= L^.datoSonda.nombre;
		armarnodo2(L2, nombre);  
	end;
	L:L^.sig;
end;

function criterios (L:lista; d:datosSonda):boolean
var 
	cumple:boolean;
begin 
	cumple:= false;
	if (L^.datosSonda.costo_m < L^.datoSonda.costo_c) then 
		
		cumple:= true;
end;

procedure B (L:lista; var lista_cumple, lista_noCumple:lista2; costnofinan:real; cantnofinan:integer;);
var 
	cumpleF:boolean;
	nombre_cumple:str20;
	nombre_noCumple:str20;
begin
	cumpleF:= false;
	while L <> nil do begin 
		cumpleF = cumple(L);

		if (cumpleF = false) then 
			nombre_noCumple:= L^.datosSonda.nombre;
			armarnodo2(lista_noCumple,nombre_noCumple);
			costnofinan:= L.datosSonda.costo_total
			cantnofinan:= cantnofinan +1;
		end;

		else begin 
			nombre_cumple:= L^.datosSonda.nombre;
			armarnodo2(lista_cumple,nombre_noCumple);
			cumpleF:false;
		end;
		L:= L^.sig;
	end;
end;

var 
	L:lista; 
	L2:lista2;
	d:datos;
	Sonda_mascost:str20;
	promedio:real;
	v:vrango
	costo_promedio:real;
	supera_tiempo:integer;
	cantnofinan:integer;
	costnofinan:real;
	lista_cumple: L;
	lista_noCumple: L;


	max:real;
begin 
	L2:= nil;
	L:= nil;
	costo_promedio:= 0;
	supera_tiempo:= 0;
	promedio:= 0;
	max:= -1;

	while (L <> nil) do begin 
		sonda_costosa(L,Sonda_mascost,max);
		tipo:= L^.datoSonda.rango_espectro;
		vrango[tipo]:= vrango[tipo]+1;
		sondas_totales:= sondas_totales +1;
		suma_sondas:= suma sondas+L^.sonda.costo_c;
		L:= L^.sig;
	end; 

	costo_promedio:= costo_total/sondas_totales;

	writeln('A)  ',Sonda_mascost);
	writeln('B) _____ ');
	imprimir_vectorContador(vrango);
	promedio:= suma_sondas/sondas_totales;
	L1:= primero;
	writeln('cosa');
	mayor_que_promedio_costo(L1,promedio,superan_tiempo,costo_promedio,L2);
	writeln('D) cantidad de sondas que superan tiempo promedio ', supera_tiempo);


end;
