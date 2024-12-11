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

	puntoA = record 
		nombreA:string;
		precio:real;
	end;

	listaA = ^nodo;
	data = record
		data:puntoA;
		sig:listaA;
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

procedure inivector(var v:vector; var vI:vingredientes);
var 
	i:integer;
begin 
	for i:=1 to 4 do begin 
		v[i]:= 0;
	end;
	for i:=1 to 10 do begin 
		vI[i]:= 0;
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

procedure armarlistaA(L:lista; var LP:listaA);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data.nombre:= L^.data.nombre;
	aux^.data.precio:= L^.data.precio;
	aux^.sig:= LP;
	LP:= aux;
end;

procedure procesardatos(L:lista);
var 
	LP:ListaA; i:integer;
	vI:vingredientes; v:vector; cantplatos:integer; max1,max2,c1,c2; promedio:real;
begin 
	cantplatos:= 0; max1:= -1; max2:= -1; c1:= 0; c2:= 0; promedio:= 0;
	
	inivector(v,vI);
	while (L <> nil) do begin
		cantplatos:= cantplatos +1; 

		//punto A
		for i:=1 to L^.data.cant_ingredientes do begin 
			if (L^.data.nombre_ingredientes = 'perejil') then  
				armarlistaA(L,LP);
		end;


		//punto B
		puntoB(v,max1,max2,c1,c2);

		//punto C
		if (L^.data.cant_ingredientes > 5) then 
			promedio:= L^.data.cant_ingredientes;
	L:= L^.sig;
	end;
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
