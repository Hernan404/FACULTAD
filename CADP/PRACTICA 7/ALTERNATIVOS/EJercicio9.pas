{Una biblioteca municipal posee la lista de libros que fueron leídos durante el mes de Octubre. De cada libro se tiene:

    código de libro,

    título del libro,

    código de categoría (1: novela, 2: ciencia ficción, 3: historia, 4: biografía, 5: poesía, 6: ensayo, 7: infantil, 8: misterio),

    puntaje promedio otorgado por los lectores.

Dicha estructura no posee orden alguno.

Se pide:

a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por los lectores. Para ello se debe leer desde teclado las opiniones que han realizado los socios de la biblioteca. De cada opinión se lee:

    DNI del lector,

    apellido y nombre del lector,

    código de libro,

    puntaje otorgado.

La lectura finaliza cuando se lee el código de libro -1. La información viene ordenada por código de libro.

b) Informar el código de categoría que obtuvo mayor puntaje total entre todas las opiniones.

c) Informar el apellido y nombre de aquellos lectores que posean la misma cantidad de dígitos pares que impares en su DNI.

d) Realizar un módulo que elimine de la lista que se dispone un libro cuyo código se recibe como parámetro (el mismo puede no existir).}


program EJ9P7_ALTERNATIVO
const 
	categorias = 8;
type 
	rango_categorias = 1..categorias;

	libro = record 
		codigo:integer;
		titulo:string;
		categoria:rango_categoria;
		puntaje:real;
	end;

	vector = array [rango_categorias] of integer;

	lista = ^nodo;
	nodo = record 
		data:libro;
		sig:lista;
	end;

	socios = record 
		dni:integer;
		apeynom:string;
		codigo:integer;
		puntaje:real;
	end;

	lista2 = ^nodo2;
	nodo2 = record 
		data:socios;
		sig:lista;
	end;

procedure procesardatos(L:lista; L2:lista);
var 
	v:vector;
begin 
	while (L <> nil) do begin
		totalpromedio:= 0;
		cantpromedio:= 0; 
		while (L2 <> nil) do begin 
			totalpromedio:= L2^.data.puntaje + totalpromedio;
			canpromedio:= cantpromedio + 1;

			v[L^.data.categoria]:= totalpromedio + v[L^.data.categoria];

			if (cumplePar(L2^.data.dni)) then 
				writeln(L2^.data.apeynom);

		end;
		promedioSocios:= totalpromedio/cantpromedio;
		L^.data.puntaje:= promedioSocios + L^.data.puntaje;
	end; 
	
	puntoB(v,max,p1);

	readln(codigo);
	eliminar(L,codigo,exito);
end;

procedure cargarsocios (L2:lista);
var 	
	s:socios;
begin 
	while (s.codigo <> -1) do begin 
		leerSocio(s);
		armarlista2(L2,s);
	end; 
end;

var 
	L:lista; L2:lista2;
begin 
	L:= nil;
	L2:= nil;
	cargardatos(L); // se dispone 
	cargarsocios(L2);
	procesardatos(L,L2);
end.


