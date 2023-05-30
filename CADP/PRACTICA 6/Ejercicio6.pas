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
			datosSonda:datosSonda;
		end;
	
	lista2 = ^nodo;
		nodo2 = record
			nombre:str20;
		end;

	vrango = array [1..7] of integer;


procedure armarnodo (var L:lista; d:datosSonda);
var 
	aux:lista;
begin 
	new(aux);
	aux^.datosSonda := d;
	aux^.sig := L;
	L:= aux;
	
end;
procedure armarnodo2 (var L:lista2; d:str20);
var 
	aux:lista2;
begin 
	new(aux);
	aux^.nombre := d;
	aux^.sig2 := L;
	L:= aux;
end;

procedure leersonda (var d:datosSonda);
begin 
	readln(d.nombre);
	readln(d.duracion);
	readln(d.costo_c);
	readln(d.costo_m);
	readln(d.rango);
end;


procedure cargarlista (var L:lista; var d:datosSonda);
begin 
	writeln('ingrese un producto');
	leersonda(d);
	while (d.nombre <> 'GAIA') do begin 
		armarnodo(L,d);
		writeln('ingrese un producto');
		leersonda(d);
	end;
end;
procedure sonda_costosa (L:lista; var Sonda_mascost:str20; var max:real);
begin 
 if (L^.datosSonda.costo_c > max) then
	max:= L^.datosSonda.costo_c;
	Sonda_mascost:= L^.datosSonda.nombre;
end;

procedure inicializarvector (var v:vrango);
var 
	i:integer;
begin 
	for i:=1 to 7 do begin 
		v[i]:= 0;
	end;
end;

procedure imprimirvectorcontador (v:vrango);
var 
	i:integer;
begin 
	for i:=1 to 7 do begin 
		writeln('EN LA POSICION ', i, 'se contaron ', v[i], 'veces');
	end;
end;
procedure mayor_promedio_costo (L:lista; promedio:real; var supera_tiempo:integer; costo_promedio:real; var L2:lista2);
var 
	nombre:str20;
begin 
	while (L <> nil) do begin  
		while (L^.datosSonda.duracion > promedio) do 
		nombre:= L^.datosSonda.nombre;
		armarnodo2(L2,str20);  
	end;
	L:= L^.sig;
end;

var 
	L:lista; 
	L2:lista2;
	d:datosSonda;
	Sonda_mascost:str20;
	promedio:real;
	v:vrango;
	costo_promedio:real;
	supera_tiempo:integer;
	sondas_totales:integer;
	tipo:integer;
	superan_tiempo:integer;
	primero:lista;
	mayor_que_promedio_costo:integer;
	suma_sondas: integer;
	costo_total:real;
	

	max:real;
begin 
	costo_total:= 0;
	
	L2:= nil;
	L:= nil;
	costo_promedio:= 0;
	supera_tiempo:= 0;
	promedio:= 0;
	max:= -1;
	sondas_totales:= 0;
	tipo:= 0;
	mayor_que_promedio_costo:= 0;
	suma_sondas:= 0;
	primero:= L;
	Sonda_masCost:= str20;
	
	
	while (L <> nil) do begin 
		sonda_costosa(L,Sonda_mascost,max);
		tipo:= L^.datosSonda.rango;
		v[tipo]:= v[tipo]+1;
		sondas_totales:= sondas_totales +1;
		suma_sondas:= suma_sondas + L^.datosSondas.costo_c;
		L:= L^.sig;
	end; 

	costo_promedio:= costo_total/sondas_totales;

	writeln('A)  ',Sonda_mascost);
	writeln('B) _____ ');
	imprimirvectorContador(vrango);
	promedio:= suma_sondas/sondas_totales;
	L:= primero;
	writeln('cosa');
	mayor_promedio_costo(L,promedio,superan_tiempo,costo_promedio,L2);
	writeln('D) cantidad de sondas que superan tiempo promedio ', supera_tiempo);


end.
