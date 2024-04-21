Realizar un programa modularizado que lea información de 200 productos de un supermercado. De
cada producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.

program EJ3P2P2ADICIONAL;

procedure proceso(var codigo,cant:integer; var p1,p2:integer; var min,min2,precio:real);
begin 
	if (precio < min) then begin 
		min2:= min;
		p2:= p1;
		min:= precio;
		p1:= codigo;
	end 
	else if (min < min2) then begin 
		min2:= precio;
		p2:= codigo;
	end;
	
	if (codigo mod 2 = 0) and (precio > 16) then 
		cant:= cant +1;
end;	

var 
	cant,codigo,p1,p2:integer;
	precio:real;
	min,min2:real;
	i:integer;
begin 
	min:= 9999;
	min2:= 9999;
	cant:= 0;
	p1:= 0;
	p2:= 0;
	for i:=1 to 3 do begin
		writeln('CODIGO');
		readln(codigo);
		writeln('PRECIO');
		readln(precio);
		
		proceso(codigo,cant,p1,p2,min,min2,precio);
	end;
	writeln('LOS CODIGOS CON MENOR PRECIO: ', p1 ,' y ', p2);
	writeln('CANTIDAD DE CODIGOS PARES CON PRECIOS MENORES DE 16$: ', cant);
end.
