{Una panaderia artesanal de la plata vende productos de elaboracion propia
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
3. cantidad de compras de clientes con DNI compuesto por al menos 3 digitos pares }


program EJPARCIAL2022;
const 
	categorias = 26;
type
	rango_categorias = 1..26;

	compra = record 
		DNI:Integer;
		categoria:vinfo;
		cantKG:real;
	end;

	categoria = record 
		nombre:string;
		precio:real;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:compra;
		sig:lista;
	end;
  

	vmontos = array [rango_categorias] of real;
	vinfo = array [rango_categorias] of categoria;

procedure cargarventas(var L:lista); //se dispone

procedure inivector(var vm:vmontos);
var 
	i:integer;
begin 
	for i:=1 to categorias do 
		vm[i]:= 0;
end;


procedure cargarinformacion(var v:vinfo);
var 
	i:rango_categorias;
begin 
	for i:=1 to categorias do begin 
		readln(nombre[i]);
		readln(precio[i]);
	end;
end;

function cumplepares(dni:integer):boolean;
var 
	par:integer;
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

procedure puntoA(var max,c1:integer; dni:integer; cant_compras:integer);
begin 
	if (cant_compras > max) then begin 
		max:= cant_compras;
		p1:= dni;
	end;
end;




procedure procesardatos(L:lista; vI:vinfo);
var 
	max,c1:integer;
	vm:vmontos;
	vc:vcategoria;
	v:vinfo;
	x:info; cantC:integer;
	
begin 
	max:= -1; c1:= 0; cantC:= 0;

	inivector(vc);
	while (L <> nil) do begin 
		dniACT:= L^.data.dni;
		cant_compras:= 0;
		while (L <> nil) and (L^.data.dni = dniACT) do begin 
			cant_compras:= cant_compras +1;

			if (cumplepares(dniact)) then 
				cantC:= cant_compras + cantC; 
			
			L:= L^.sig;
		end;
		
		vm[L^.data.categoria] * vm[L^.data.categoria] + (L^.data.cantKG * v[L^.data.categoria].precio);

	end;
	puntoA(max,c1,dniACT,cant_compras);

	for i:=1 to categorias do 
		writeln(vm[i]);
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
