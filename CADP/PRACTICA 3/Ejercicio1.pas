program Registros;
type
	str20 = string[20];
	alumno = record
	codigo : integer;
	nombre : str20;
	promedio : real;
	mejor_promedio: real;
end;
procedure leer(var alu : alumno; var cantAlu: integer);
begin

	writeln('Ingrese el codigo del alumno');
	readln(alu.codigo);
	if (alu.codigo <> 0) then begin
	cantAlu:= cantAlu +1;
	
	writeln('Ingrese el nombre del alumno'); 
	readln(alu.nombre);
	
	writeln('Ingrese el promedio del alumno'); 
	read(alu.promedio);
	end;
end;
	
end;

var
	a : alumno;
	cantAlu:integer;
{ cuerpo del programa principal }
begin
	cantAlu:= 0;
	a.mejor_promedio:= -1;
	while (alu.codigo <> 0) do begin
	leer(a,cantAlu);
	if (a.promedio > a.mejor_promedio) then
		a.mejor_promedio:= a.promedio;
	end;
	
	writeln('la cantidad de alumnos es: ', cantAlu);
	writeln('mejor promedio: ', a.mejor_promedio);
end.
