
Una panaderia artesanal de la plata vende productos de elaboracion propia
la panaderia agrupa sus productos en 26 categorias, para cada categoria se conoce
su nombre y precio por kilo del productos

La panaderia dispone de la informacion de todas las compras realizadas en el ultimo año
de cada compra se conoce el DNI del cliente, la categoria del producto (1..26) y la cantidad
de kilos comprados. la informacion se encuentra ordenada por DNI del cliente
realizar un modulo que retorne la informacion de las categorias en una estructura de datos
adecuada. la informacion se lee por teclado y sin ningun orden en particular. de cada categoria se lee el nombre
el codigo (1..26) y el precio

b) realizar un modulo que reciba la informacion de todas las compras, la informacion de 
las categorias y retorne: 
1. DNI del cliente que mas compras ha realizados
2. monto total recaudado por cada categoria
3. cantidad de compras de clientes con DNI compuesto por al menos 3 digitos pares 

program EJPARCIAL2022
const 
	categorias = 26;
type
	rango_categorias = 1..26;
	compra = record 
		DNI:Integer;
		categoria:rango_categorias;
		cantKG:real;
	end;

	lista = ^nodo 
	nodo = record 
		data:compra;
		sig:lista;
	end;

	info = record 
		nombre:string;
		codigo:rango_categorias
		precio:real;
	end;

	vcategoria = array [rango_categorias] of integer;
	vinfo = array [rango_categorias] of info

procedure cargarventas(var L:lista) //se dispone

procedure cargarinformacion(var vI:vinfo);
var 
	x:rango_categorias;
begin 
	for x:=1 to categorias do begin 
		readln(v[x].nombre);
		readln(v[x].codigo);
		readln(v[x].precio);
	end;
end;

function cumplepares(dni:integer):boolean;
var 
	par:= integer;
begin 
	par:= 0;
	while (dni > 0) do begin 
		dni:= dni mod 10;
		if (dni mod 2 = 0) then 
			par:= par +1;
	
	dni:= dni div 10;
	end;
	cumplepares:= (par >= 3);
end;

procedure procesardatos(L:lista; vI:vinfo);
var 
	vI:vinfo; max,c1:integer;
	vc:vcategoria;
	x:integer;
begin 
	max:= -1; c1:= 0;

	while (L <> nil) do begin 
		vc[L^.data.DNI]:= vc[L^.data.DNI] +1;
		puntoA(vc,max,c1);
		for x:=1 to categorias do 
			vI[L^.data.categoria]:= vI[L^.data.categoria] + vc[x].precio;

		if (cumplepares(L^.data.DNI)) then 
			cantC:= vc[L^.data.DNI] + cnatC;
	end;
	
end;
var 
	L:lista;
	vI:vinfo;
begin 
	L:= nil;
	cargarcompras(L);
	cargarinformacion(vI);
	procesardatos(L,vI)
end.

	
