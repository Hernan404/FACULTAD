Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.

program EJ5P6;
type 
	datos = record 
		codigo:integer;
		descripcion:string;
		stockACT:integer;
		stockMIN:integer;
		precio:real;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:datos;
		sig:lista;
	end;
procedure leer(var r:datos);
begin 
	with r do begin 
		writeln('CODIGO');
		readln(codigo);
		if (codigo <> -1) then begin
			writeln('DESCRIPCION');
			readln(descripcion);
			writeln('STOCK ACTUAL');
			readln(stockACT);
			writeln('STOCK MINIMO');
			readln(stockMIN);
			writeln('PRECIO');
			readln(precio);
		end;
	end;
end;

procedure armarnodo(var L:lista; r:datos);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;

procedure cargardatos(L:lista);
var 
	r:datos;
begin 
	leer(r);
	while (r.codigo <> -1) do begin 
		armarnodo(L,r);
		leer(r);
	end;
end;

function pares (num:integer):boolean;
var 
	par,impar:integer;
begin 
	par:= 0;
	impar:= 0;
	
	while (num > 0) do begin 
		num:= num mod 10;
		
		if (num mod 2 = 0) then begin 
			par:= par +1;
		end
		else begin  
			impar:= impar +1;
		end;
	num:= num div 10;
	end;
	pares:= (par = 3);
end;

procedure minimos (r:datos; var min1,min2: real; var cod1,cod2:integer);
begin 
	if (r.precio < min1) then begin 
		min2:= min1;
		cod2:= cod1;
		min1:= r.precio;
		cod1:= r.codigo;
	end
	else if (min1 < min2) then begin 
			min2:= r.precio;
			cod2:= r.codigo;
	end;
end;
procedure procesardatos(L:lista);
var 
	r:datos; porcenA:real; cod1,cod2:integer; min1,min2:real; cantproductos:integer;
begin 
	porcenA:= 0;
	cod1:= 0;
	cod2:= 0;
	min1:= 999;
	min2:= 999;
	cantproductos:= 0;
	
	while (L <> nil) do begin 
		cantproductos:= cantproductos +1;
		
		//A
		if (L^.data.stockACT < L^.data.stockMIN) then 
			porcenA:= porcenA + 1;
		
		//B
		if (pares(L^.data.codigo)) then 
			writeln('Descripción de producto con código compuesto por al menos tres dígitos pares. ',L^.data.descripcion);
		
		//C
		minimos(r,min1,min2,cod1,cod2);
	L:=L^.sig;
	end;
	
	writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo: ', (porcenA/cantproductos) * 100:2:0);
	writeln('Código de los dos productos más económicos: ', cod1,' y ', cod2);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
