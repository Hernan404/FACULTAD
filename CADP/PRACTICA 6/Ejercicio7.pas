
{ 6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
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
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}


{ 7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio
anterior, se han determinado los siguientes criterios:
- Sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- No se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse
desde la superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6),
implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con
los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de
la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro
con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad
y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por
H2020. Para ello, utilice el módulo realizado en b}
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
		if (nombre <> 'GAIA') then begin 
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

function puntoA7 (r:datos; v:vector):boolean;
begin 
	puntoA7:= (r.costo_man < r.costo) and (v[r.rango] <> -1);
end;

procedure imprimir_cumple (r:datos; L2:lista);
begin
	while (L2 <> nil) do begin 
			writeln(r.nombre);
	L2:= L2^.sig;
	end;
end;

procedure imprimir_nocumple (r:datos; L3:lista);
var 
	total7:real; cantnofin:integer;
begin 
	cantnofin:= 0;
	while (L3 <> nil) do begin 
		writeln(r.nombre);
		cantnofin:= cantnofin +1;
		total7:= r.costo + r.costo_man;
	L3:=L3^.sig;
		writeln('costo total: ',total7);
		writeln('cantidad: ', cantnofin);
		
	end;
end;


procedure procesardatos (L:lista);
var 
	L2,L3:lista;
	r:datos; v:vector;
	sondaA:string; max,promedio:real; cantsondasC,cantcumpleB:integer; cantsondas:integer; totalduracion:integer; 
begin 
	sondaA:= '';  max:= -1; promedio:= 0; cantsondas:= 0; cantcumpleB:= 0;totalduracion:= 0; cantsondasC:= 0;
	inivector(v);
	L2:=nil;
	L3:=nil;
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
	
	
		//punto A Y B Ejercicio 7
		if (puntoA7(L^.data,v)) then begin  	
			armarnodo(L2,r);
			writeln('==EL PRODUCTO CUMPLE==');
		end
		else begin 
			armarnodo(L3,r);
			writeln('==EL PRODUCTO NO CUMPLE==');
		end;
	L:= L^.sig;
	end;
	
	//A
	writeln('El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).', sondaA);
	//B
	writeln('La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.', cantcumpleB); 
	//C
	writeln('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.', cantsondasC);

	//C y D ejercicio 7
	writeln('Proyectos que cumplen H2020');
	imprimir_cumple(r,L2);

	writeln('Proyectos que no cumplen H2020 y sus detalles');
	imprimir_nocumple(r,L3);

end;


var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);

end.
