La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible

program EJ6P6;
type 
	datos = record 
		nombre:string;
		duracion:integer;
		costo:real;
		costo_man:real;
		rango:1..7;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:datos;
		sig:lista;
	end;

	vector = array [1..7] of integer;

procedure leer(var r:datos);
begin 
	with r do begin 
		writeln('NOMBRE');
		readln(nombre);
		writeln('DURACION');
		readln(duracion);
		writeln('COSTO DE CONSTRUCCION');
		readln(costo);
		writeln('COSTO MANTENIMIENTO');
		readln(costo_man);
		writeln('RANGO');
		readln(rango);
	end;
end;

procedure armarnodo (var L:lista; r:datos);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;

procedure cargardatos(var L:lista);
var 
	r:datos;
begin 
	leer(r);
	repeat 
		armarnodo(L,r);
		leer(r);
	until (r.nombre  = 'GAIA');
end;

procedure inivector (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 7 do begin 
		v[i]:= 0;
	end;
end;

procedure puntoA(var r:datos; var max:real; var sondaA:string);
var 
	costoA:real;
begin 
	costoA:= r.costo + r.costo_man;
	if (costoA > max) then begin  
		max:= costoA;
		sondaA:= r.nombre;
	end;
end;

procedure procesardatos (L:lista);
var 
	r:datos; v:vector;
	sondaA:string; max,promedio:real; cantsondasC,cantcumpleB:integer; cantsondas:integer; totalduracion:integer; 
begin 
	sondaA:= '';  max:= -1; promedio:= 0; cantsondas:= 0; cantcumpleB:= 0;totalduracion:= 0; cantsondasC:= 0;
	inivector(v);
	while (L <> nil) do begin 
		//punto A
		puntoA(r,max,sondaA);
		
		cantsondas:= cantsondas +1;
		
		//punto B
		v[L^.data.rango]:= v[L^.data.rango] +1;
		if (v[L^.data.rango] > 7) then 
			cantcumpleB:= cantcumpleB +1;
		
		//punto C 	
		totalduracion:= L^.data.duracion + totalduracion;	
		promedio:= totalduracion/cantsondas;
		if (L^.data.duracion > promedio) then 
			cantsondasC:= cantsondasC +1;
	
		//punto D	
		if (L^.data.costo > promedio) then 
			writeln('El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas: ', L^.data.nombre);
	L:= L^.sig;
	end;
	
	writeln('El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).', sondaA);

	writeln('La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.', cantcumpleB); 

	writeln('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.', cantsondasC);

end;


var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
