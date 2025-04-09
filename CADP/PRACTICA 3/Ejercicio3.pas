{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs.As,
 con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO
para el año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único
de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se
pide implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por
UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la
cantidad de alumnos y la cantidad de docentes)}



program EJ3P3;
type 
	datos = record 
		codigo:integer;
		nombre:string;
		cant_doce:integer;
		cant_alu:integer;
		localidad:string;
end;

procedure leer(var r:datos);
begin 
	with r do begin
		writeln('CODIGO');
		readln(codigo);
		writeln('NOMBRE');
		readln(nombre);
		writeln('CANTIDAD DE DOCENTES');
		readln(cant_doce);
		writeln('CANTIDAD DE ALUMNOS');
		readln(cant_alu);
		writeln('LOCALIDAD');
		readln(localidad);
	end;
end;
procedure procesar(r:datos; var cantA,c1,c2:integer; var n1,n2:string);
var 
	max1,max2,relacion: real;
begin 
	max1:= -1; max2:= -1;
	relacion:= r.cant_doce/r.cant_alu;
	
	if (relacion > 1) and (r.localidad = 'la plata') then 
		cantA:= cantA +1;
	
	if (relacion > max1) then begin 
		max2:= max1;
		c2:= c1;
		n2:= n1;
		max1:= relacion;
		c1:= r.codigo;
		n1:= r.nombre;
	end
	else if (max1 > max2) then begin 
		max2:= relacion;
		c2:= r.codigo;
		n2:= r.nombre;
	end;
end;
	
	
	
var 
	r:datos; 
	cantA:integer;
	c1,c2:integer;
	n1,n2:string;
	i:integer;
begin 
	cantA:= 0;
	c1:= 0;
	c2:=0;
	n1:= '';
	n2:='';
	
	for i:=1 to 2400 do begin 
		leer(r);
		procesar(r,cantA,c1,c2,n1,n2);
	end; 
	
	writeln('Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO: ', cantA);
	writeln('CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos: ', 'CODIGOS: ', c1 , c2 ,' NOMBRE: ',n1 , n2);
end.
