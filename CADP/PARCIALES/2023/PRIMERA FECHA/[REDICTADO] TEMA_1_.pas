{Un restaurante necesita un programa para administrar la informacion de los platos que ofrece.
se dispone de una estructura con la informacion de los platos. de cada plato se conoce: 
nombre,precio,categoria(1:entrada, 2:princpal, 3:postre, 4:minuta),
cantidad de ingredientes y nombre de cada uno de los ingredientes (a lo sumo 10)

a) generar una nueva estructura con nombre y precio de cada plato que posea "perejil" entre sus ingredientes
b) informar las dos categorias con mayor cantidad de platos ofrecidos.
c) informar el precio promedio de los platos con mas de 5 ingredientes.}

program PARCIAL;
type 
	platos = record 
		nombre:string;
		precio:real;
		categoria:1..4;
		cant_ingredientes:integer;
		nombre_ingredientes:string;
	end;

	lista2 = ^nodo2;
	data = record
		nombre:string;
		precio:real;
		sig:lista2;
	end;

	lista = ^nodo; 
	nodo = record 
		data:platos;
		sig:lista;
	end;

	vector = array [1..4] of integer;
	vingredientes = array [1..10] of integer;

procedure leer(r); 
begin 
	// se dispone
end;

procedure cargardatos(L:lista); 
begin 
	// se dispone
end;

procedure armarnodo(L:lista,r:platos); 
begin 
	// se dispone
end;

procedure inivector(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 4 do begin 
		v[i]:= 0;
	end;
end;


procedure puntoB(v:vector; max1,max2,c1,c2:integer;);
var 
	i:integer;
begin 
	for i:=1 to 4 do begin 
		if (v[i] > max1) then begin 
			max2:= max1;
			c2:c1;
			max1:= v[i]
			c1:= i;
		else if (max1 > max2) then 
			max2:= v[i];
			c2:= i;
		end;	
	end;
end;

procedure armarlistaA(var L2:lista2; precio, nombre);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data.nombre:= nombre;
	aux^.data.precio:= precio;
	aux^.sig:= L2;
	L2:= aux;
end;

procedure procesardatos(L:lista);
var 
	L2:Lista2; i:integer;
	v:vector; cantplatos:integer; max1,max2,c1,c2; promedio:real;
begin 
	cantplatos:= 0; max1:= -1; max2:= -1; c1:= 0; c2:= 0; promedio:= 0;
	
	inivector(v);
	while (L <> nil) do begin
		cantplatos:= cantplatos + L^.data.cant_ingredientes;

		//punto A
		for i:=1 to L^.data.cant_ingredientes do begin 
			if (L^.data.nombre_ingredientes = 'perejil') then  
				armarlistaA(L2,L^.data.precio, L^.data.nombre_ingredientes);
		end;


		//punto B
		v[L^.data.categoria]:= v[L^.data.categoria] +1; 

		//punto C
		if (L^.data.cant_ingredientes > 5) then 
			promedio:= promedio + 1;
	L:= L^.sig;
	end;
	puntoB(v,max1,max2,c1,c2);
	writeln('b) informar las dos categorias con mayor cantidad de platos ofrecidos: ', c1, c2);
	writeln('c) informar el precio promedio de los platos con mas de 5 ingredientes:', promedio/cantplatos:2:0);
end;

var 
	L:lista;
begin 
	L:= niL;
	cargardatos(L);
	procesardatos(L);
end;		
