program EJ5P3;

type
	concesionaria = record
		marca:string;
		modelo:char;
		precio:real;
		
		cantMarcas:integer;
		precio_promedio:real;
		
		max:real;
		
		marca_cara:string;
		modelo_caro:string;
	end;
	
	

procedure leer (var c:concesionaria);
begin
	writeln('marca');
	readln(c.marca);
	c.cantMarcas:= c.cantMarcas +1;
	writeln('modelo');
	readln(c.modelo);
	writeln('precio');
	readln(c.precio);
end;

procedure promedio (var c:concesionaria);
begin
	c.precio_promedio:= c.precio / c.cantMarcas;
end;

procedure caro (var c:concesionaria);
begin
	if (c.precio > c.max) then begin
		c.max:= c.precio;
		c.marca_cara:= c.marca;
		c.modelo_caro:= c.modelo;
		
	end;
end;

var
	c:concesionaria;

begin
	c.max:= -1;
	
	while (c.marca <> 'ZZZ') do begin
		leer(c);
		caro(c);
	end;
	promedio(c);
	
	writeln('precio promedio por marca: ', c.precio_promedio);
	writeln('marca y modelo del mas caro: ', c.marca_cara , c.modelo_caro);
	

end.
