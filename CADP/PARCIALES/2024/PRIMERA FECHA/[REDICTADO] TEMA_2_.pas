{
una frabrica de automoviles necesita un programa para administrar 900000 piezas de los 
diferentes modelos de automoviles que fabrica, de cada pieza se conoce, descripccion, cantidad de stock 
costo de la pieza, codigo de modelo al que pertenece (1 al 10), al stock minimo y su peso en kg 

A. leer y almacenar la informacion de las piezas en una estructura de datos adecuada. la informacion 
debe quedar almacenada en el mismo orden que fue leida

B. a partir de la estructura generada en A. se requiere: 
    1. realizar una lista de las piezas cuyo stock actual sea igual al stock minimo 
    2. calcular el promedio de piezas que pesan mas de 1kg y su codigo de piezas posea al menos 3 digitos multiplos de 2 
    3. utilizando la lista generada en B) calcular e informar los dos codigos de piezas mas costosas cuyo codigo de modelo 
    sea menor que 5 }



program TEMA2;
const 
	piezas = 900000;
	modelos = 10;
type 
	rango_modelos = 1..modelos;
	rango_piezas = 1..piezas;

	pieza = record 
		descripccion:string;
		codigo_piezas:integer;
		cant_stock:integer;
		costo:real;
		codigo_modelo:rango_modelos;
		stock_min:integer;
		peso:real;
	end; 

	lista = ^nodo;
	nodo = record
		data:pieza;
		sig:lista;
	end; 

	vector = array [rango_piezas] of pieza;

procedure cargardatos(var v:vector);
var 
	i:integer; 
begin 
	for i:=1 to piezas do begin 
		readln(v[i].descripccion);
		readln(v[i].cant_stock);
		readln(v[i].codigo_piezas);
		readln(v[i].costo);
		readln(v[i].codigo);
		readln(v[i].stock_min);
		readln(v[i].peso);
	end; 
end; 

procedure armarlista(var L:lista; r:pieza);
var 
	ant,act,nue:lista;
begin 
	new(nue);
	nue^.data:= r;
	nue^.sig:= nil;

	if (L <> nil) then begin 
		act:= L;
		while (act^.sig <> nil) do 
			act:= act^.sig;
		act^.sig:= nue;
	end
	else 
		L:= nue; 
end; 

procedure mascostosos (codigo_piezas:integer; costo:real; var max1,max2:real; var p1,p2:integer);
begin 
	if (costo > max1) then begin 
		max2:= max1;
		p2:= p1; 
		p1:= codigo_piezas;
	end 
	else if (costo > max2) then begin 
		max2:= costo;
		p2:= codigo_piezas;
	end; 
end; 

function cumple2(peso:real; codigo:integer):boolean; 
var 
	cant:integer;
begin 
	cant:= 0; 
	while (codigo > 0) do begin 
		if (codigo mod 2 = 0) then 
			cant:= cant +1; 
		codigo:= codigo div 10; 
	end; 

	cumple2:= (peso > 1) and (cant >= 3);
end; 

procedure procesardatos(v:vector);
var 
	L:lista;
	i:integer; p1,p2:integer; cant2:integer;
	max1,max2:real; promedio:real; 
begin 
	L:= nil; max1:= -1; max2:= -1; p1:= 0; p2:= 0; 
	cant2:= 0; 
	promedio:= 0; 

	for i:=1 to piezas do begin 
		if (v[i].cant_stock = v[i].stock_min) then 
			armarlista(L,v[i]);
		
		if (cumple2(v[i].peso,v[i].codigo)) then 
			cant2:= cant2 + 1; 
	end; 
	promedio:= piezas/cant2;

	while (L <> nil) do begin 
		if (L^.data.codigo_modelo < 5) then 
			mascostosos(L^.data.codigo_piezas,L^.data.costo,max1,max2,p1,p2);
	L:= L^.sig; 
	end;

	writeln('punto 2', promedio);
	writeln('punto 3', p1,p2); 
end; 

var  
	v:vector;
begin 
	cargardatos(v);
	procesardatos(v);
end.
