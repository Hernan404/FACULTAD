{realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio}

program EJ6P2P1;

procedure procesar (var precio,min1,min2,max:real; tipo:string; var codigo,cod1,cod2,codmax:integer);
begin 
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
	
	if (tipo = 'pantalon') and (precio > max) then begin 
		max:= precio;
		codmax:= codigo;
	end;
	
end;

var 
	precio,min1,min2,max:real;
	cod1,cod2,codmax:integer;
	i,codigo:integer;
	tipo:string;
	total:real;
begin
	min2:= 9999;
	min1:= 9999;
	max:= -1;
	cod1:= 0;
	cod2:= 0;
	codmax:= 0;
	total:= 0;
	for i:=1 to 100 do begin 
		writeln('INGRESE PRECIO');
		readln(precio);
		writeln('INGRESE CODIGO');
		readln(codigo);
		writeln('INGRESE TIPO');
		readln(tipo);
		total:= total + precio;
		procesar(precio,min1,min2,max,tipo,codigo,cod1,cod2,codmax);
	end;
	writeln('CODIGO DE LOS PRODUCTOS MAS BARATOS: ', cod1 ,cod2);
	writeln('CODIGO DEL PANTALON MAS CARO: ', codmax);
	writeln('PRECIO PROMEDIO: ', total/100);
end.
