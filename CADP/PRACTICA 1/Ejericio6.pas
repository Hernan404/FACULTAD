{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.}

program EJ6P1;

var
	legajo:integer;
	promedio:integer;
	
	cantalu:integer;
	cantalumayor:integer;
	cantaludest:integer;

begin
	cantalu:=0;
	cantalumayor:=0;
	cantaludest:=0;
	legajo:=0;

	
	while (legajo <> -1) do begin
	
	writeln('ingrese legajo');
	readln(legajo);
	
	writeln('ingrese promedio');
	readln(promedio);
	
		cantalu:=cantalu+1;
		
		
		if (promedio > 6.5) then
			cantalumayor:=+1;
		
		if (promedio > 8.5) and (legajo < 2500)  then
			cantaludest:= +1;
		
	end;
		
	writeln('cantidad de alumnos ', cantalu);
	writeln('cantidad de alumnos con promedio alto ', cantalumayor);
	writeln('cantidad de alumnos destacados ', cantaludest);
		
		
end.
