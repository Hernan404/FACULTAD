{La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello, Amazon
cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura, Historia,
Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de veces
que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la editorial
“Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con más
de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial y el
título de cada libro con más de 250 ventas.}


program EJ13P7;
const 
	areas = 35;
type 
	rango_areas = 1..35;
	
	libro = record 
		titulo:string;
		nombre:string;
		cant_paginas:integer;
		anio:integer;
		cant_ventas:integer;
		codigo:rango_areas;
	end;
	
	lista = ^nodo 
	nodo = record 
		data:libro;
		sig:lista;
	end;
	
	vector = array [rango_areas] of integer;

procedure leer(var r:libro);
begin 
	with r do begin 
		readln();
		readln();
		readln();
		readln();
		readln();
		readln();
	end;
end;

procedure armarlista(var L:lista; r:libro);
var

begin 

end;
	
procedure cargardatos(var L:lista); 
var 
	r:libro;
begin 
	repeat 
		leer(r);
		armarlista(L,r);
	until r.nombre <> 'relato de un naufrago')
end;

procedure procesardatos(L:lista);
var 
	v:vector; cant_editados,total:integer;
	max:integer; p1:integer; libroACT:string;
begin 
	max:= -1; 
	while (L <> nil) do begin 
		libroACT:= L^.data.nombre
		cant_editados:= 0;
		while (L <> nil) and (L^.data.nombre = nombreACT) do begin 
				if (L^.data.nombre = 'planeta libro') then 
					writeln(L^.data.nombre);
					
					if (L^.data.anio > max) then 
						max:= L^.data.anio
					
					cant_editados:= cant_editados +1;
					
					total:= L^.data.cant_ventas + total;
					
					if (cant_ventas > 250) do begin 
						writeln(L^.data.titulo, L^.data.nombre, L^.data.cant_paginas);
				end;
		end;
		
	end;

end;



var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
