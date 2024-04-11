program EJ3P1P2;

var
	aprobado, con7, nota:integer;
	nombre:string;
	

begin
	aprobado:= 0;
	con7:= 0; 
	
	
repeat	
	writeln('ingrese nombre');
	readln(nombre);
	writeln('ingrese nota');
	readln(nota);
	
	if (nota >= 8) then
		aprobado:= aprobado+1;
	if (nota = 7) then
		con7:= con7+1;
		
			
		
until nombre = 'Zidane Zinedine';		
	
writeln('cantidad de aprobados ', aprobado);
writeln('cantidad con 7 ', con7);


end.
