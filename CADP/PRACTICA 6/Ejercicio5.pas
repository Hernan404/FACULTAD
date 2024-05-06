program EJ5P6;

type
    lista^ = ^nodo;
        nodo = record 
        num:producto;
        sig:lista;
    
    producto = record 
        codigo:integer;
        descripcion:string;
        stock_act:integer;
        stock_min:integer;
        precio:real;
    end;


procedure armarlista(L:lista; v:producto);
var 
    aux:lista;
begin 
    new(aux);
    aux^.num:= v;
    aux^.sig:= L;
    L:= aux;
    
end;

procedure leerdatos(listaF:lista);
begin 
    writeln('codigo');
    readln(codigo);
    writeln('descripcion');
    readln(descripcion);
    writeln('stock actual');
    readln(stock_act);
    writeln('stock minimo');
    readln(stock_min);
    writeln('precio');
    readln(precio);
end;

procedure stock_por_debajo(listaF:lista; pordebajo:integer);
begin 
    if (listaF^.stock_act < listaF^.stock_min) then begin 
        pordebajo:= listaF.stock_act;
        listaF:= listaF.sig
    end;
end;

procedure trespares (listaF:lista; pares:integer);
var 
    dig:integer;
    par:integer;
    codigo:integer;
begin 
    codigo:= listaF^.num.codigo;
    par:=0;
    while (codigo <> 0) do begin 
        dig:= codigo mod 10;
        if(dig mod 2) = 0) then begin 
            par:= par+1;
            codigo:= codigo div 10;
        end;
        else
            codigo:= codigo div 10;
    if (par >= 3) then begin 
        writeln('desc de codigo' listaF^.num.codigo, 'es', listaF.num.descripcion);
        par:= 0;
end 
else 
    begin 
        par:= 0;
end;

procedure mas_economicos (listaF:lista);
begin 
    if (listaF^.precio < min1) then begin  
        min2:= min1
        min1:= listaF.num.precio;
        if (listaF^.precio < min2) then 
            min2:=listaF^.num.precio;
    end;
    listaF:= listaF^.sig;
end;

procedure imprimirnodo (listaF:lista);
begin 
    while (listaF <> nil) do begin 
        writeln(listaF^.num.codigo);
        writeln(listaF^.num.descripcion);
        writeln(listaF^.num.stock_act);
        writeln(listaF^.num.stock_min);
        writeln(listaF^.num.precio);
        writeln(listaF^.num.precio 2:2);
        listaF:= listaF^.sig
    end;
end;

var 
    pordebajo:integer;
    pares:integer;
    L:lista;
    prod:producto;
    min1,min2:integer;

begin
    pares:= 0;
    L:= nil;
    min1,min2:= 9999;
    L:= nil

    writeln('ingrese codigo');
    readln(L^.codigo);

    while L^.codigo <> -1 do begin 
        leerdatos(lista);
        armarlista(lista);
    end;

    stock_por_debajo(lista,pordebajo);
    trespares(lista,pares);
    mas_economicos(lista,min1,min2);

    writeln('productos con stock por debajo del minimo', pordebajo);
    writeln('codigos con tres pares' pares,);
    writeln('los 2 productos mas economicos' min1 , min2);
end;




NUEVO 
=================================

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
		if (L^.data.stockACT < L^.data.stockMIN) then 
			porcenA:= porcenA + L^.data.stockACT;
		if (pares(L^.data.codigo)) then 
			writeln('Descripción de aquellos productos con código compuesto por al menos tres dígitos pares. ',L^.data.descripcion);
		minimos(r,min1,min2,cod1,cod2);
	L:=L^.sig;
	end;
	
	writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo: ', porcenA*cantproductos/100:2:0);
	writeln('Código de los dos productos más económicos: ', cod1, cod2);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
