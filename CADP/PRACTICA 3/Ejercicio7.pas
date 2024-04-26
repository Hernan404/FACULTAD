Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por
universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.

program EJ7P3;
type 
	data = record 
		nombre:string;
		uni:string;
		cant_in:integer;
		cant_be:integer;
end;

procedure leer(var r:data);
begin
	with r do begin 
		writeln('NOMBRE');
		readln(nombre);
		writeln('UNIVERSIDAD');
		readln(uni);
		writeln('CANTIDAD DE INVESTIGADORES');
		readln(cant_in);
		writeln('CANTIDAD DE BECARIOS');
		readln(cant_be);
	end;
end; 

procedure mayor (r:data; var max:integer; var u1:string);
begin
	if (r.cant_in > max) then 
		max:= r.cant_in;
		u1:= r.uni;
end;

procedure menor (r:data; var min1,min2:integer; var c1,c2:string);
begin 
	if (r.cant_be < min1) then begin 
		min2:= min1;
		c2:= c1;
		min1:= r.cant_be;
		c1:= r.nombre;
	end
	else if (min1 < min2) then begin 
		min2:= r.cant_be;
		c2:= c1;
	end;
end;

var 
	r:data; 
	max,min1,min2,centrostotal:integer;
	u1,c1,c2,uniACT:string;
begin 
	max:= -1; min1:= 9999; min2:= 9999; c1:= ''; c2:= ''; u1:= '';
	
	leer(r);
	while (r.cant_in <> 0) do begin 
		uniACT:= r.uni;
		centrostotal:= 0;
		while (uniACT = r.uni) do begin 
			centrostotal:= centrostotal +1;
			mayor(r,max,u1);
			menor(r,min1,min2,c1,c2);
			leer(r);
		end;
		writeln('CENTROS DE LA UNIVERSIDAD ',uniACT, ':', centrostotal);
	end;
	writeln('Universidad con mayor cantidad de investigadores en sus centros: ', u1);
	writeln('Los dos centros con menor cantidad de becarios: ', c1 ,'y', c2);
end.

