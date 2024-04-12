Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee
código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.

program EJ3P1P2;

var
	i,codigo,cod1,cod2:integer;
	precio,min1,min2:real;
	cantpar:integer;
begin 
	min1:=9999;
	min2:=9999;
	cantpar:= 0;
	
	for i:=1 to 200 do begin 
		writeln('INGRESE CODIGO');
		readln(codigo);
		writeln('INGRESE PRECIO');
		readln(precio);
		
		if (precio < min1) then begin 
			min2:= min1;
			cod2:= cod1;
			min1:= precio;
			cod1:= codigo;
		end
		else if (min1 < min2) then begin
			min2:= precio;
			cod2:= codigo;
		end;
		
		if (precio > 16) and ((codigo mod 2)=0) then 
			cantpar:= cantpar +1;
	end;
	writeln('CODIGO DE LOS PRODUCTOS MAS BARATOS: ', cod1, 'y ', cod2);
	writeln('CANTIDAD DE PRODUCTOS CON CODIGO PAR Y PRECIO MAYOR A 16: ', cantpar);
end.
		
