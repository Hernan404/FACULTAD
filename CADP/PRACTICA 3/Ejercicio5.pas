{Realizar un programa que lea información de autos que están a la venta en una
concesionaria. De cada auto se
lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca
 “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro}
program EJ5P3;
type 
	datos = record 
		marca:string;
		modelo:string;
		precio:real;
end;


procedure leer(var r:datos);
begin 
	with r do begin 
		writeln('MARCA');
		readln(marca);
		writeln('MODELO');
		readln(modelo);
		writeln('PRECIO');
		readln(precio);
	end;
end;

procedure proceso (r:datos; m1,o1:string; var max:real);
begin 	
	if (r.precio > max) then begin 
		max:= r.precio;
		m1:= r.marca;
		o1:= r.modelo;
	end;
end;

var 
	r:datos; 
	marcaACT:string;
	promedio,max:real;
	m1,o1:string;
	cant:integer;
begin 
	m1:= '';
	o1:= '';
	
	max:= -1;
	marcaACT:= '';
	leer(r);
	
	while (r.marca <> 'ZZZ') do begin 
		promedio:= 0;
		cant:= 0;
		marcaACT:= r.marca;
		while (r.marca = marcaACT) do begin 
			promedio:= promedio + r.precio;
			proceso(r,m1,o1,max); 
			cant:= cant +1;
			leer(r);
		
		end;
		
		writeln('El precio promedio por marca: ', promedio/cant);
	end;
	
	writeln('Marca y modelo del auto más caro. ', 'MARCA: ', m1, 'MODELO: ',o1);
	writeln('El precio promedio por marca: ', promedio/cant);
end.
