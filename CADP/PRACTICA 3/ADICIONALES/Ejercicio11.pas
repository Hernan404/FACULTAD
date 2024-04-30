Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por
sus aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de
llegada, cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa
ordenada por código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44.
Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda

program EJ11P3;
type
	data = record 
		codigo:integer;
		salida:string;
		llegada:string;
		cantKM:real;
		ocupacion:real;
	end;

procedure leer(var r:data);
begin 
	with r do begin 
		writeln('CODIGO');
		readln(codigo); 
		writeln('SALIDA');
		readln(salida);
		writeln('LLEGADA');
		readln(llegada);
		writeln('CANTKM');
		readln(cantKM);
		writeln('OCUPACION');
		readln(ocupacion);
	end;
end; 

procedure mayor(r:data; var max1,max2,cod1,cod2:real);
begin 
	if (r.cantKM > max1) then begin 
		max2:= max1; 
		cod2:= cod1;
		max1:= r.cantKM;
		cod1:= r.codigo;
	end
	else if (max1 > max2) then begin 
		max2:= r.cantKM;
		cod2:= r.codigo;
	end;
end;


procedure menor (r:data; var min1,min2,mcod1,mcod2:real);
begin 
	if (r.cantKM < min1) then begin 
		min2:= min1;
		mcod2:= mcod1;
		min1:= r.cantKM;
		mcod1:= r.codigo;
	end 
	else if (min1 < min2) then begin 
		min2:= r.cantKM;
		mcod2:= r.codigo;
	end;
end;


procedure procesardatos (var r:data);
var 
	cod1,cod2,mcod1,mcod2,max1,max2,min1,min2,maxP:integer;
	avionB,cantC,cantB,cantD:integer;
	paisB:string;
begin 
	max1:= -1; max2:= -1; min1:= 9999; min2:= 9999; cod1:= 0; cod2:= 0; mcod1:= 0; mcod2:= 0; maxP:= -1; cantC:= 0; cantD:= 0; paisB:= ''; cantB:= 0;
	while (r.codigo <> 44) do begin
 		mayor(r,max1,max2,cod1,cod2);
		menor(r,min1,min2,mcod1,mcod2);
		if (r.cantKM > 5.000) and (r.ocupacion > 60) then 
			cantC:= cantC +1;
		if (r.cantKM > 10.000) and ((r.llegada = 'australia') or (r.llegada = 'nueva zelanda')) then 
			cantD:= cantD +1;
		if (paisB = r.salida) then begin 
			cantB:= cantB+1;
			paisB:= r.llegada;
			if (cantB > maxP) then begin 
				maxP:= cantB;
				avionB:= r.codigo;
			end;
		end;
		leer(r);
	end;
	writeln('Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron: ', cod1, cod2, mcod1, mcod2);
	writeln('El avión que salió desde más países diferentes: ', avionB);
	writeln('La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión: ', cantC);
	writeln('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda: ', cantD);
end;



var 
	r:data;
begin 
	leer(r);
	procesardatos(r);
end.
